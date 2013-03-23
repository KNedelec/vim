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
set background=dark
"colorscheme solarized
"colorscheme transparent
colorscheme github
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


"auto close 
imap {} {<cr>}<ESC>O


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows explore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

noremap <leader>e :Vexplore<CR>
noremap <leader>q :q<CR>
noremap <leader>= 10<C-W>+
noremap <leader>- 10<C-W>-
noremap <leader>> 20<C-W>>
noremap <leader>< 20<C-W><

"""""""""""""""""""""""""""""
" => grep current word
"""""""""""""""""""""""""""""
nnoremap gr :Ack '\b<cword>\b' *<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" PHP+ 
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
autocmd FileType php set omnifunc=phpcomplete#Complete
set tags+=~/.vim/tags/php

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


