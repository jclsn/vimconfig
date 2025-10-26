set encoding=utf-8
set nocompatible

let $VIMHOME = $MYVIMDIR

call plug#begin('$VIMHOME/plugged')
	so $VIMHOME/pluginlist.vim
call plug#end()

" ++++++++++++++++++++++++************************
"						User
" ++++++++++++++++++++++++************************
let g:tmpl_author_email = 'jan.claussen10@web.de'
let g:tmpl_author_name = 'Jan Claussen'

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************

so $VIMHOME/pastes.vim
so $VIMHOME/remaps.vim
so $VIMHOME/autocommands.vim
so $VIMHOME/folds.vim
so $VIMHOME/commands.vim

if has_key(plugs, 'vim-airline')
	so $VIMHOME/airlinerc.vim
endif
if has_key(plugs, 'vimspector')
	so $VIMHOME/vimspectorrc.vim
endif
if has_key(plugs, 'coc.nvim')
	so $VIMHOME/cocrc.vim
endif
if has_key(plugs, 'lsp')
	so $VIMHOME/lsp.vim
endif
if has_key(plugs, 'fern.vim')
	so $VIMHOME/fernrc.vim
endif
if has_key(plugs, 'vim-cmake')
	so $VIMHOME/cmakerc.vim
endif
if has_key(plugs, 'vim-qt')
	so $VIMHOME/qt.vim
endif
if has_key(plugs, 'zeavim.vim')
	so $VIMHOME/zeavimrc.vim
endif
if has_key(plugs, 'vim-slime')
	so $VIMHOME/slimerc.vim
endif
if has_key(plugs, 'rainbow')
	so $VIMHOME/rainbowrc.vim
endif
if has_key(plugs, 'git-lens.vim')
	so $VIMHOME/git-lens.vim
endif
if has_key(plugs, 'vim-fugitive')
	so $VIMHOME/fugitiverc.vim
endif
if has_key(plugs, 'vim-doge')
	so $VIMHOME/dogerc.vim
endif
if has_key(plugs, 'fugitive-gitlab.vim') && !empty(glob('$VIMHOME/fugitive-gitlab.vim'))
	so $VIMHOME/fugitive-gitlab.vim
endif
if has_key(plugs, 'vim-gitgutter')
	so $VIMHOME/gitgutterrc.vim
endif
if has_key(plugs, 'ConflictMotions')
	so $VIMHOME/conflictmotions.vim
endif
if has_key(plugs, 'lexima.vim')
	so $VIMHOME/leximarc.vim
endif

" Always apply these settings last
so $VIMHOME/vim9functions.vim
so $VIMHOME/themeconfig.vim
so $VIMHOME/miscellaneous.vim
