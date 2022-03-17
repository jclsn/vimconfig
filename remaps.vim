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
nmap <leader>rt :RainbowToggle<CR>
nmap <leader>cl :ColorToggle<CR>
nmap <leader>ab :tabe ~/.vim/after/plugin/abolish.vim <CR>
nmap <leader>ll :set rnu! <CR>
nmap <leader>cc :colorscheme
nmap <leader>rb :RainbowToggle <CR>
nmap <C-p>   :AirlineTheme random<CR>
nmap <leader>dt :windo diffthis <CR>
nmap <leader>do :windo diffoff <CR>
nmap <leader>f :Files<CR>
nmap <C-n> :NERDTreeToggle<CR>
map <F2> :call CurtineIncSw()<CR>
nnoremap <leader>as :Disassemble
nnoremap <Leader>pp :H2cppxAuto<CR>
nmap !silent <Plug>TransposeCharacters xp
			\:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap ü <Plug>TransposeCharacters

