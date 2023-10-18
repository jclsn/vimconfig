" Autocommands
if has("autocmd")

	" Autosource files on saving
	"autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd bufwritepost abolish.vim source ~/.vim/after/plugin/abolish.vim
	autocmd bufwritepost autocommands.vim source ~/.vim/autocommands.vim
	autocmd bufwritepost cmakerc.vim source ~/.vim/cmakerc.vim
	autocmd bufwritepost cocrc.vim source ~/.vim/cocrc.vim
	autocmd bufwritepost commands.vim source ~/.vim/commands.vim
	autocmd bufwritepost ctags.vim source ~/.vim/ctags.vim
	autocmd bufwritepost fernrc.vim source ~/.vim/fernrc.vim
	autocmd bufwritepost folds.vim source ~/.vim/folds.vim
	autocmd bufwritepost fugitiverc.vim source ~/.vim/fugitiverc.vim
	autocmd bufwritepost kitty.vim source ~/.vim/kitty.vim
	autocmd bufwritepost lsp-config.vim source ~/.vim/lsp-config.vim
	autocmd bufwritepost miscellaneous.vim source ~/.vim/miscellaneous.vim
	autocmd bufwritepost pluginlist.vim source ~/.vim/pluginlist.vim
	autocmd bufwritepost remaps.vim source ~/.vim/remaps.vim
	autocmd bufwritepost themeconfig.vim source ~/.vim/themeconfig.vim
	autocmd bufwritepost ultisnipsrc.vim source ~/.vim/ultisnipsrc.vim
	autocmd bufwritepost urlhandler.vim source ~/.vim/urlhandler.vim
	autocmd bufwritepost vimspectorrc.vim source ~/.vim/vimspectorrc.vim
	autocmd bufwritepost vimtexrc.vim source ~/.vim/vimtexrc.vim
	autocmd bufwritepost ycmrc.vim source ~/.vim/ycmrc.vim

	" Autoformatting
	" autocmd bufwritepost *.ts :Prettier <CR>
	"autocmd bufwritepost *.py :Black <CR>

	" autocmd BufWritePost *.py call CocAction('format')
	" Manually load syntax highlighting for some file extensions
	"
	au BufReadPost *.patch set ft=diff
	au BufReadPost *.conf set ft=conf
	au BufReadPost *.its set syntax=dts
	au BufReadPost *.bbclass set syntax=bitbake
	au BufReadPost *.scr set syntax=bash
	au BufReadPost *_defconfig set syntax=config
	au BufReadPost *.S set filetype=asm
	au BufReadPost *.rs nnoremap <S-CR> :RustRun <CR>
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
