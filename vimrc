set encoding=utf-8
set nocompatible

call plug#begin('$MYVIMDIR/plugged')
	so $MYVIMDIR/pluginlist.vim
call plug#end()

" ++++++++++++++++++++++++************************
"						User
" ++++++++++++++++++++++++************************
let g:tmpl_author_email = 'jan.claussen10@web.de'
let g:tmpl_author_name = 'Jan Claussen'

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************

so $MYVIMDIR/pastes.vim
so $MYVIMDIR/remaps.vim
so $MYVIMDIR/autocommands.vim
so $MYVIMDIR/folds.vim
so $MYVIMDIR/commands.vim

if has_key(plugs, 'vim-airline')
	so $MYVIMDIR/airlinerc.vim
endif
if has_key(plugs, 'vimspector')
	so $MYVIMDIR/vimspectorrc.vim
endif
if has_key(plugs, 'coc.nvim')
	so $MYVIMDIR/cocrc.vim
endif
if has_key(plugs, 'lsp')
	so $MYVIMDIR/lsp.vim
endif
if has_key(plugs, 'fern.vim')
	so $MYVIMDIR/fernrc.vim
endif
if has_key(plugs, 'vim-cmake')
	so $MYVIMDIR/cmakerc.vim
endif
if has_key(plugs, 'vim-qt')
	so $MYVIMDIR/qt.vim
endif
if has_key(plugs, 'zeavim.vim')
	so $MYVIMDIR/zeavimrc.vim
endif
if has_key(plugs, 'vim-slime')
	so $MYVIMDIR/slimerc.vim
endif
if has_key(plugs, 'rainbow')
	so $MYVIMDIR/rainbowrc.vim
endif
if has_key(plugs, 'git-lens.vim')
	so $MYVIMDIR/git-lens.vim
endif
if has_key(plugs, 'vim-fugitive')
	so $MYVIMDIR/fugitiverc.vim
endif
if has_key(plugs, 'vim-doge')
	so $MYVIMDIR/dogerc.vim
endif
if has_key(plugs, 'fugitive-gitlab.vim') && !empty(glob('$MYVIMDIR/fugitive-gitlab.vim'))
	so $MYVIMDIR/fugitive-gitlab.vim
endif
if has_key(plugs, 'vim-gitgutter')
	so $MYVIMDIR/gitgutterrc.vim
endif
if has_key(plugs, 'ConflictMotions')
	so $MYVIMDIR/conflictmotions.vim
endif

" Always apply these settings last
so $MYVIMDIR/vim9functions.vim
so $MYVIMDIR/themeconfig.vim
so $MYVIMDIR/miscellaneous.vim


