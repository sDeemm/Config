" Tabulation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Menu
set wildmode=full
set wildmenu
set wildignore+=*/build/*
set wildignore+=*_build/*
set wildignore+=*.pyc
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildoptions=pum,tagfile

" Other settings
set encoding=utf-8
set nowrap
set hidden
set backspace=2
set laststatus=2
set showtabline=2
set sidescroll=5
set mouse=a
set confirm
set cmdheight=2
set nohlsearch
set noshowmode
set cursorline
set number
set relativenumber
set ignorecase
set smartcase
set completeopt=menuone,noselect
set tags+=.git/tags
set colorcolumn=120
set signcolumn=yes
set updatetime=50
set shortmess+=c
set lazyredraw
set inccommand=split
set list
set listchars=tab:┆\ ,trail:-,nbsp:+,extends:»,precedes:«
set novisualbell
set pumheight=15
set path+=**
set belloff=all
set nobackup
set nowritebackup
set noimdisable
set noswapfile
set undofile
set undodir=~/.undodir
if has('termguicolors')
  set termguicolors
endif

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldminlines=2
set foldnestmax=10
set nofoldenable
