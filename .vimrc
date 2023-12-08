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

so ~/.vim/pastes.vim
so ~/.vim/remaps.vim
so ~/.vim/autocommands.vim
so ~/.vim/ctags.vim
so ~/.vim/urlhandler.vim
so ~/.vim/folds.vim
so ~/.vim/commands.vim
so ~/.vim/abbreviations.vim

if has_key(plugs, 'ultisnips')
	so ~/.vim/ultisnipsrc.vim
endif
if has_key(plugs, 'codeium.vim')
	so ~/.vim/codeiumrc.vim
endif
if has_key(plugs, 'vimspector')
	so ~/.vim/vimspectorrc.vim
endif
if has_key(plugs, 'vim-fugitive')
	so ~/.vim/fugitiverc.vim
endif
if has_key(plugs, 'coc.nvim')
	so ~/.vim/cocrc.vim
endif
if has_key(plugs, 'fern.vim')
	so ~/.vim/fernrc.vim
endif
if has_key(plugs, 'vim-cmake')
	so ~/.vim/cmakerc.vim
endif
if has_key(plugs, 'zeavim.vim')
	so ~/.vim/zeavimrc.vim
endif
if has_key(plugs, 'vim-slime')
	so ~/.vim/slimerc.vim
endif
if has_key(plugs, 'rainbow')
	so ~/.vim/rainbowrc.vim
endif

" Always apply these settings last
so ~/.vim/themeconfig.vim
so ~/.vim/miscellaneous.vim
