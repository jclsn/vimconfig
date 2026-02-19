" ++++++++++++++++++++++++************************
"               Remap leader key
" ++++++++++++++++++++++++************************
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "-"


" ++++++++++++++++++++++++************************
"               ctags mappings
" ++++++++++++++++++++++++************************
" nnoremap <leader>l <C-]>
" nnoremap <leader>h <C-t>
" nnoremap <silent><leader>t :e #<CR>
" nnoremap <silent><Leader>L :cs find s <C-R>=expand("<cword>")<CR><CR>


" ++++++++++++++++++++++++************************
"               Browser search mappings
" ++++++++++++++++++++++++************************
nmap <silent> <Leader>w <Plug>SearchNormal<CR>
vmap <silent> <Leader>w <Plug>SearchVisual<CR>


" ++++++++++++++++++++++++************************
"               Terminal mappings
" ++++++++++++++++++++++++************************
" function! SwitchToTerminalBuffer()
"     " Get list of all open buffers
"     let buffers = range(1, bufnr('$'))
"     let terminal_buffers = []

"     " Collect only terminal buffers
"     for buf in buffers
"         if getbufvar(buf, "&buftype") == "terminal"
"             call add(terminal_buffers, buf)
"         endif
"     endfor

"     " If no terminal buffer is found, show a message and return
"     if empty(terminal_buffers)
" 	terminal
"         return
"     endif

"     " Cycle through windows and find the first terminal buffer
"     let startwin = winnr()
"     while 1
"         wincmd w
"         if index(terminal_buffers, bufnr('%')) >= 0
"             break
"         endif
"         if winnr() == startwin
"             echom "No terminal buffer found"
"             break
"         endif
"     endwhile
" endfunction

" if has('nvim')
" 	tnoremap <esc> <C-\><C-n>
" 	nmap <leader>tt :sp <CR> :term<CR> :set nonu<CR> :set nornu<CR> i
" else
" 	nnoremap <silent><Leader>tt :call SwitchToTerminalBuffer()<CR>
" endif

if has('nvim')
	tnoremap <esc> <C-\><C-n>
	nmap <leader>tt :sp <CR> :term<CR> :set nonu<CR> :set nornu<CR> i
else
	nnoremap <silent><Leader>tt :ter<CR>
endif



" Map it to <Leader>t

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

" Quick editing of config files
nnoremap <leader>ec :vsplit $VIMHOME/commands.vim<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>er :vsplit $VIMHOME/remaps.vim<cr>
nnoremap <leader>em :vsplit $VIMHOME/miscellaneous.vim<cr>
nnoremap <leader>ep :vsplit $VIMHOME/pluginlist.vim<cr>
nnoremap <leader>et :vsplit $VIMHOME/themeconfig.vim<cr>
nnoremap <leader>ec :vsplit $VIMHOME/commands.vim<cr>
nnoremap <leader>ea :vsplit $VIMHOME/autocommands.vim<cr>
nnoremap <leader>ef :vsplit $VIMHOME/fernrc.vim<cr>
nnoremap <leader>ey :vsplit $VIMHOME/ycmrc.vim<cr>
nnoremap <leader>ed :vsplit $VIMHOME/vimspectorrc.vim<cr>
nnoremap <leader>el :vsplit $VIMHOME/lsp.vim<cr>
nnoremap <leader>elp :vsplit $VIMHOME/lsp<cr>
nnoremap <leader>es :vsplit $VIMHOME/cSpell.json<cr>

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
	if &ft =~ 'git|qf'
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
	autocmd filetype git nnoremap <buffer> <silent> <C-j> :cnext<CR>
	autocmd filetype git nnoremap <buffer> <silent> <C-k> :cprevious<CR>
	autocmd filetype qf nnoremap <buffer> <silent> <C-j> :cnext<CR>
	autocmd filetype qf nnoremap <buffer> <silent> <C-k> :cprevious<CR>
endif

"Easily add quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel


" ++++++++++++++++++++++++************************
"               Miscellaneous mappings
" ++++++++++++++++++++++++************************
nnoremap <leader>rt :RainbowToggle<CR>
nnoremap <leader>ab :tabe $VIMHOME/after/plugin/abolish.vim <CR>
nnoremap <leader>nn :set rnu! <CR>
nnoremap <leader>ll :set list! <CR>
nnoremap <leader>rb :RainbowToggle <CR>
nnoremap <leader>fi :Files<CR>
nnoremap <F2> :call CurtineIncSw()<CR>
nnoremap <Leader>pp :H2cppxAuto<CR>

" Change word under cursor to random number
nnoremap <leader>rnd ciw<c-r>=system('perl -e "printf(qq[%02d], int(rand(60 - 0)))"')<CR><esc>


" ++++++++++++++++++++++++************************
"          Quick editing of config files
" ++++++++++++++++++++++++************************
nnoremap <leader>ea :vsplit $VIMHOME/autocommands.vim<CR>
nnoremap <leader>ec :vsplit $VIMHOME/commands.vim<CR>
nnoremap <leader>ed :vsplit $VIMHOME/vimspectorrc.vim<CR>
nnoremap <leader>ef :vsplit $VIMHOME/fernrc.vim<CR>
nnoremap <leader>elc :vsplit $VIMHOME/lsp.vim<CR>
nnoremap <leader>elp :vsplit $VIMHOME/lsp<CR>
nnoremap <leader>em :vsplit $VIMHOME/miscellaneous.vim<CR>
nnoremap <leader>ep :vsplit $VIMHOME/pluginlist.vim<CR>
nnoremap <leader>er :vsplit $VIMHOME/remaps.vim<CR>
nnoremap <leader>et :vsplit $VIMHOME/themeconfig.vim<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>ey :vsplit $VIMHOME/ycmrc.vim<CR>

ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

function! ScrollPopup(nlines)
    let winids = popup_list()
    if len(winids) == 0
        return
    endif

    " Ignore hidden popups
    let prop = popup_getpos(winids[0])
    if prop.visible != 1
        return
    endif

    let firstline = prop.firstline + a:nlines
    let buf_lastline = str2nr(trim(win_execute(winids[0], "echo line('$')")))
    if firstline < 1
        let firstline = 1
    elseif prop.lastline + a:nlines > buf_lastline
        let firstline = buf_lastline + prop.firstline - prop.lastline
    endif

    call popup_setoptions(winids[0], {'firstline': firstline})
endfunction

nnoremap <silent> ö :call ScrollPopup(3)<CR>
nnoremap <silent> ü :call ScrollPopup(-3)<CR>

if exists(":Tabularize")
	nmap <Leader>tc :Tabularize /\/\*<CR>
	vmap <Leader>tc :Tabularize /\/\*<CR>
endif
