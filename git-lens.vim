vim9script

command GitLensToggle :call ToggleGitLens()
nnoremap <leader>le :call ToggleGitLens()<CR>

g:GIT_LENS_CONFIG = {
    blame_prefix: '    ',
    blame_highlight: 'Comment',
    blame_wrap: true,
    blame_empty_line: true,
    blame_delay: 0,
}


