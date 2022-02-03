set encoding=utf-8

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'

" Snippets 
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips' 
"Plug 'ervandew/supertab'

" Code completion engines
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'

"Plug 'bstaletic/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
"Plug 'romainl/vim-qf'

" C-Support plugin 
"Plug 'WolfgangMehner/c-support'
"Plug 'vim-scripts/ifdef-highlighting'

" Assembly support
Plug 'wsdjeg/vim-assembly'
Plug 'yegappan/disassemble'

" Debugging 
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" NERDTree explorer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" man.vim Plugin
Plug 'vim-utils/vim-man'

" Toggle between .c and .h buffers with F2
Plug 'ericcurtin/CurtineIncSw.vim'

" Latex plugin
Plug 'lervag/vimtex'

" Easy commenting with gcc
Plug 'tpope/vim-commentary'

" Ack search plugin
Plug 'mileszs/ack.vim'

"Templates plugin
Plug 'tibabit/vim-templates'

" C++ file generation
Plug 'jclsn/h2cppx-vim'
Plug 'tenfyzhong/vim-gencode-cpp'

" Tabular plugin
Plug 'godlygeek/tabular'

" Auto-closing for brackets etc.
Plug 'jclsn/vim-PairTools'

" Fuzzy finder
Plug 'bfrg/vim-fzy'

" Surround plugin 
Plug 'tpope/vim-surround'

" Browser search
Plug 'voldikss/vim-browser-search'

" Make Vim talk to Jupyter kernels
Plug 'jupyter-vim/jupyter-vim'
"Plug 'szymonmaszke/vimpyter'

Plug 'equalsraf/vim-qt'

Plug 'prettier/vim-prettier'

" ************* Look and feel *************

" Colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'gosukiwi/vim-atom-dark'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cocopon/iceberg.vim'
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'dim13/smyck.vim'
Plug 'Drogglbecher/vim-moonscape'
Plug 'dracula/vim'
Plug 'kristiandupont/shades-of-teal'
Plug 'jnurmine/Zenburn'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'gkapfham/vim-vitamin-onec'
Plug 'fneu/breezy'
Plug 'pineapplegiant/spaceduck'
Plug 'fenetikm/falcon'
Plug 'haishanh/night-owl.vim'
Plug 'keitanakamura/neodark.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'Mangeshrex/uwu.vim'
Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'severij/vadelma'
Plug 'arzg/vim-colors-xcode'
Plug 'kaicataldo/material.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'jaredgorski/SpaceCamp'

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

call plug#end()

" ++++++++++++++++++++++++************************
"                    Official Vim packages
" ++++++++++++++++++++++++************************
packadd! matchit

" ++++++++++++++++++++++++************************
"                    Remap leader key
" ++++++++++++++++++++++++************************
nnoremap <SPACE> <Nop>
let mapleader = " "


" ++++++++++++++++++++++++************************
"               ctags configuration
" ++++++++++++++++++++++++************************
nmap <leader>l <C-]>
nmap <leader>h <C-t>
nmap <leader>t :e #<CR>

" ++++++++++++++++++++++++************************
"              NERDTree configuration
" ++++++++++++++++++++++++************************
nmap <C-n> :NERDTreeToggle<CR>

" ++++++++++++++++++++++++************************
"                  Map CurtineIncSw to F2
" ++++++++++++++++++++++++************************
map <F2> :call CurtineIncSw()<CR>

" ++++++++++++++++++++++++************************
"                  Ack settings
" ++++++++++++++++++++++++************************
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" ++++++++++++++++++++++++************************
"               Assembly settings
" ++++++++++++++++++++++++************************
nnoremap <leader>as :Disassemble 

" ++++++++++++++++++++++++************************
"                 C/C++ settings
" ++++++++++++++++++++++++************************
" H2cppx config
nnoremap <Leader>cpp :H2cppxAuto<CR>

" GenDefinition and GenDeclaration settings
nmap <leader>gdf :GenDefinition<CR>
nmap <leader>gdc :GenDeclaration<CR>

" Ctags config
nnoremap <Leader>ct :!ctags -R .<CR><CR>


" ++++++++++++++++++++++++************************
"                    Javascript 
" ++++++++++++++++++++++++************************
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" ++++++++++++++++++++++++************************
"                    Folding 
" ++++++++++++++++++++++++************************

" Auto save and load views
au BufWinLeave *.* silent! mkview
au BufWinEnter *.* silent! loadview
set foldmethod=syntax
set foldlevelstart=99


" ++++++++++++++++++++++++************************
"               Browser search mappings 
" ++++++++++++++++++++++++************************
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual

" ++++++++++++++++++++++++************************
"                Miscellaneous settings
" ++++++++++++++++++++++++************************
set number
set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4
set shiftwidth=4
set undofile   " Maintain undo history between sessions
set noswapfile

if has('nvim')
set undodir=/home/jan/.config/nvim/undodir
else
set undodir=/home/jan/.vim/undodir
endif

set shell=zsh
set ttimeoutlen=0
set timeoutlen=500
set mouse=a

let g:tmpl_author_email = 'jan.claussen10@web.de'
let g:tmpl_author_name = 'Jan Claussen'

if has('nvim')
tnoremap <esc> <C-\><C-n>
nmap <leader>tt :sp <CR> :term<CR> :res 20 <CR> i
else
nmap <leader>tt :ter<CR>
endif
nmap <leader>rt :RainbowToggle<CR>
nmap <leader>cl :ColorToggle<CR>
nmap <leader>ab :tabe /home/jan/.vim/after/plugin/abolish.vim <CR>


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd bufwritepost abolish.vim source /home/jan/.vim/after/plugin/abolish.vim
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

if has('nvim')
else
set termwinsize=20x0
endif
set splitbelow

" ++++++++++++++++++++++++************************
"                       Theme settings
" ++++++++++++++++++++++++************************
highlight clear
"let g:airline_theme="simple"
let g:airline_powerline_fonts = 1
nmap <C-p>   :AirlineTheme random<CR>
"let g:rainbow_active = 1
nmap <leader>cc :colorscheme 
colorscheme spaceduck
set termguicolors
set background=dark

" Force gray folds
"hi Folded ctermbg=None ctermfg=244

" Force gray comments
"hi Comment guifg=grey27 ctermfg=237
hi Comment guifg=#40466F ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#40466F ctermfg=238 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

"hi Normal guibg=black ctermbg=black

" Force transparent background
"hi Normal guibg=NONE ctermbg=NONE
"hi LineNr guibg=NONE ctermbg=NONE
"hi LineNrAbove guibg=NONE ctermbg=NONE
"hi LineNrBelow guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE
"hi Terminal guibg=NONE ctermbg=NONE

"Output the current syntax group
nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>


" ++++++++++++++++++++++++************************
"               Source large configurations
" ++++++++++++++++++++++++************************
"so ~/.vim/ultisnipsrc.vim
"so ~/.vim/ycmrc.vim
"so ~/.vim/vimtexrc.vim
so ~/.vim/vimspectorrc.vim
so ~/.vim/fugitiverc.vim
so ~/.vim/cocrc.vim


"hi Comment guifg=gray ctermbg=None ctermfg=gray
"hi Directory guifg=white ctermfg=white
