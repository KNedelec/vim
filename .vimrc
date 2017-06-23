" VIM Configuration File

set nocompatible

"""""""""""""""""""""""""""""""""""""""
"
"  Plugin managers
"
"""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'sjl/gundo.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'chrisbra/Recover.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'evidens/vim-twig'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/vim-js-pretty-template'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

imap jj <ESC>

" todo: REMOVE
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
execute pathogen#infect()
call pathogen#runtime_append_all_bundles()


"""""""""""""""""""""""""""""""""""""""
"
"  Basic settings
"
"""""""""""""""""""""""""""""""""""""""

"
" Theme
"
set background=light
colorscheme lucius "wombat256, solarized
let g:solarized_termcolors=256
" day mode
nnoremap <leader>n :set background=dark<CR>
" night mode
nnoremap <leader>N :set background=light<CR>

"
" Vimrc - Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vs $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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
set wildignore=*.swp,*.bak,plugins,*/app/cache/*,*/node_modules,*/dist/*,*/vendor
set title                " change the terminal's title
set noerrorbells         " don't beep
set nobackup
set nowb
set directory=/var/tmp/

"
" Search
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
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
set path=.,../,,

" Always show the status line
set laststatus=2


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
nmap <F3> :noautocmd vimgrep // **/*<left><left><left><left><left><left>
nmap gr :noautocmd vimgrep /<C-R><C-W>/ **/*<CR>


"""""""""""""""""""""""""""""
" => quickfix
"""""""""""""""""""""""""""""
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

"""""""""""""""""""""""""""""
"" Gundo
"""""""""""""""""""""""""""""
nnoremap <F11> :GundoToggle<CR>


"""""""""""""""""""""""""""""
"" Airline
"""""""""""""""""""""""""""""
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
noremap <leader>f :call KFormat()<cr>

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
endif
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules/*,*/debug/*,*/dist/*


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
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" javascript/typescript
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_single_quote_import = 1
let g:syntastic_typescript_tsc_fname = ''
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_completion_preview = 1
autocmd FileType typescript setlocal completeopt+=preview
nnoremap <Leader>t :echo tsuquyomi#hint()<CR>
nnoremap <leader>i :TsuImport<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
"" Snippets
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Track the engine.

" Snippets are separated from the engine. Add this if you want them:

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

autocmd FileType typescript setlocal commentstring=//\ %s

