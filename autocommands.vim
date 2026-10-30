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
  augroup vimrc-filetypes
    autocmd!
    autocmd BufReadPost *.patch setlocal ft=diff
    autocmd BufReadPost *.conf setlocal ft=conf
    autocmd BufReadPost *.its setlocal syntax=dts
    autocmd BufReadPost *.scr setlocal syntax=bash
    autocmd BufReadPost *_defconfig setlocal syntax=config
    autocmd FileType json set filetype=jsonc
  augroup END
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
