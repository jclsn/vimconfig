set encoding=utf-8

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'

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

" Better C syntax highlighting
Plug 'pulkomandy/c.vim'

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

" Ack search plugin
Plug 'mileszs/ack.vim'

"Templates plugin
Plug 'tibabit/vim-templates'

" C++ file generation
Plug 'coldspark29/h2cppx-vim'

" Tabular plugin
Plug 'godlygeek/tabular'

" Auto-closing for brackets etc.
Plug 'git@github.com:jclsn/vim-PairTools.git'

" Fuzzy finder
Plug 'bfrg/vim-fzy'

" Browser search
Plug 'voldikss/vim-browser-search'

" Gerrit browser plugin
Plug 'TamaMcGlinn/vim-gerritbrowse'

" Make Vim talk to Jupyter kernels
"Plug 'jupyter-vim/jupyter-vim'
"Plug 'szymonmaszke/vimpyter'

Plug 'https://gitlab.com/mcepl/vim-diff_navigator'

" Show trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Code Formatting
Plug 'bigfish/vim-stylelint'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ambv/black'
Plug 'vim-autoformat/vim-autoformat'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Yocto stuff
Plug 'kergoth/vim-bitbake'

" Startify
Plug 'mhinz/vim-startify'

" ************* Look and feel *************

" Colorschemes
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
Plug 'kristiandupont/shades-of-teal'
Plug 'jnurmine/Zenburn'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'pineapplegiant/spaceduck'

" Add icons to plugins
Plug 'ryanoasis/vim-devicons'

" Airline bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AnthonyDiGirolamo/airline-themes'

" Add multiple colors for brackets
Plug 'frazrepo/vim-rainbow'

" Color color codes
"Plug 'chrisbra/Colorizer'
Plug 'ap/vim-css-color'

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
nnoremap <Leader>pp :H2cppxAuto<CR>

" Ctags config
nnoremap <Leader>ct :!ctags -R .<CR><CR>

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
set expandtab
set undofile   " Maintain undo history between sessions
if has ('nvim')
set undodir=~/.config/nvim/undodir
else
set undodir=~/.vim/undodir
endif

set shell=zsh
set ttimeoutlen=0
set timeoutlen=500
set noswapfile
set wildmenu
set wildmode=longest:full
set mouse=a

let g:tmpl_author_email = 'claussen.j@eppendorf.de'
let g:tmpl_author_name = 'Jan Claussen'

if has('nvim')
tnoremap <esc> <C-\><C-n>
nmap <leader>tt :sp <CR> :term<CR> :res 20 <CR> i
else
nmap <leader>tt :ter<CR>
endif
nmap <leader>rt :RainbowToggle<CR>
nmap <leader>cl :ColorToggle<CR>
nmap <leader>ab :tabe ~/.vim/after/plugin/abolish.vim <CR>
nmap <leader>ll :set rnu! <CR>
nmap <leader>cc :colorscheme
nmap <leader>rb :RainbowToggle <CR>
nmap <C-p>   :AirlineTheme random<CR>
":hi airline_c guibg=NONE ctermbg=NONE <CR> :hi airline_tabfill guibg=NONE ctermbg=NONE <CR>
nmap <leader>dt :windo diffthis <CR>
nmap <leader>do :windo diffoff <CR>
nmap <leader>f :Files<CR>
" :hi airline_b guibg=NONE ctermbg=NONE <CR> :hi airline_x guibg=NONE ctermbg=NONE <CR>

" Autocommands
if has("autocmd")

  " Autosource files on saving
  autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd bufwritepost fugitiverc.vim source ~/.vim/fugitiverc.vim
  autocmd bufwritepost cocrc.vim source ~/.vim/cocrc.vim
  autocmd bufwritepost coc-settings.json source ~/.vim/coc-settings.json
  autocmd bufwritepost ycmrc.vim source ~/.vim/ycmrc.vim
  autocmd bufwritepost vimspectorrc.vim source ~/.vim/vimspectorrc.vim
  autocmd bufwritepost abolish.vim source ~/.vim/after/plugin/abolish.vim

  " Run prettier when saving typescipt files
  autocmd bufwritepost *.ts :Prettier <CR>
  "autocmd bufwritepost *.py :Black <CR>

  " Manually load syntax highlighting for some file extensions
  "
  au BufReadPost *.patch set ft=diff
  au BufReadPost *.conf set ft=conf
  au BufReadPost *.its set syntax=dts
  au BufReadPost *.bbclass set syntax=python
  au BufReadPost *.scr set syntax=bash
  au BufReadPost *.inc set syntax=config
  au BufReadPost *.bb* set syntax=config

  " Run retab on saving files
  "autocmd bufwritepost *.c,*.cpp retab
endif

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode

if has('vim')
set termwinsize=20x0
endif
set splitbelow

" Activate Prettier plugin for various file extensions
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Script to open URLs under the cursor
function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    exec "silent !xdg-open '".s:uri."'" | redraw!
  else
    echo "No URI found in line."
  endif
endfunction
nmap <leader>u :call HandleURL()<CR>

" Cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=0\x7"

"Confluence sttings

" ++++++++++++++++++++++++************************
"                       Theme settings
" ++++++++++++++++++++++++************************
let g:airline_theme="spaceduck"
let g:airline_powerline_fonts = 1
"let g:rainbow_active = 1
colorscheme spaceduck
set background=dark
set termguicolors
" set signcolumn=yes

"autocmd BufEnter * if getbufvar(bufnr('%'), '&buftype') == "term" | colorscheme default | endif

"Force transparent background
"hi Normal guibg=NONE ctermbg=NONE"
"hi LineNr guibg=NONE ctermbg=NONE"
"hi LineNrAbove guibg=NONE ctermbg=NONE"
"hi LineNrBelow guibg=NONE ctermbg=NONE"
"hi SignColumn guibg=NONE ctermbg=NONE"
"hi EndOfBuffer guibg=NONE ctermbg=NONE"
"
"hi airline_c guibg=NONE ctermbg=NONE
"hi airline_tabfill guibg=NONE ctermbg=NONE
"hi airline_b guibg=NONE ctermbg=NONE
"hi airline_a guibg=NONE ctermbg=NONE
"
""Force comment color
"hi Comment guifg=#686f9a ctermfg=141
"hi LineNr guifg=#686f9a ctermfg=141
"hi DiffAdd guibg=NONE ctermfg=NONE
"hi DiffChange guibg=NONE ctermbg=NONE
"hi DiffDelete guibg=NONE ctermbg=NONE
"hi DiffText guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE

"hi Directory guifg=#686f9a ctermfg=141
"hi folded ctermbg=none ctermfg=gray

"Force gray folds
"hi Folded ctermbg=None ctermfg=244
"hi folded ctermbg=none ctermfg=gray

" Correct Airline theme for Spaceduck
let s:inactive1 = [ "#686f9a", "#16172d", 234, 234 ]
let s:inactive2 = [ "#686f9a", "#16172d", 234, 234 ]
let s:inactive3 = [ "#686f9a", "#16172d", 234, 234 ]

let g:better_whitespace_ctermcolor='gray'
let g:better_whitespace_guicolor='gray'
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" ++++++++++++++++++++++++***********************_
"               Source large configurations
" ++++++++++++++++++++++++************************
"so ~/.vim/ultisnipsrc.vim
"so ~/.vim/ycmrc.vim
"so ~/.vim/vimtexrc.vim
so ~/.vim/vimspectorrc.vim
so ~/.vim/fugitiverc.vim
so ~/.vim/cocrc.vim

