nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit -v -q<CR>
nnoremap <leader>ga :Git add .
nnoremap <leader>gt :Git commit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :Git log --oneline -1000<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>

function! s:BlameToggle() abort
  let found = 0
  for winnr in range(1, winnr('$'))
    if getbufvar(winbufnr(winnr), '&filetype') ==# 'fugitiveblame'
      exe winnr . 'close'
      let found = 1
    endif
  endfor
  if !found
    Git blame
  endif
endfunction

let g:git_log_options = '-n 500'
nnoremap <silent> <leader>bl :call <SID>BlameToggle()<CR>
command Glog :Gclog -n 500
command Greview :Gclog @ ^!

augroup FugitiveGclog
  autocmd!
  if (has_key(plugs, "spaceduck"))
	  autocmd FileType git highlight link diffAdded DiffAdd
	  autocmd FileType git highlight link diffChanged DiffChange
	  autocmd FileType git highlight link diffRemoved DiffDelete
  endif
augroup END
