" VIM Configuration File
" :let $VIMRUNTIME = "/usr/local/share/vim/vim80"

set nocompatible

"""""""""""""""""""""""""""""""""""""""
"
"  Plugin managers
"
"""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" ColorScheme
Plug 'jonathanfilip/vim-lucius'
Plug 'altercation/vim-colors-solarized'

" js
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mklabs/mdn.vim'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" Python
Plug 'davidhalter/jedi'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-vinegar'

" html
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
" json
Plug 'elzr/vim-json'
" pug
Plug 'digitaltoad/vim-pug'
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
" twig
Plug 'lumiliet/vim-twig'
" css
Plug 'ap/vim-css-color'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'chrisbra/Recover.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Quramy/vim-js-pretty-template'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

"""""""""""""""""""""""""""""""""""""""
"
"  Basic settings
"
"""""""""""""""""""""""""""""""""""""""

"
" Theme
"
set background=dark
colorscheme lucius "wombat256, solarized
" day mode
nnoremap <leader>N :set background=dark<CR>
" night mode
nnoremap <leader>n :set background=light<CR>

"
" Vimrc - Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vs $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"
" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
nnoremap <leader>r :w!<cr> :execute '!sshpass -p "vagrant" scp -r ' . expand('%:h') . '/. vagrant@10.0.0.2:/var/www/' .  expand('%:h') . '/'<cr> :redraw!<cr>

"
" Basic stuff
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set autoindent
set smartindent
set tabstop=2        " tab width is 4 spaces
set backspace=indent,eol,start  " like normal backspace
set fixeol
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120
set colorcolumn=120
set fo+=t
set fo-=l
set t_Co=256
filetype plugin indent on
syntax on
set number
set relativenumber
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu
set nosol       " prevent vim to change column when jumping
set shm=at      " short vim messaged
set hidden
set list listchars=tab:»·,trail:· " display tabs and trailing whitespaces
set scrolloff=5   " always keep 5 lines visible above/below cursor
syntax sync minlines=256 "scroll perf
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set undofile
set undodir="$HOME/.vim_undo"
set wildignore=*.swp,*.bak,plugins,*/app/cache/*,*/node_modules,*/dist/*,*/vendor
set title                " change the terminal's title
set noerrorbells         " don't beep
set nobackup
set nowb
set directory=/var/tmp/
set noesckeys
set omnifunc=syntaxcomplete#Complete

" no ex mode
nnoremap Q <nop>

"
" Search
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set ignorecase
set smartcase
set magic

"switch paste mode
set pastetoggle=<F2>

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" delete to black hole register
nmap D "_d

" js function  auto close
inoremap <expr> {} nr2char(getchar())
inoremap <expr> {}<space> "{}"
inoremap <expr> {}<cr> "{<cr>}<ESC>O"
inoremap <expr> {}} "{<cr>};<ESC>O"
inoremap <expr> {}{ "{<cr>},<ESC>O"
inoremap <expr> {}o "{<cr>})<ESC>O"
inoremap <expr> {}p "{<cr>});<ESC>O"
inoremap (ff (function (){<cr>});<ESC>O

"
" folding
set foldmethod=syntax
set foldlevel=6

" path is path with siblings and current
set path=.,../,,**

" Always show the status line
set laststatus=2

map <F9> :wa <bar> lclose <bar> Make! <cr>
nnoremap ,r :Copen<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using leader+[jk]
nmap <leader>j mz:m+<cr>`z
nmap <leader>k mz:m-2<cr>`z
vmap <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <leader>k :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <leader>h :e~/.vim/help<cr>

" replace word
nnoremap X ciw


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows explore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tm :tabmove<CR>
map <leader>tc :tabclose<CR>

noremap <leader>ex :Vexplore<CR>
noremap <leader>q :q<CR>
noremap <leader>= 10<C-W>+
noremap <leader>- 10<C-W>-
noremap <leader>> 20<C-W>>
noremap <leader>< 20<C-W><


" faster scrolling
nnoremap <C-E> 5<C-E>
nnoremap <C-Y> 5<C-Y>

" buffer nav
" last buffer
nnoremap <leader>p :b#<CR>

" quickfix
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

"""""""""""""""""""""""""""""
"
" => SEARCH
"
"""""""""""""""""""""""""""""
nnoremap gr :exe "Ack '<C-R><C-W>'"<CR>


"""""""""""""""""""""""""""""
" => quickfix
"""""""""""""""""""""""""""""
" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
  if a:direction == "up"
    try
      execute a:prefix . "previous"
    catch /^Vim\%((\a\+)\)\=:E553/
      execute a:prefix . "last"
    catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
    endtry
  elseif a:direction == "down"
    try
      execute a:prefix . "next"
    catch /^Vim\%((\a\+)\)\=:E553/
      execute a:prefix . "first"
    catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
    endtry
  endif
endfunction
autocmd FileType qf wincmd J

" <Home> and <End> go up and down the quickfix list and wrap around
nnoremap <silent> [q :call WrapCommand('up', 'c')<CR>
nnoremap <silent> ]q  :call WrapCommand('down', 'c')<CR>

" <C-Home> and <C-End> go up and down the location list and wrap around
nnoremap <silent> [l :call WrapCommand('up', 'l')<CR>
nnoremap <silent> ]l  :call WrapCommand('down', 'l')<CR>

"""""""""""""""""""""""""""""
"" Gundo
"""""""""""""""""""""""""""""
let g:gundo_prefer_python3 = 1
nnoremap <F11> :GundoToggle<CR>


"""""""""""""""""""""""""""""
"" Airline
"""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_nr_type = 2

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':.'

let g:airline#extensions#tabline#left_sep = '  '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

let g:airline_mode_map = {
      \ 'n': 'N',
      \ 'i': 'I',
      \ 'v': 'v',
      \ 'V': 'V',
      \ 'r': 'R'
      \ }

let g:airline_section_x = "%{expand('%:p:.')}"
let g:airline_section_y = "%{fnamemodify(getcwd(), ':t')}"
let g:airline_section_c = "%{expand('%:t')}"

function! KFormat()
  let ln = line('.')
  execute ':Autoformat'
  execute 'normal! Go'
  execute 'normal! '.ln.'G'
endfunction
noremap <leader>f :Autoformat<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" CtrlP
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" size for response
let g:ctrlp_max_height = 15
" reuse cache between sessions
let g:ctrlp_clear_cache_on_exit = 0
" search inside hidden files and folders
let g:ctrlp_show_hidden = 1
" number of files to scan, 0=no limit
let g:ctrlp_max_files = 0
" max folder depth
let g:ctrlp_max_depth = 15
" opens ctrlp inside current working directory nearest root parent
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']

" use the silver searcher
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'
endif
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

set wildmode=list:full
set wildignore+=*node_modules/**
set wildignore+=*dist/**
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" C++
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
"set tags+=~/work/sidust/tags
"set tags+=~/work/opcua/tags
"set tags+=~/work/Performance_4149/miniweb/tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" Indent guides
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" tern vim
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>td :TernDef<CR>
nnoremap <leader>th :TernDoc<CR>
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>te :TernRename<CR>
nnoremap <leader>tt :TernType<CR>
let g:tern_show_argument_hints='on_hold'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" syntastic
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" javascript/typescript
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_single_quote_import = 1
let g:syntastic_typescript_tsc_fname = ''
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_use_vimproc = 1
nnoremap <Leader>t :echo tsuquyomi#hint()<CR>
inoremap TT <ESC>:echo tsuquyomi#hint()<CR>
nnoremap <leader>i :TsuImport<CR>
inoremap II <ESC>:TsuImport<CR>a
autocmd BufWinEnter *.ts,*.tsx call MarkTsImports()

function! MarkTsImports()
  exe "silent!normal! mm?^import \<cr>mi`m"
endfunction
autocmd FileType typescript nnoremap ,ii mp"yyiw`ioimport { <c-r>y } from '';<esc>ba
autocmd FileType typescript nnoremap ,ia mp"yyiw`ioimport * as <c-r>y from '<c-r>y';<esc>ba
autocmd filetype typescript let b:dispatch =getcwd() . '/node_modules/.bin/tsc\ --noEmit\ --p\ ./tsconfig.json'
autocmd filetype typescript setlocal makeprg=./node_modules/.bin/tsc\ --noEmit\ --p\ ./tsconfig.json
autocmd FileType typescript setlocal completeopt+=preview,menu


autocmd FileType javascript,typescript nnoremap <buffer> <leader>d :JsDoc<CR>
let g:jsdoc_allow_input_prompt = 0
let g:jsdoc_input_description = 1
let g:jsdoc_custom_args_regex_only = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" Fugitive
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gstatus<CR>10<C-W>+
nnoremap <leader>gd :Gvdiff<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" YCM
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_youcompleteme = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" Snippets
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Track the engine.

" Snippets are separated from the engine. Add this if you want them:

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltisnipsSnippetDirectory=["UltiSnips", "custom-snippets"]
let g:UltiSnipsEditSplit="vertical"


autocmd FileType typescript setlocal commentstring=//\ %s

""""
" python
"""""
autocmd FileType python let g:jedi#goto_command = "<c-]>"

