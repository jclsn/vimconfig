set encoding=utf-8
set termencoding=utf-8
set nocompatible

if has('QNX')
  let $MYVIMDIR = '/home/jan/.vim'
endif

" Directory of this config. Resolve symlinks like ~/.vimrc -> ~/.vim/vimrc and
" fall back to my home when the vimrc was copied, e.g. to /root/.vimrc
if empty($VIMHOME)
  let $VIMHOME = fnamemodify(resolve(expand('<sfile>:p')), ':h')
  if !filereadable($VIMHOME . '/pluginlist.vim')
    let $VIMHOME = has('win32') ? expand('~/vimfiles') : '/home/jan/.vim'
  endif
endif

call plug#begin('$VIMHOME/plugged')
source $VIMHOME/pluginlist.vim
call plug#end()

" ++++++++++++++++++++++++************************
"                                               User
" ++++++++++++++++++++++++************************
let g:tmpl_author_email = 'jan.claussen10@web.de'
let g:tmpl_author_name = 'Jan Claussen'

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************

source $VIMHOME/pastes.vim
source $VIMHOME/remaps.vim
source $VIMHOME/autocommands.vim
source $VIMHOME/folds.vim
source $VIMHOME/commands.vim

if has_key(plugs, 'vim-airline')
  source $VIMHOME/airlinerc.vim
endif
if has_key(plugs, 'vimspector')
  source $VIMHOME/vimspectorrc.vim
endif
if has_key(plugs, 'coc.nvim')
  source $VIMHOME/cocrc.vim
endif
if has_key(plugs, 'lsp')
  source $VIMHOME/lsp.vim
endif
if has_key(plugs, 'fern.vim')
  source $VIMHOME/fernrc.vim
endif
if has_key(plugs, 'vim-cmake')
  source $VIMHOME/cmakerc.vim
endif
if has_key(plugs, 'vim-qt')
  source $VIMHOME/qt.vim
endif
if has_key(plugs, 'zeavim.vim')
  source $VIMHOME/zeavimrc.vim
endif
if has_key(plugs, 'vim-slime')
  source $VIMHOME/slimerc.vim
endif
if has_key(plugs, 'rainbow')
  source $VIMHOME/rainbowrc.vim
endif
if has_key(plugs, 'git-lens.vim')
  source $VIMHOME/git-lens.vim
endif
if has_key(plugs, 'vim-fugitive')
  source $VIMHOME/fugitiverc.vim
endif
if has_key(plugs, 'vim-doge')
  source $VIMHOME/dogerc.vim
endif
if has_key(plugs, 'fugitive-gitlab.vim') && !empty(glob('$VIMHOME/fugitive-gitlab.vim'))
  source $VIMHOME/fugitive-gitlab.vim
endif
if has_key(plugs, 'vim-gitgutter')
  source $VIMHOME/gitgutterrc.vim
endif
if has_key(plugs, 'ConflictMotions')
  source $VIMHOME/conflictmotions.vim
endif
if has_key(plugs, 'lexima.vim')
  source $VIMHOME/leximarc.vim
endif
if has_key(plugs, 'vim-vsnip')
  source $VIMHOME/vsniprc.vim
endif

" Always apply these settings last
source $VIMHOME/vim9functions.vim
source $VIMHOME/themeconfig.vim
source $VIMHOME/miscellaneous.vim
