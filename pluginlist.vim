" Commands for plugins that have hard dependencies
command! -nargs=+ NodePlug if executable('node') | execute 'Plug ' . <q-args> | endif
command! -nargs=+ PyPlug if has('python3') | execute 'Plug ' . <q-args> | endif
command! -nargs=+ Vim9Plug if has('vim9script') | execute 'Plug ' . <q-args> | endif

" ################# Code completion #################
Plug 'honza/vim-snippets'
PyPlug 'SirVer/ultisnips'
" NodePlug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'rafamadriz/friendly-snippets'

Vim9Plug 'yegappan/lsp', { 'do': 'git fetch --unshallow' }
" Vim9Plug 'https://github.com/jclsn/lsp', {'branch': 'fix/autopair-plugin-conflict', 'do': 'git fetch --unshallow' }


" ################## Code Formatting ####################
Plug 'ambv/black', { 'for': [ 'python' ] }
Plug 'bigfish/vim-stylelint'
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'vim-autoformat/vim-autoformat'
Plug 'zeekay/vim-beautify'


" ################# Python-dependent #################
PyPlug 'puremourning/vimspector'
" Plug 'szw/vim-maximizer'


" ################### Git ####################
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Conflict handling
Plug 'vim-scripts/ConflictMotions'
Plug 'vim-scripts/CountJump'       " Dependency for ConflictMotions
Plug 'vim-scripts/ingo-library'    " Dependency for ConflictMotions


" ############# Look and feel ###############
" Syntax
Plug 'habamax/vim-rst'                " reStructuredtext
Plug 'luochen1990/rainbow'            " Multicolor parentheses and brackets
Plug 'm-pilia/vim-pkgbuild'           " Arch Linux PKGBUILD
Plug 'martinlroth/vim-devicetree'     " Linux devicetree
Plug 'westeri/asl-vim'                " ACPI source language
Plug 'wgwoods/vim-systemd-syntax'     " Systemd unit files
Plug 'yuezk/vim-js'                   " Javascript

" Icons
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jclsn/spaceduck', { 'branch': 'dev',  'do': 'git fetch --unshallow'}
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'vv9k/vim-github-dark'

" Airline bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Roy-Orbison/airline-colour-splits'

" Color color codes
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'


" ################## Miscellaneous #############################
Plug 'andrewstuart/vim-kubernetes'
Plug 'chrisbra/matchit'
" Plug 'gergap/vim-ollama'
Plug 'godlygeek/tabular'
NodePlug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/vim-peekaboo'
Plug 'lervag/vimtex', { 'for': [ 'tex' ] }
Plug 'markonm/traces.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/vim-markdown', { 'for': [ 'markdown' ] }
Plug 'psliwka/vim-smoothie'
Plug 'cohama/lexima.vim'


" ################# PROGRAMMING LANGUAGES ####################

" ----------- Assembly --------------
Plug 'yegappan/disassemble'

" -------------- C --------------
Plug 'pulkomandy/c.vim', { 'for': [ 'c' ] }
Plug 'ericcurtin/CurtineIncSw.vim'
" Plug 'gregkh/kernel-coding-style'

" ------------- C++ --------------
Plug 'bfrg/vim-c-cpp-modern', { 'for': [ 'c', 'cpp' ] }

" ------------- CMake --------------
Plug 'ReverentEngineer/vim-cmake', { 'for': [ 'c', 'cpp' ] }
Plug 'pboettch/vim-cmake-syntax', { 'for': [ 'cmake' ] }

" ------------- Go --------------
Plug 'fatih/vim-go', { 'for': [ 'go' ] }
Plug 'charlespascoe/vim-go-syntax', { 'for': [ 'go' ] }

" ------------ Julia ---------------
Plug 'JuliaEditorSupport/julia-vim', { 'for': [ 'julia' ] }

" ------------ Rust ------------
Plug 'rust-lang/rust.vim', { 'for': [ 'rust'] }


" ################## Tools #############################

" Docs
Plug 'jclsn/vim-man', { 'on': ['Man', 'Vman'] }
Plug 'KabbAmine/zeavim.vim', { 'on': 'Zeavim' }

" Fern
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-mapping-git.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'

" Search engines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-browser-search'

" Startify
Plug 'mhinz/vim-startify'

" Tim Pope's plugins
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize' " test
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'

Vim9Plug 'Eliot00/git-lens.vim'
Vim9Plug 'bfrg/vim-fzy'

" My plugins
Plug 'https://github.com/jclsn/glow.vim', { 'for': ['markdown.pandoc', 'markdown'] }
Plug 'https://github.com/jclsn/more-todos.vim', { 'do': 'git fetch --unshallow' }
Plug 'https://github.com/jclsn/vim-bitbake.git', { 'do': 'git fetch --unshallow' }
Plug 'https://github.com/jclsn/vim-templates', { 'do': 'git fetch --unshallow' }
" Plug 'https://github.com/jclsn/pkl-vim', { 'do': 'git fetch --unshallow' }
" Plug 'https://github.com/jclsn/pkl-neovim', {'branch': 'main', 'do': 'git fetch --unshallow' }
Vim9Plug 'https://github.com/jclsn/vim-qt', { 'do': 'git fetch --unshallow' }
Vim9Plug 'https://github.com/jclsn/vimspector-templates', { 'do': 'git fetch --unshallow' }
