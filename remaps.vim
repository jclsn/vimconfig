" ++++++++++++++++++++++++************************
"                    Remap leader key
" ++++++++++++++++++++++++************************
nnoremap <SPACE> <Nop>
let mapleader = " "

" ++++++++++++++++++++++++************************
"               ctags mappings
" ++++++++++++++++++++++++************************
nmap <leader>l <C-]>
nmap <leader>h <C-t>
nmap <leader>t :e #<CR>
nnoremap <Leader>ct :!ctags -R .<CR><CR>

" ++++++++++++++++++++++++************************
"               Browser search mappings
" ++++++++++++++++++++++++************************
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual
if has('nvim')
	tnoremap <esc> <C-\><C-n>
	nmap <leader>tt :sp <CR> :term<CR> :res 20 <CR> :set nonu<CR> :set nornu<CR> i
else
	set termwinsize=20*0
	nmap <leader>tt :ter<CR>
endif
nnoremap <leader>rt :RainbowToggle<CR>
nnoremap <leader>cl :ColorToggle<CR>
nnoremap <leader>ab :tabe ~/.vim/after/plugin/abolish.vim <CR>
nnoremap <leader>ll :set rnu! <CR>
nnoremap <leader>cc :colorscheme
nnoremap <leader>rb :RainbowToggle <CR>
nnoremap <C-p>   :AirlineTheme random<CR>
nnoremap <leader>dt :windo diffthis <CR>
nnoremap <leader>do :windo diffoff <CR>
nnoremap <leader>f :Files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
map <F2> :call CurtineIncSw()<CR>
nnoremap <leader>as :Disassemble
nnoremap <Leader>pp :H2cppxAuto<CR>
nmap !silent <Plug>TransposeCharacters xp
			\:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap ü <Plug>TransposeCharacters

nnoremap <leader>cm :CMake<CR>



command! -nargs=? -complete=help H help <args> <bar> wincmd L
" nnoremap <buffer> K K :wincmd L <CR>
" setl keywordprg=:vertical\ help
augroup vimrc_config | autocmd! | autocmd FileType vim setlocal keywordprg=vertical\ help | augroup END


func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  normal gv
  return result
endfunc


" Open selected text in man pages
noremap <leader>m <Plug>(Vman)
vnoremap <leader>m :call man#get_page('vertical',   GetSelectedText())<CR>

" Easily shift lines up and down
nnoremap - ddp
nnoremap _ ddkP

" Easily delete LINES IN INSERT MODE
inoremap <c-d> <esc>ddi

" Easily convert words to uppercase
inoremap <c-u> <esc>viw~<esc>ea
nnoremap <c-u> viw~<esc>e
