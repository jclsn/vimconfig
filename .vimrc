set encoding=utf-8

call plug#begin('~/.vim/plugged')
so ~/.vim/pluginlist.vim
call plug#end()

" ++++++++++++++++++++++++************************
"						User
" ++++++++++++++++++++++++************************
let g:tmpl_author_email = 'jan.claussen10@web.de'
let g:tmpl_author_name = 'Jan Claussen'

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************
so ~/.vim/ultisnipsrc.vim
" so ~/.vim/ycmrc.vim
so ~/.vim/remaps.vim
" so ~/.vim/vimtexrc.vim
so ~/.vim/vimspectorrc.vim
so ~/.vim/fugitiverc.vim
so ~/.vim/cocrc.vim
so ~/.vim/autocommands.vim
so ~/.vim/ctags.vim
so ~/.vim/urlhandler.vim
"so ~/.vim/kitty.vim
so ~/.vim/folds.vim
so ~/.vim/commands.vim
so ~/.vim/abbreviations.vim
so ~/.vim/fernrc.vim
so ~/.vim/cmakerc.vim

" Always apply these settings last
so ~/.vim/themeconfig.vim
so ~/.vim/miscellaneous.vim
