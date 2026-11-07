vim9script

# Maximum number of lines a `new` expression (including its arguments) may span
const max_expr_lines = 200

def IsIdentChar(c: string): bool
  return c =~# '^\w$'
enddef

# Skip a string or char literal starting at chars[i] (which is " or ').
# Returns the index of the closing quote.
def SkipLiteral(chars: list<string>, i: number): number
  const quote = chars[i]
  var j = i + 1
  while j < len(chars)
    if chars[j] == '\'
      j += 2
      continue
    endif
    if chars[j] == quote
      return j
    endif
    j += 1
  endwhile
  return len(chars) - 1
enddef

# Given chars[i] is an opening bracket, return the index of its matching
# closing bracket. Template angle brackets are only tracked when `angles`
# is set, and are ignored inside (), [] and {}.
def MatchForward(chars: list<string>, i: number, angles: bool): number
  var stack: list<string> = []
  const pairs = {'(': ')', '[': ']', '{': '}', '<': '>'}
  var j = i
  while j < len(chars)
    const c = chars[j]
    if c == '"' || c == "'"
      j = SkipLiteral(chars, j)
    elseif has_key(pairs, c) && (c != '<' || (angles && (empty(stack) || stack[-1] == '>')))
      add(stack, pairs[c])
    elseif !empty(stack) && c == stack[-1]
      remove(stack, -1)
      if empty(stack)
        return j
      endif
    endif
    j += 1
  endwhile
  return -1
enddef

# Given chars[i] is a closing bracket, return the index of its matching
# opening bracket (no literal handling, used for single-line type scanning).
def MatchBackward(chars: list<string>, i: number): number
  const pairs = {')': '(', ']': '[', '}': '{', '>': '<'}
  var stack: list<string> = []
  var j = i
  while j >= 0
    const c = chars[j]
    if has_key(pairs, c) && (c != '>' || empty(stack) || stack[-1] == '<')
      add(stack, pairs[c])
    elseif !empty(stack) && c == stack[-1]
      remove(stack, -1)
      if empty(stack)
        return j
      endif
    endif
    j -= 1
  endwhile
  return -1
enddef

def Trim(s: string): string
  return substitute(s, '^\_s\+\|\_s\+$', '', 'g')
enddef

# Find the `new` keyword to convert: the one under/before the cursor on the
# current line, otherwise the first one after the cursor on the current line.
def FindNew(): list<number>
  const lnum = line('.')
  var pos = searchpos('\<new\>', 'bcnW', lnum)
  if pos[0] == 0
    pos = searchpos('\<new\>', 'cnW', lnum)
  endif
  return pos
enddef

# Convert `new T(args)` / `new T{args}` / `new T` / `new T[n]` into
# `ctor<T>(args)` / `ctor<T[]>(n)`. Handles namespaces, nested templates,
# nested calls in the arguments and arguments spanning several lines.
def CtorConvert(ctor: string)
  const [lnum, col] = FindNew()
  if lnum == 0
    echohl ErrorMsg | echo "No 'new' expression found on this line" | echohl None
    return
  endif

  const last = min([line('$'), lnum + max_expr_lines])
  const first_line = getline(lnum)
  const prefix = strpart(first_line, 0, col - 1)
  const text = join([strpart(first_line, col - 1)] + getline(lnum + 1, last), "\n")
  const chars = split(text, '\zs')
  const n = len(chars)

  # Skip the 'new' keyword
  var i = 3

  # Parse the type: everything up to (, {, [ or a terminator at depth 0
  const type_start = i
  while i < n
    const c = chars[i]
    if c == '<'
      const close = MatchForward(chars, i, true)
      if close < 0
        echohl ErrorMsg | echo "Unbalanced template brackets" | echohl None
        return
      endif
      i = close + 1
      continue
    endif
    if c =~ '[({\[;,)}\]=]'
      break
    endif
    i += 1
  endwhile
  var type = Trim(join(chars[type_start : i - 1], ''))
  if type == ''
    echohl ErrorMsg | echo "Could not determine the type after 'new'" | echohl None
    return
  endif

  # Parse the (optional) initializer
  var args = ''
  var end_idx = i   # first char index not consumed
  # Look past whitespace for the initializer
  var k = i
  while k < n && chars[k] =~ '\_s'
    k += 1
  endwhile
  if k < n && chars[k] =~ '[({\[]'
    const close = MatchForward(chars, k, false)
    if close < 0
      echohl ErrorMsg | echo "Unbalanced brackets in initializer" | echohl None
      return
    endif
    args = join(chars[k + 1 : close - 1], '')
    if chars[k] == '['
      type ..= '[]'
    endif
    end_idx = close + 1
  else
    # No initializer: do not eat trailing whitespace
    end_idx = i
    while end_idx > type_start && chars[end_idx - 1] =~ '\_s'
      end_idx -= 1
    endwhile
  endif

  const replacement = ctor .. '<' .. type .. '>(' .. args .. ')'

  # Splice the replacement back into the buffer
  const consumed = join(chars[: end_idx - 1], '')
  const end_lnum = lnum + count(consumed, "\n")
  const rest_lines = split(join(chars[end_idx :], ''), "\n", 1)
  const new_lines = split(prefix .. replacement .. rest_lines[0], "\n", 1)
  const old_count = end_lnum - lnum + 1

  # Replace only the lines the expression spanned
  if len(new_lines) > old_count
    setline(lnum, new_lines[: old_count - 1])
    append(end_lnum, new_lines[old_count :])
  else
    setline(lnum, new_lines)
    if old_count > len(new_lines)
      deletebufline('%', lnum + len(new_lines), end_lnum)
    endif
  endif

  cursor(lnum, col)
enddef

# Convert a raw pointer type `T*` (T may be qualified, templated, const, ...)
# into `ptr_type<T>`. Uses the `*` under/after the cursor, or the last one
# before the cursor on the current line.
def PtrConvert(ptr_type: string)
  const lnum = line('.')
  const line = getline(lnum)
  const chars = split(line, '\zs')
  const n = len(chars)
  const cur = charcol('.') - 1

  # Locate the '*'
  var star = -1
  for j in range(cur, n - 1)
    if chars[j] == '*'
      star = j
      break
    endif
  endfor
  if star < 0
    for j in range(min([cur, n - 1]), 0, -1)
      if chars[j] == '*'
        star = j
        break
      endif
    endfor
  endif
  if star < 0
    echohl ErrorMsg | echo "No '*' found on this line" | echohl None
    return
  endif

  # Scan backwards over the type
  var i = star - 1
  while i >= 0 && chars[i] =~ '\s'
    i -= 1
  endwhile
  const type_end = i
  while i >= 0
    const c = chars[i]
    if c == '>'
      const open = MatchBackward(chars, i)
      if open < 0
        break
      endif
      i = open - 1
    elseif IsIdentChar(c) || c == ':'
      i -= 1
    else
      break
    endif
  endwhile
  var type_start = i + 1

  # Include preceding qualifiers / multi-word builtin types
  while true
    var j = type_start - 1
    while j >= 0 && chars[j] =~ '\s'
      j -= 1
    endwhile
    var word_end = j
    while j >= 0 && IsIdentChar(chars[j])
      j -= 1
    endwhile
    const word = join(chars[j + 1 : word_end], '')
    if word =~# '^\%(const\|volatile\|unsigned\|signed\|long\|short\|struct\|class\|enum\)$'
      type_start = j + 1
    else
      break
    endif
  endwhile

  const type = join(chars[type_start : type_end], '')
  if type == ''
    echohl ErrorMsg | echo "Could not determine the pointee type" | echohl None
    return
  endif

  var replacement = ptr_type .. '<' .. type .. '>'
  const after = join(chars[star + 1 :], '')
  if after =~ '^\w'
    replacement ..= ' '
  endif

  const before = join(chars[: type_start - 1], '')
  setline(lnum, (type_start > 0 ? before : '') .. replacement .. after)
  cursor(lnum, strlen(type_start > 0 ? before : '') + 1)
enddef

command -nargs=0 ToMakeShared CtorConvert("std::make_shared")
command -nargs=0 ToMakeUnique CtorConvert("std::make_unique")
command -nargs=0 ToSharedPtr PtrConvert("std::shared_ptr")
command -nargs=0 ToUniquePtr PtrConvert("std::unique_ptr")
command -nargs=0 ToWeakPtr PtrConvert("std::weak_ptr")

nnoremap <silent><leader>tms :ToMakeShared<CR>
nnoremap <silent><leader>tmu :ToMakeUnique<CR>
nnoremap <silent><leader>tsp :ToSharedPtr<CR>
nnoremap <silent><leader>tup :ToUniquePtr<CR>
nnoremap <silent><leader>twp :ToWeakPtr<CR>
