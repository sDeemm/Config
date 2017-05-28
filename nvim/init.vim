set nocompatible              " be iMprove required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'valloric/youcompleteme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Source vimscripts "
source ~/.vim/vim_private.vim

" Color Scheme "
syntax on
colorscheme molokai

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
set noshowmode
set clipboard=unnamed
set cursorline
set relativenumber
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

nnoremap <leader>cl     :call PrintConsoleLog()<CR>
inoremap <leader>cl<CR> <C-O>:call PrintConsoleLog()<CR>

nnoremap <c-m><c-j> :m .+1<CR>==
nnoremap <c-m><c-k> :m .-2<CR>==
inoremap <c-m><c-j> <Esc>:m .+1<CR>==gi
inoremap <c-m><c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-m><c-j> :m '>+1<CR>gv=gv
vnoremap <c-m><c-k> :m '<-2<CR>gv=gv

nnoremap <leader>g :YcmCompleter GoToDefinition<CR>

cmap w!! w !sudo tee > /dev/null %

" Variables "
let g:airline#extensions#tagbar#enabled  = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Emmet settings "
let g:user_emmet_install_global = 0
augroup Emmetgroup
    autocmd!
    autocmd FileType html,css EmmetInstall
augroup END

