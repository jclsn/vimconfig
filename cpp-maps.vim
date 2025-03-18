vim9script

def CtorConvert(ctor: string)

  var args = ""
  var class_name = ""

  # Find the opening parenthesis for arguments (if any) within the current line
  var lnum = line(".")
  var has_parens = search('(', 'c', lnum) != 0

  # If parentheses are found, yank their content
  if has_parens
    normal! di(
    args = getreg('"')
    normal! da(
  endif

  # Move back to the 'new' keyword
  call search('new', 'b', lnum)

  # Mark the position
  normal! mz

  # Delete 'new' and capture the class name
  normal! dw
  normal! diw
  class_name = getreg('"')

  # Insert smart pointer constructor
  execute "normal!  i" .. ctor .. "<" .. class_name .. ">"

  # Add parentheses based on args
  if args == ""
    normal! a()
  else
    execute "normal! a(" .. args .. ")"
  endif

  # Jump back to the mark
  normal! `z
enddef

def PtrConvert(ptr_type: string)

  var class_name = ""

  # Find and delete the asterisk
  normal! f*x

  # Jump back to the beginning of the constructor and mark the position
  normal! bmz

  # Delete and yank the class name into a variable
  normal! diw
  class_name = getreg('"')

  # Insert smart pointer constructor
  execute "normal!  i" .. ptr_type .. "<" .. class_name .. ">"

  # Jump back to the mark
  normal! `z
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
