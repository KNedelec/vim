
setlocal omnifunc=python3complete#Complete
set makeprg=python3\ -m\ py_compile\ %
set efm=%C\ %.%#
set efm+=%A\ \ File\ \"%f\"\\
set efm+=\ line\ %l%.%#
set efm+=%Z%[%^\ ]%\\@=%m
set efm+=%-G%.%#

