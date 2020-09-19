
set makeprg=./node_modules/.bin/tsc\ --noEmit\ %
"set makeprg=find\ .\ -name\ {$*}\ |\ grep\ -v\ node_modules\ |\ xargs\ ./node_modules/.bin/tsc\ --noEmit

let b:ale_fixers = ['prettier', 'tslint']
let b:ale_linters = ['tslint']
