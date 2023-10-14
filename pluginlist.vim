
" ################# Code completion #################
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Exafunction/codeium.vim'


" ################## Code Formatting ####################

Plug 'ambv/black', { 'for': [ 'python' ] }
Plug 'bigfish/vim-stylelint'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'vim-autoformat/vim-autoformat'
Plug 'zeekay/vim-beautify'


" ################# Debugging #################
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'


" ############# Look and feel ###############
"
" Syntax 
Plug 'frazrepo/vim-rainbow'
Plug 'm-pilia/vim-pkgbuild'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'westeri/asl-vim'

" Icons
Plug 'ryanoasis/vim-devicons'

" Colorschemes
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'jclsn/spaceduck', { 'branch': 'dev' }
Plug 'tomasiser/vim-code-dark'

" Airline bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AnthonyDiGirolamo/airline-themes'
Plug 'Roy-Orbison/airline-colour-splits'

" Color color codes
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'


" ################## Miscellaneous #############################

Plug 'jasonccox/vim-wayland-clipboard'
Plug 'andrewstuart/vim-kubernetes'
Plug 'pseewald/vim-anyfold'

" ################# PROGRAMMING LANGUAGES ####################

" ----------- Assembly --------------
Plug 'wsdjeg/vim-assembly', { 'for': ['agc', 'S', 'X68'] }
Plug 'yegappan/disassemble'

" -------------- C --------------
Plug 'pulkomandy/c.vim', { 'for': [ 'c' ] }											
Plug 'ericcurtin/CurtineIncSw.vim'							    " Toggle between .c and .h buffers with F2

" ------------- C++ --------------
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'cpp' ] }
Plug 'ReverentEngineer/vim-cmake', { 'for': [ 'c', 'cpp' ] }

" ------------ Rust ------------
" Plug 'mattn/webapi-vim'
Plug 'rust-lang/rust.vim', { 'for': [ 'rs'] }

" ################## Tools #############################

" Docs
Plug 'vim-utils/vim-man', { 'on': 'Man' }										" man.vim Plugin
Plug 'KabbAmine/zeavim.vim', { 'on': 'Zeavim' }

" Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-mapping-git.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'

" Other
Plug '0xStabby/chatgpt-vim'
Plug 'adelarsq/vim-matchit'
Plug 'godlygeek/tabular'										" Tabular plugin
Plug 'https://gitlab.com/mcepl/vim-diff_navigator.git'
Plug 'markonm/traces.vim'
Plug 'mileszs/ack.vim'											" Ack search plugin
Plug 'ntpeters/vim-better-whitespace'						    " Show trailing whitespaces
Plug 'junegunn/vim-peekaboo'

" Search engines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bfrg/vim-fzy'
Plug 'voldikss/vim-browser-search'							    " Browser search

" Startify
Plug 'mhinz/vim-startify'

" Tim Pope's plugins
" Plug 'github/copilot.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" My plugins
Plug 'git@github.com:jclsn/glow.vim', { 'for': ['markdown.pandoc', 'markdown'] }
Plug 'git@github.com:jclsn/h2cppx-vim', { 'for': ['c', 'cpp'] }
Plug 'git@github.com:jclsn/more-todos.vim'
Plug 'git@github.com:jclsn/vim-PairTools.git'				    " Auto-closing for brackets etc.
Plug 'git@github.com:jclsn/vim-bitbake.git'
Plug 'git@github.com:jclsn/vim-templates'								    " Templates plugin
Plug 'git@github.com:jclsn/vimspector-templates'
