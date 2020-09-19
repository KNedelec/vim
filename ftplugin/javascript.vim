
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_linters = ['eslint']

let b:ale_fix_on_save = 1

setlocal tags=jstags,.git/jstags

command! -nargs=* Ak :execute "Ack --ignore-dir={node_modules,build} --type=js " . string(<q-args>)
