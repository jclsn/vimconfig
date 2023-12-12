set signcolumn=yes

" let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_clangd_binary_path='/usr/bin/clangd'
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger=1
let g:ycm_auto_hover=''
let g:ycm_always_populate_location_list=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_update_diagnostics_in_insert_mode=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:force_preview_popup=1
let g:ycm_show_detailed_diag_in_popup = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_add_preview_to_completeopt="popup"

nnoremap <leader>qf :YcmCompleter FixIt<CR>
nnoremap gd :YcmCompleter GoToDeclaration<CR>
nnoremap gi :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gtg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap     K <plug>(YCMHover)
nnoremap <leader>yd :YcmDiags<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename 
nnoremap <leader>el :lopen<CR>
nnoremap <leader>ll :ll<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

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

let g:julia_cmdline = ['/usr/bin/julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       debug = false;
\
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());
\       server.runlinter = true;
\       run(server);
\   ']

let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'julia',
  \     'cmdline': g:julia_cmdline,
  \     'filetypes': [ 'julia' ]
  \   },
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ '/usr/bin/yaml-language-server', '--stdio' ],
  \     'filetypes': [ 'yaml' ]
  \   }
  \ ]
