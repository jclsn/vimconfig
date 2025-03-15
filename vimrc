set encoding=utf-8
set nocompatible

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
so ~/.vim/folds.vim
so ~/.vim/commands.vim

if has_key(plugs, 'vimspector')
	so ~/.vim/vimspectorrc.vim
endif
if has_key(plugs, 'coc.nvim')
	so ~/.vim/cocrc.vim
endif
if has_key(plugs, 'lsp')
	so ~/.vim/lsp.vim
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
if has_key(plugs, 'git-lens.vim')
	so ~/.vim/git-lens.vim
endif
if has_key(plugs, 'vim-fugitive')
	so ~/.vim/fugitiverc.vim
endif
if has_key(plugs, 'vim-doge')
	so ~/.vim/dogerc.vim
endif
if has_key(plugs, 'fugitive-gitlab.vim') && !empty(glob('~/.vim/fugitive-gitlab.vim'))
	so ~/.vim/fugitive-gitlab.vim
endif
if has_key(plugs, 'vim-gitgutter')
	so ~/.vim/gitgutterrc.vim
endif

" Always apply these settings last
so ~/.vim/vim9functions.vim
so ~/.vim/themeconfig.vim
so ~/.vim/miscellaneous.vim


