" ################# Code snippets #################
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'
"Plug 'ervandew/supertab'

" ################# Code completion engines #################
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'bstaletic/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'romainl/vim-qf'

" ################# Debugger plugin #################
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Plug 'mg979/tasks.vim'

" ################# PROGRAMMING LANGUAGES ####################

" ----------- Assembly --------------
Plug 'wsdjeg/vim-assembly'
Plug 'yegappan/disassemble'

" -------------- C --------------
Plug 'pulkomandy/c.vim'											" Better C syntax highlighting
Plug 'vim-scripts/CRefVim'
"Plug 'WolfgangMehner/c-support'
"Plug 'vim-scripts/ifdef-highlighting'

" ------------- C++ --------------
Plug 'coldspark29/h2cppx-vim'
"Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ericcurtin/CurtineIncSw.vim'							    " Toggle between .c and .h buffers with F2
Plug 'vhdirk/vim-cmake'

" ------------ Latex ------------
Plug 'lervag/vimtex'

" ------------ Rust ------------
Plug 'mattn/webapi-vim'

" ################## Code Formatting ####################

Plug 'bigfish/vim-stylelint'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ambv/black'
Plug 'vim-autoformat/vim-autoformat'
Plug 'zeekay/vim-beautify'
Plug 'rhysd/vim-clang-format'

" ################## Tools #############################

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }			" NERDTree explorer
Plug 'vim-utils/vim-man'										" man.vim Plugin
Plug 'mileszs/ack.vim'											" Ack search plugin
Plug 'jclsn/vim-templates'								    " Templates plugin
Plug 'godlygeek/tabular'										" Tabular plugin
Plug 'git@github.com:jclsn/vim-PairTools.git'				    " Auto-closing for brackets etc.
Plug 'https://gitlab.com/mcepl/vim-diff_navigator.git'
Plug 'ntpeters/vim-better-whitespace'						    " Show trailing whitespaces
Plug 'm-pilia/vim-pkgbuild'
Plug 'markonm/traces.vim'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'KabbAmine/zeavim.vim'

" Search engines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bfrg/vim-fzy'
Plug 'voldikss/vim-browser-search'							    " Browser search

" Startify
Plug 'mhinz/vim-startify'

" Render markdown files
Plug 'ellisonleao/glow.nvim'
Plug 'jclsn/glow.vim'

" Tim Pope's plugins
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
if has("nvim")
	Plug 'github/copilot.vim'
endif

" Extend matching to more types than brackets
Plug 'adelarsq/vim-matchit'

" Work
Plug 'deepredsky/vim-jira'
Plug 'TamaMcGlinn/vim-gerritbrowse'							    " Gerrit browser plugin
Plug 'git@github.com:jclsn/vim-bitbake.git'

" ############# Look and feel ###############

" Colorschemes
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'cocopon/iceberg.vim'
Plug 'dim13/smyck.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jnurmine/Zenburn'
Plug 'joshdick/onedark.vim'
Plug 'kristiandupont/shades-of-teal'
Plug 'morhetz/gruvbox'
Plug 'pineapplegiant/spaceduck'
Plug 'tomasiser/vim-code-dark'
Plug 'lifepillar/vim-solarized8'
Plug 'haishanh/night-owl.vim'

" Add icons to plugins
Plug 'ryanoasis/vim-devicons'

" Airline bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AnthonyDiGirolamo/airline-themes'

" Add multiple colors for brackets
Plug 'frazrepo/vim-rainbow'

" Color color codes
Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'

Plug 'ellisonleao/glow.nvim'
Plug 'jclsn/more-todos.vim'
