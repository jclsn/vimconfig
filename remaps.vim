" ++++++++++++++++++++++++************************
"                    Remap leader key
" ++++++++++++++++++++++++************************
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "-"

" ++++++++++++++++++++++++************************
"               ctags mappings
" ++++++++++++++++++++++++************************
nnoremap <leader>l <C-]>
nnoremap <leader>h <C-t>
nnoremap <leader>t :e #<CR>
nnoremap <Leader>ct :!ctags -R .<CR><CR>
nnoremap <Leader>L :cs find s <C-R>=expand("<cword>")<CR><CR>

" ++++++++++++++++++++++++************************
"               Browser search mappings
" ++++++++++++++++++++++++************************
nmap <silent> <Leader>w <Plug>SearchNormal<CR>
vmap <silent> <Leader>w <Plug>SearchVisual<CR>

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
nnoremap <leader>rb :RainbowToggle <CR>
nnoremap <leader>dt :windo diffthis <CR>
nnoremap <leader>do :windo diffoff <CR>
nnoremap <leader>fi :Files<CR>
nnoremap <F2> :call CurtineIncSw()<CR>
nnoremap <Leader>pp :H2cppxAuto<CR>

nnoremap <leader>cg :CMakeGenerate<CR>
nnoremap <leader>cb :CMakeBuild<CR>
nnoremap <leader>cc :CMakeClose<CR>
nnoremap <leader>ma :Make<CR>

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
nnoremap <leader>m <Plug>(Man)
nnoremap <leader>v <Plug>(Vman)
vnoremap <leader>m :call man#get_page('horizontal',   GetSelectedText())<CR>

" Easily delete LINES IN INSERT MODE
inoremap <c-d> <esc>ddi

" Quick editing of config files
nnoremap <leader>ec :vsplit ~/.vim/commands.vim<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>er :vsplit ~/.vim/remaps.vim<cr>
nnoremap <leader>em :vsplit ~/.vim/miscellaneous.vim<cr>
nnoremap <leader>ep :vsplit ~/.vim/pluginlist.vim<cr>
nnoremap <leader>et :vsplit ~/.vim/themeconfig.vim<cr>
nnoremap <leader>ec :vsplit ~/.vim/commands.vim<cr>
nnoremap <leader>ea :vsplit ~/.vim/autocommands.vim<cr>
nnoremap <leader>ef :vsplit ~/.vim/fernrc.vim<cr>
nnoremap <leader>ey :vsplit ~/.vim/ycmrc.vim<cr>


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
nnoremap <C-h> <<
nnoremap <C-l> >>

" Move visual blocks in all directions
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv

"Easily add quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Open Copilot panel
inoremap <C-p> <esc>:Copilot panel <CR>
nnoremap <C-p> :Copilot panel <CR>

" Rust
nnoremap <leader>ru :RustRun <CR>

" Change word under cursor to random number 
nnoremap <leader>rnd ciw<c-r>=system('perl -e "printf(qq[%02d], int(rand(60 - 0)))"')<cr><esc>
" nnoremap <silent> <leader>r ciw<CR>=call printf('%02d', min(60, max(0, str2nr(getreg('.')) + 1)))<CR>

" Maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

