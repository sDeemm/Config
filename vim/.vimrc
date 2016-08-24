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

" YCM "
Plugin 'valloric/youcompleteme'

" vim-airline "
Plugin 'bling/vim-airline'

" Tagbar "
Plugin 'majutsushi/tagbar'

" Solarized "
Plugin 'altercation/vim-colors-solarized'

" Ack "
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Color Scheme "
syntax on
set background=dark
colorscheme solarized

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

" Map "
let mapleader=","
map <c-t> :NERDTreeToggle<CR>
map <c-h> <c-w><<CR>
map <c-l> <c-w>><CR>
map <silent> <leader>n :bn<cr>
map <silent> <leader>p :bp<cr>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap "      ""<Left>
inoremap ""     ""

map <F8>       :TagbarToggle<cr>

map <leader>f  :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py
imap <leader>f :pyf /usr/share/vim/addons/syntax/clang-format-3.4.py

inoremap <leader>cl<CR> console.log();<Left><Left>

" Variables "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
