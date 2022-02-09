" ++++++++++++++++++++++++************************
"                    Folding
" ++++++++++++++++++++++++************************

" Auto save and load views
au BufWinLeave *.* silent! mkview
au BufWinEnter *.* silent! loadview
set foldmethod=syntax
set foldlevelstart=99



