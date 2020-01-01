

let VIM_HOME = $HOME . '/.vim/'
let cmda = "silent !find . -name \"*.js\" | xargs ctags --options=".VIM_HOME.".ctags"
let cmd = "silent !find . -name \"*.js\" | grep -v node_modules | xargs ctags --options=".VIM_HOME.".ctags"
command! Cta execute(cmda) | execute("redraw!")
command! Ct execute(cmd) | execute("redraw!")
