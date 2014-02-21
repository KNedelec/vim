" VIM Configuration File
"
"

"""""""""""""""""""""""""""""""""""""""
"
"  1. Basic settings
"
"""""""""""""""""""""""""""""""""""""""
"
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()
"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
"
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120
set t_Co=256
filetype plugin indent on
syntax on
"let g:solarized_termcolors=256
set background=light
colorscheme transparent
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu

set hidden

set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set smartcase
set magic
set scrolloff=5   " always keep 5 lines visible above/below cursor

" always center screen on result
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*/app/cache/*
set title                " change the terminal's title


" No sounds 
set visualbell           " don't beep
set noerrorbells         " don't beep


" No backup , swap files in /var/tmp
set nobackup
set nowb
set directory=/var/tmp/

"switch paste mode
set pastetoggle=<F2>

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" delete to black hole register
nmap D "_d

" new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> <CR>i<CR><Esc>
" inverse of <s-J>
nnoremap <C-J> a<CR><Esc>k$

"auto close 
imap {} {<cr>}<ESC>O
imap (ff (function (){<cr>});<ESC>O

" folding
set foldmethod=syntax
set foldlevel=6

set nocursorline
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"Format the status line
set statusline=\ %{&paste}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



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

noremap <leader>e :Vexplore<CR>
noremap <leader>q :q<CR>
noremap <leader>= 10<C-W>+
noremap <leader>- 10<C-W>-
noremap <leader>> 20<C-W>>
noremap <leader>< 20<C-W><


" faster scrolling
noremap <C-E> 3<C-E>
noremap <C-Y> 3<C-Y>

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
nmap <F3> :noautocmd vimgrep // **/*<left><left><left><left><left><left>
nmap gr :noautocmd vimgrep /<C-R><C-W>/ **/*<CR>


"""""""""""""""""""""""""""""
" => quickfix
"""""""""""""""""""""""""""""
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" PHP 
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"autocmd FileType php set omnifunc=phpcomplete#Complete
"set tags+=~/.vim/tags/php
"set tags+=~/.vim/tags/phpt.tags

"PHP PDV documentor
" auto doc classes and properties
" 
"inoremap <leader>d <ESC>:call PhpDocSingle()<CR>i 
"nnoremap <leader>d :call PhpDocSingle()<CR> 
"vnoremap <leader>d :call PhpDocRange()<CR> 

"let g:pdv_cfg_Author = "Kevin Nedelec <kevin.nedelec@gmail.com"
"let g:pdv_cfg_php4always = 0
"let g:pdv_cfg_Uses = 0
"let g:pdv_cfg_Version = ""
"let g:pdv_cfg_Copyright = ""
"let g:pdv_cfg_License = ""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" CtrlP 
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" size for response
let g:ctrlp_max_height = 40
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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/debug/*,*/lib/*

nnoremap <C-P>p :CtrlP<CR>
nnoremap <C-P>, :CtrlPBuffer<CR>
nnoremap <C-P>; :CtrlPMRUFiles<CR>
nnoremap <C-P>m :CtrlPMixed<CR>
nnoremap <C-P>l :CtrlPLine<CR>
            


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" C++ 
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing '.' '->' or <C-o>
" Load standard tag files
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
nnoremap <leader>tr :TernRefs<CR>
nnoremap <leader>te :TernRename<CR>
nnoremap <leader>tt :TernType<CR>

