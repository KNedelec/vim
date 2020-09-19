
let b:ale_fixers = ['black', 'isort']
let b:ale_linters = ['black']
let g:ale_fix_on_save = 1

setlocal foldmethod=indent
setlocal tags=pytags,.git/pytags
setlocal omnifunc=python3complete#Complete
set makeprg=python3\ -m\ py_compile\ %
set efm=%C\ %.%#
set efm+=%A\ \ File\ \"%f\"\\
set efm+=\ line\ %l%.%#
set efm+=%Z%[%^\ ]%\\@=%m
set efm+=%-G%.%#

set colorcolumn=89
