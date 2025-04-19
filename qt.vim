let g:vimqt_assistant = '/usr/bin/assistant'
command QtAssistant call GetDocFromAssistant()<CR>
nnoremap <silent><leader>qa :call GetDocFromAssistant()<CR>

function! OpenQtDoc()
	let l:word = tolower(expand('<cword>'))
	let l:url = 'https://doc.qt.io/qt-6/' . l:word . '.html'
	silent! call system('xdg-open ' . shellescape(l:url) . ' &')
endfunction

nnoremap <silent><leader>qd :call OpenQtDoc()<CR>
