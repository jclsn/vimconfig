" Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
"filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex""
let g:vimtex_quickfix_mode=1
nmap <localleader>ll :VimtexCompile<CR>

let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'texlab',
  \     'cmdline': [ '/usr/bin/texlab'],
  \     'filetypes': [ 'tex' ]
  \   }
  \ ]
" Also, this installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
