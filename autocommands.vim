" Autocommands
if has("autocmd")


	" Autosource config files on saving. pluginlist.vim only works between
	" plug#begin() and plug#end()
	augroup vimrc-autosource
		autocmd!
		autocmd BufWritePost $VIMHOME/*.vim
					\ if expand('<afile>:t') !=# 'pluginlist.vim' | source <afile> | endif
	augroup END

	" Autoformatting
	" autocmd bufwritepost *.ts :Prettier <CR>
	"autocmd bufwritepost *.py :Black <CR>

	" autocmd BufWritePost *.py call CocAction('format')
	" Manually load syntax highlighting for some file extensions
	"
	au BufReadPost *.patch setlocal ft=diff
	au BufReadPost *.conf setlocal ft=conf
	au BufReadPost *.its setlocal syntax=dts
	au BufReadPost *.scr setlocal syntax=bash
	au BufReadPost *_defconfig setlocal syntax=config
	au BufReadPost *.h setlocal filetype=c
	"au BufReadPost * :ColorHighlight<CR>

	" Run retab on saving files
	"autocmd bufwritepost *.c,*.cpp retab

	" Activate Prettier plugin for various file extensions
	"let g:prettier#autoformat = 0
	" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
endif

" Stop highlighting after search has finished
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" autocmd FileType c ClangFormatAutoEnable
" autocmd FileType h ClangFormatAutoEnable
" autocmd FileType cpp ClangFormatAutoEnable
" autocmd FileType hpp ClangFormatAutoEnable


" JSON settings
au FileType json set filetype=jsonc

" Deduce header file type for C/C++
function! GuessHeaderFiletype() abort

  let base = expand('%:r')

  if filereadable(base . '.cpp') || filereadable(base . '.cc') ||
        \ filereadable(base . '.cxx')
    setf cpp
    return
  elseif filereadable(base . '.c')
    setf c
    return
  endif

  " Read first ~100 lines
  let l:lines = getline(1, min([100, line('$')]))
  let l:content = join(l:lines, "\n")

  " Word-based C++ hints
  let l:word_keywords = [
        \ 'class',
        \ 'constexpr',
        \ 'decltype',
        \ 'explicit',
        \ 'final',
        \ 'friend',
        \ 'mutable',
        \ 'namespace',
        \ 'noexcept',
        \ 'operator',
        \ 'override',
        \ 'private',
        \ 'protected',
        \ 'public',
        \ 'static_assert',
        \ 'template',
        \ 'this',
        \ 'typename',
        \ 'using',
        \ 'virtual',
        \ ]

  " Pattern-based hints (not word-boundary safe)
  let l:pattern_keywords = [
        \ '<[A-Za-z_]\+>',
        \ '\<std::[a-zA-Z_]',
        \ ]

  " Check word-based keywords
  for kw in l:word_keywords
    if l:content =~# '\<' . kw . '\>'
      setf cpp
      return
    endif
  endfor

  " Check pattern-based keywords
  for kw in l:pattern_keywords
    if l:content =~# kw
      setf cpp
      return
    endif
  endfor

  setf c
endfunction

augroup HeaderGuess
  autocmd!
  autocmd BufRead,BufNewFile,BufEnter *.h call GuessHeaderFiletype()
augroup END
