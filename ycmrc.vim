set signcolumn=yes

let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_clangd_binary_path='/usr/bin/clangd'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-l>'
let g:ycm_auto_trigger=1
let g:ycm_auto_hover=''
let g:ycm_always_populate_location_list=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_update_diagnostics_in_insert_mode=0
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:force_preview_popup=1

nnoremap <leader>ff :YcmCompleter FixIt<CR>
nnoremap <leader>gtd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gtf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gtg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap     K <plug>(YCMHover)
nnoremap <leader>yd :YcmDiags<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename 
nnoremap <leader>el :lopen<CR>
nnoremap <leader>ll :ll<CR>
nnoremap <leader>ff :YcmCompleter FixIt<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:ycm_semantic_triggers = {
        \ 'tex'  : ['{'],
        \ 'cpp'  : ['o']
    \}

" Wrap around error list
nmap <silent> ]g <Plug>(qf_loc_next)
nmap <silent> [g <Plug>(qf_loc_previous)
nmap <Home> <Plug>(qf_loc_previous)
nmap <End>  <Plug>(qf_loc_next)

" Error highlighting
highlight YcmErrorSection ctermbg=None ctermfg=None  cterm=underline
highlight YcmWarningSection ctermbg=None ctermfg=None  cterm=underline
highlight YcmErrorSign ctermbg=None ctermfg=red
highlight YcmWarningSign ctermbg=None ctermfg=220
highlight YcmErrorLine  ctermbg=None  ctermfg=None
highlight YcmWarningLine ctermbg=None ctermfg=None
highlight YcmWarningSection ctermbg=None ctermfg=None
highlight Error ctermbg=None ctermfg=red 

let g:ycm_error_symbol='❗'
let g:ycm_warning_symbol='💡'
let g:ycm_echo_current_diagnostic='virtual-text'

let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res == 0
    if pumvisible()
      return "\<C-N>"
    else
      return "\<TAB>"
    endif
  endif

  return ""
endfunction
