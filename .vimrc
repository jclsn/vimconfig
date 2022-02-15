set encoding=utf-8

call plug#begin('~/.vim/plugged')
so ~/.vim/pluginlist.vim
call plug#end()

" ++++++++++++++++++++++++************************
"						User
" ++++++++++++++++++++++++************************
let g:tmpl_author_email = 'claussen.j@eppendorf.de'
let g:tmpl_author_name = 'Jan Claussen'

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************
so ~/.vim/remaps.vim
"so ~/.vim/ultisnipsrc.vim
"so ~/.vim/ycmrc.vim
"so ~/.vim/vimtexrc.vim
so ~/.vim/vimspectorrc.vim
so ~/.vim/fugitiverc.vim
so ~/.vim/cocrc.vim
so ~/.vim/autocommands.vim
so ~/.vim/ctags.vim
so ~/.vim/urlhandler.vim
"so ~/.vim/kitty.vim
so ~/.vim/folds.vim
so ~/.vim/miscellaneous.vim
so ~/.vim/themeconfig.vim
