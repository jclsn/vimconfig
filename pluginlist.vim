" ################# Code completion #################
Plug 'honza/vim-snippets'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'rafamadriz/friendly-snippets'
Plug 'yegappan/lsp'
" Plug 'git@github.com:jclsn/lsp', {'branch': 'custom-request-support'}


" ################## Code Formatting ####################
Plug 'ambv/black', { 'for': [ 'python' ] }
Plug 'bigfish/vim-stylelint'
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'vim-autoformat/vim-autoformat'
Plug 'zeekay/vim-beautify'


" ################# Debugging #################
if has('python3')
	Plug 'puremourning/vimspector'
endif
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
Plug 'bfrg/vim-c-cpp-modern'          " Better C++ highlighting
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
Plug 'jclsn/spaceduck', { 'branch': 'dev' }
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'vv9k/vim-github-dark'

" Airline bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Roy-Orbison/airline-colour-splits'

" Color color codes
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'


" ################## Miscellaneous #############################
Plug 'andrewstuart/vim-kubernetes'
Plug 'chrisbra/matchit'
" Plug 'gergap/vim-ollama'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'jpalardy/vim-slime'
Plug 'junegunn/vim-peekaboo'
Plug 'lervag/vimtex'
Plug 'markonm/traces.vim'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/vim-markdown'
Plug 'psliwka/vim-smoothie'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }


" ################# PROGRAMMING LANGUAGES ####################

" ----------- Assembly --------------
Plug 'yegappan/disassemble'

" -------------- C --------------
Plug 'pulkomandy/c.vim', { 'for': [ 'c' ] }
Plug 'ericcurtin/CurtineIncSw.vim'

" ------------- C++ --------------
Plug 'ReverentEngineer/vim-cmake', { 'for': [ 'c', 'cpp' ] }

" ------------ Julia ---------------
Plug 'JuliaEditorSupport/julia-vim'

" ------------ Rust ------------
Plug 'rust-lang/rust.vim', { 'for': [ 'rs'] }


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
" Plug 'github/copilot.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize' " test
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'

" My plugins
Plug 'git@github.com:jclsn/glow.vim', { 'for': ['markdown.pandoc', 'markdown'] }
Plug 'git@github.com:jclsn/more-todos.vim'
Plug 'git@github.com:jclsn/vim-PairTools.git'
Plug 'git@github.com:jclsn/vim-bitbake.git'
Plug 'git@github.com:jclsn/vim-templates'
" Plug 'git@github.com:jclsn/pkl-vim'
Plug 'git@github.com:jclsn/pkl-neovim', {'branch': 'main'}


" ################## vim9script plugins #############################
if has('vim9script')
	Plug 'Eliot00/git-lens.vim'
	Plug 'bfrg/vim-fzy'

	Plug 'git@github.com:jclsn/vim-qt'
	Plug 'git@github.com:jclsn/vimspector-templates'
endif
