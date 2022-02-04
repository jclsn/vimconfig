" Autocommands
if has("autocmd")

	" Autosource files on saving
	autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd bufwritepost ~/*.vim source $MYVIMRC
	autocmd bufwritepost fugitiverc.vim source ~/.vim/fugitiverc.vim
	autocmd bufwritepost cocrc.vim source ~/.vim/cocrc.vim
	autocmd bufwritepost coc-settings.json source ~/.vim/coc-settings.json
	autocmd bufwritepost ycmrc.vim source ~/.vim/ycmrc.vim
	autocmd bufwritepost vimspectorrc.vim source ~/.vim/vimspectorrc.vim
	autocmd bufwritepost abolish.vim source ~/.vim/after/plugin/abolish.vim

	" Run prettier when saving typescipt files
	autocmd bufwritepost *.ts :Prettier <CR>
	"autocmd bufwritepost *.py :Black <CR>

	" Manually load syntax highlighting for some file extensions
	"
	au BufReadPost *.patch set ft=diff
	au BufReadPost *.conf set ft=conf
	au BufReadPost *.its set syntax=dts
	au BufReadPost *.bbclass set syntax=python
	au BufReadPost *.scr set syntax=bash
	au BufReadPost *.inc set syntax=config
	au BufReadPost *.bb* set syntax=config

	" Run retab on saving files
	"autocmd bufwritepost *.c,*.cpp retab

	" Activate Prettier plugin for various file extensions
	let g:prettier#autoformat = 0
	autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

endif


