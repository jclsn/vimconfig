" ++++++++++++++++++++++++************************
"               Remap leader key
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
nnoremap <Leader>L :cs find s <C-R>=expand("<cword>")<CR><CR>


" ++++++++++++++++++++++++************************
"               Browser search mappings
" ++++++++++++++++++++++++************************
nmap <silent> <Leader>w <Plug>SearchNormal<CR>
vmap <silent> <Leader>w <Plug>SearchVisual<CR>


" ++++++++++++++++++++++++************************
"               Terminal mappings
" ++++++++++++++++++++++++************************
if has('nvim')
	tnoremap <esc> <C-\><C-n>
	nmap <leader>tt :sp <CR> :term<CR> :set nonu<CR> :set nornu<CR> i
else
	nmap <leader>tt :ter<CR>
endif


" ++++++++++++++++++++++++************************
"               Build mappings
" ++++++++++++++++++++++++************************
au FileType c nnoremap <leader>cm :CMake<CR>
au FileType cpp nnoremap <leader>cm :CMake<CR>
au FileType c nnoremap <leader>ma :Make<CR>
au FileType cpp nnoremap <leader>ma :Make<CR>
au FileType rust nnoremap <leader>ru :RustRun <CR>

nnoremap <leader>as :Disassemble

" ++++++++++++++++++++++++************************
"               Diff mappings
" ++++++++++++++++++++++++************************
nnoremap <leader>dt :windo diffthis <CR>
nnoremap <leader>do :windo diffoff <CR>
au FileType diff nnoremap <leader>ct :ConflictTake<CR>


" ++++++++++++++++++++++++************************
"               Man mappings
" ++++++++++++++++++++++++************************
func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  normal gv
  return result
endfunc

nnoremap <leader>m <Plug>(Man)
nnoremap <leader>v <Plug>(Vman)
vnoremap <leader>m :call man#get_page('horizontal',   GetSelectedText())<CR>


" ++++++++++++++++++++++++************************
"       Learn vimscript the hard way mappings
" ++++++++++++++++++++++++************************
" Easily delete LINES IN INSERT MODE
inoremap <c-d> <esc>ddi

" Easily convert words to uppercase
nnoremap <c-u> viw~<esc>e
inoremap <c-u> <esc>viw~<esc>ea

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
nnoremap <leader>ed :vsplit ~/.vim/vimspectorrc.vim<cr>

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

function ActivateBlockNavigation()
	" Don't activate in these filetypes
	if &ft =~ 'git'
		return
	endif
	nnoremap <silent> <C-k> :call <SID>swap_up()<CR>
	nnoremap <silent> <C-j> :call <SID>swap_down()<CR>
	nnoremap <silent> <C-h> <<
	nnoremap <silent> <C-l> >>

	" Move visual blocks in all directions
	vnoremap <silent> <C-j> :m '>+1<CR>gv
	vnoremap <silent> <C-k> :m '<-2<CR>gv
	vnoremap <silent> <C-h> <gv
	vnoremap <silent> <C-l> >gv
endfun 

autocmd filetype * call ActivateBlockNavigation()

" Use same mapping as navigation in the quickfix list
if has_key(plugs, 'vim-unimpaired')
	autocmd filetype git nnoremap <silent> <C-j> :cnext<CR>
	autocmd filetype git nnoremap <silent> <C-k> :cprevious<CR>
endif

"Easily add quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel


" ++++++++++++++++++++++++************************
"               Miscellaneous mappings
" ++++++++++++++++++++++++************************
nnoremap <leader>rt :RainbowToggle<CR>
nnoremap <leader>cl :ColorToggle<CR>
nnoremap <leader>ab :tabe ~/.vim/after/plugin/abolish.vim <CR>
nnoremap <leader>nn :set rnu! <CR>
nnoremap <leader>ll :set list! <CR>
nnoremap <leader>rb :RainbowToggle <CR>
nnoremap <leader>fi :Files<CR>
nnoremap <F2> :call CurtineIncSw()<CR>
nnoremap <Leader>pp :H2cppxAuto<CR>
nnoremap <leader>ad :AddToDictionary<CR>

" Change word under cursor to random number 
nnoremap <leader>rnd ciw<c-r>=system('perl -e "printf(qq[%02d], int(rand(60 - 0)))"')<CR><esc>


" ++++++++++++++++++++++++************************
"          Quick editing of config files
" ++++++++++++++++++++++++************************
nnoremap <leader>ea :vsplit ~/.vim/autocommands.vim<CR>
nnoremap <leader>ec :vsplit ~/.vim/commands.vim<CR>
nnoremap <leader>ed :vsplit ~/.vim/vimspectorrc.vim<CR>
nnoremap <leader>ef :vsplit ~/.vim/fernrc.vim<CR>
nnoremap <leader>el :vsplit ~/.vim/lsp.vim<CR>
nnoremap <leader>em :vsplit ~/.vim/miscellaneous.vim<CR>
nnoremap <leader>ep :vsplit ~/.vim/pluginlist.vim<CR>
nnoremap <leader>er :vsplit ~/.vim/remaps.vim<CR>
nnoremap <leader>et :vsplit ~/.vim/themeconfig.vim<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>ey :vsplit ~/.vim/ycmrc.vim<CR>

ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
