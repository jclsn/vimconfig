" ++++++++++++++++++++++++************************
"                    Remap leader key
" ++++++++++++++++++++++++************************
nnoremap <SPACE> <Nop>
let mapleader = " "

" ++++++++++++++++++++++++************************
"               ctags mappings
" ++++++++++++++++++++++++************************
nnoremap <leader>l <C-]>
nnoremap <leader>h <C-t>
nnoremap <leader>t :e #<CR>
nnoremap <Leader>ct :!ctags -R .<CR><CR>

" ++++++++++++++++++++++++************************
"               Browser search mappings
" ++++++++++++++++++++++++************************
nmap <silent> <Leader>s <Plug>SearchNormal
vmap <silent> <Leader>s <Plug>SearchVisual

if has('nvim')
	tnoremap <esc> <C-\><C-n>
	nmap <leader>tt :sp <CR> :term<CR> :set nonu<CR> :set nornu<CR> i
else
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
nnoremap <F2> :call CurtineIncSw()<CR>
nnoremap <leader>as :Disassemble
nnoremap <Leader>pp :H2cppxAuto<CR>
nnoremap !silent <Plug>TransposeCharacters xp
			\:call repeat#set("\<Plug>TransposeCharacters")<CR>
nnoremap ü <Plug>TransposeCharacters

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

" Easily delete LINES IN INSERT MODE
inoremap <c-d> <esc>ddi

" Easily convert words to uppercase
inoremap <c-u> <esc>viw~<esc>ea nnoremap <c-u> viw~<esc>e

" Quick editing of config files
nnoremap <leader>ec :vsplit ~/.vim/commands.vim<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>er :vsplit ~/.vim/remaps.vim<cr>
nnoremap <leader>em :vsplit ~/.vim/miscellaneous.vim<cr>
nnoremap <leader>ep :vsplit ~/.vim/pluginlist.vim<cr>
nnoremap <leader>et :vsplit ~/.vim/themeconfig.vim<cr>
nnoremap <leader>ec :vsplit ~/.vim/commands.vim<cr>
nnoremap <leader>ea :vsplit ~/.vim/autocommands.vim<cr>


" Swap lines beautifully

function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

nnoremap <C-k> :call <SID>swap_up()<CR>
nnoremap <C-j> :call <SID>swap_down()<CR>

" Move visual blocks in all directions
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv








