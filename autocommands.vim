" Autocommands
if has("autocmd")

	" Autosource files on saving
	"autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd bufwritepost abolish.vim source $MYVIMDIR/after/plugin/abolish.vim
	autocmd bufwritepost autocommands.vim source $MYVIMDIR/autocommands.vim
	autocmd bufwritepost cmakerc.vim source $MYVIMDIR/cmakerc.vim
	autocmd bufwritepost cocrc.vim source $MYVIMDIR/cocrc.vim
	autocmd bufwritepost commands.vim source $MYVIMDIR/commands.vim
	autocmd bufwritepost ctags.vim source $MYVIMDIR/ctags.vim
	autocmd bufwritepost fernrc.vim source $MYVIMDIR/fernrc.vim
	autocmd bufwritepost folds.vim source $MYVIMDIR/folds.vim
	autocmd bufwritepost fugitiverc.vim source $MYVIMDIR/fugitiverc.vim
	autocmd bufwritepost kitty.vim source $MYVIMDIR/kitty.vim
	autocmd bufwritepost lsp.vim source $MYVIMDIR/lsp.vim
	autocmd bufwritepost miscellaneous.vim source $MYVIMDIR/miscellaneous.vim
	autocmd bufwritepost pluginlist.vim source $MYVIMDIR/pluginlist.vim
	autocmd bufwritepost remaps.vim source $MYVIMDIR/remaps.vim
	autocmd bufwritepost themeconfig.vim source $MYVIMDIR/themeconfig.vim
	autocmd bufwritepost ultisnipsrc.vim source $MYVIMDIR/ultisnipsrc.vim
	autocmd bufwritepost urlhandler.vim source $MYVIMDIR/urlhandler.vim
	autocmd bufwritepost vimspectorrc.vim source $MYVIMDIR/vimspectorrc.vim
	autocmd bufwritepost vimtexrc.vim source $MYVIMDIR/vimtexrc.vim
	autocmd bufwritepost ycmrc.vim source $MYVIMDIR/ycmrc.vim

	" Autoformatting
	" autocmd bufwritepost *.ts :Prettier <CR>
	"autocmd bufwritepost *.py :Black <CR>

	" autocmd BufWritePost *.py call CocAction('format')
	" Manually load syntax highlighting for some file extensions
	"
	au BufReadPost *.patch setlocal ft=diff
	au BufReadPost *.conf setlocal ft=conf
	au BufReadPost *.its setlocal syntax=dts
	au BufReadPost *.scr setlocal syntax=bash
	au BufReadPost *_defconfig setlocal syntax=config
	au BufReadPost *.h setlocal filetype=c
	"au BufReadPost * :ColorHighlight<CR>

	" Run retab on saving files
	"autocmd bufwritepost *.c,*.cpp retab

	" Activate Prettier plugin for various file extensions
	"let g:prettier#autoformat = 0
	" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

endif

" Stop highlighting after search has finished
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" autocmd FileType c ClangFormatAutoEnable
" autocmd FileType h ClangFormatAutoEnable
" autocmd FileType cpp ClangFormatAutoEnable
" autocmd FileType hpp ClangFormatAutoEnable


" JSON settings
au FileType json set filetype=jsonc

" Deduce header filet type for C/C++
function! GuessHeaderFiletype()
  let base = expand('%:r')
  if filereadable(base . '.cpp') || filereadable(base . '.cc') || filereadable(base . '.cxx')
    set filetype=cpp
  elseif filereadable(base . '.c')
    set filetype=c
  endif
endfunction

augroup HeaderGuess
  autocmd!
  autocmd BufRead,BufNewFile *.h call GuessHeaderFiletype()
augroup END

