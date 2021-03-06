set nocompatible " Be iMproved
set shell=bash

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
" Autocomplete
NeoBundle 'Valloric/YouCompleteMe'
" Files
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'bitc/vim-bad-whitespace'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
" Movement
NeoBundle 'justinmk/vim-sneak'
" Surround and Repeat
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
" Git Gutter
NeoBundle 'airblade/vim-gitgutter'
" Python
NeoBundle 'nvie/vim-flake8'
" Ruby
NeoBundle 'thoughtbot/vim-rspec'
" Syntax
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'pearofducks/ansible-vim'
" Colours
NeoBundle 'junegunn/seoul256.vim'
" Zen Mode
NeoBundle 'junegunn/goyo.vim'

call neobundle#end()

set t_Co=256

" Settings
let mapleader=","

set nobackup
set noswapfile

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pyc
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app
set wildignore+=*/target/**

syntax enable " highlighting
set autoread " auto load changed files
set number " line numbers
set cursorline " show line which cursors on
set splitright " split right always
set splitbelow " split below always
set laststatus=2 " show airline
set scrolloff=20 " Minimal number of screen lines to keep above and below the cursor
set noshowmode " No need to show mode due to Powerline
set colorcolumn=79

set backspace=eol,start,indent " sane backspace
autocmd BufWritePre * :%s/\s\+$//e " No whitespace
filetype plugin indent on

" tabs
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftwidth=4
set smarttab
set copyindent

let g:ruby_path = system('rvm current')

" Filetypes and indenting

au FileType javascript setl sw=2 sts=2 et
au FileType twig setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
au FileType less setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et

let python_highlight_all = 1 " python highlight all
let ruby_operators = 1

" Pretty
if has('gui_running')
    set guioptions=
endif

set background=dark
colo seoul256

"""""""""""""""
""" Keymaps
"""""""""""""""
map ; :
map ;; ;
imap jj <Esc>
imap jk <Esc>
imap kj <Esc>

map <C-n> :NERDTreeToggle<CR>

" navigate/resize splits
" j and J
map <C-j> <C-W>j
map <S-j> <C-W>-
" k and K
map <C-k> <C-W>k
map <S-k> <C-W>+
" h and H
map <C-h> <C-W>h
map <S-h> <C-W><
" l and L
map <C-l> <C-W>l
map <S-l> <C-W>>
" hide highlighted
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" U redo since u undos
nnoremap U <c-r>

" Zen Mode
nnoremap <Leader>z :Goyo<CR>

" Rspec
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>c :call RunCurrentSpecFile()<CR>

map <Leader>j :JSHint<CR>

"""""""""""""""""""
""" Plugin Settings
"""""""""""""""""""

" Unite
let g:unite_split_rule = "botright"

" Unite Outline
nnoremap <silent> <leader>o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let NERDTreeIgnore = ['\.pyc$', '_site']

" Airline
let g:airline_right_sep=''
let g:airline_left_sep=''
let g:airline_fugitive_prefix = ''

