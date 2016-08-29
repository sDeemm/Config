set nocompatible              " be iMprove required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" NERDTree "
Plugin 'scrooloose/nerdtree'

" Ctrlp "
Plugin 'ctrlpvim/ctrlp.vim'

" vim-airline "
Plugin 'bling/vim-airline'

" Tagbar "
Plugin 'majutsushi/tagbar'

" Solarized "
Plugin 'altercation/vim-colors-solarized'

" Ack "
Plugin 'mileszs/ack.vim'

" YCM "
"Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Source vimscripts "
source ~/.vim/vim_private.vim

" Color Scheme "
syntax on
set background=dark
colorscheme solarized

" ***** Vim Settings ***** "

" Tabulation "
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Other settings "
set hidden
set backspace=2
set laststatus=2
set mouse=a
set confirm
set cmdheight=2
set hlsearch

set ignorecase
set smartcase

" ***** Key Maps ***** "
let mapleader=","

map <c-t> :NERDTreeToggle<CR>
map <F8>  :TagbarToggle<CR>
map <c-h> <c-w><<CR>
map <c-l> <c-w>><CR>
map <silent> <leader>n :bn<CR>
map <silent> <leader>N :bp<CR>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap "      ""<Left>
inoremap ""     ""

map  <leader>f  :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<CR>
imap <leader>f  :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py<CR>

nnoremap <leader>cl     :call PrintConsoleLog()<CR>
inoremap <leader>cl<CR> <C-O>:call PrintConsoleLog()<CR>

nnoremap <C-m><C-j> :m .+1<CR>==
nnoremap <C-m><C-k> :m .-2<CR>==
inoremap <C-m><C-j> <Esc>:m .+1<CR>==gi
inoremap <C-m><C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-m><C-j> :m '>+1<CR>gv=gv
vnoremap <C-m><C-k> :m '<-2<CR>gv=gv

" Variables "
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
