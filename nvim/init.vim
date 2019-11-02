set nocompatible

call plug#begin(stdpath('data') . '/plugged')

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kaicataldo/material.vim'
Plug 'majutsushi/tagbar'
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/echodoc.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-neco'

call plug#end()

filetype plugin indent on
syntax on

" Color Scheme "
let g:material_theme_style = 'darker'
colorscheme material

" ***** Vim Settings ***** "

" Tabulation "
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Other settings "
set encoding=utf-8
set hidden
set backspace=2
set laststatus=2
set showtabline=2
set mouse=a
set confirm
set cmdheight=2
set hlsearch
set noshowmode
"set clipboard=unnamedplus
set cursorline
set number
set relativenumber
set ignorecase
set smartcase
set wildmenu
set wildignore+=*/build/*
set wildoptions=pum,tagfile
set completeopt=menuone,noselect
set colorcolumn=120
set signcolumn=yes
set updatetime=300
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

" Default folding
set foldmethod=indent
set nofoldenable
set foldnestmax=10

" abbrev
function! s:__setup_command_abbrev_helper(from, to)
  exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call <sid>__setup_command_abbrev_helper('C', 'CocConfig')
call <sid>__setup_command_abbrev_helper('CS', 'CSearch')
call <sid>__setup_command_abbrev_helper('L', 'CocList')
call <sid>__setup_command_abbrev_helper('T', 'OpenTODO')
call <sid>__setup_command_abbrev_helper('RC', 'OpenDotInitFile')

" ***** Key Maps ***** "
let mapleader=","

map <silent> <f4> :NERDTreeToggle<CR>
map <silent> <f8> :TagbarToggle<CR>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <silent><leader>ff  :<c-u>CocList files<cr>
nnoremap <silent><leader>fg  :<c-u>CocList grep -w <c-r><c-w><cr>
nnoremap <silent><leader>ft  :<c-u>CocList tags<cr>
nnoremap <silent><leader>fh  :<c-u>CocList mru<cr>
nnoremap <silent><leader>fb  :<c-u>CocList buffers<cr>
nnoremap <silent><leader>fw  :<c-u>CocList words<cr>
nnoremap <silent><leader>rg  :Rg \b<c-r><c-w>\b<cr>
nnoremap <silent><leader>RG  :Rg! \b<c-r><c-w>\b<cr>
nnoremap <c-p> :<c-u>FZF<cr>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ccls mappings
" bases
nnoremap <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nnoremap <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nnoremap <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nnoremap <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>
" caller
nnoremap <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nnoremap <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
" member variables / variables in a namespace
nnoremap <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nnoremap <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nnoremap <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>
" navigate
nnoremap <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nnoremap <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nnoremap <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nnoremap <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'}

" Use K to show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

augroup coc_group
autocmd!
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END

" edit file in the clipboard
nnoremap <silent><leader>ee :execute 'edit ' . @*<cr>

" ClangFormat
map  <leader>cf      :<c-u>pyf E:\llvm-project\out\9.0.0\share\clang\clang-format.py<cr>
imap <leader>cf <c-o>:<c-u>pyf E:\llvm-project\out\9.0.0\share\clang\clang-format.py<cr>

" Find the word under cursor and populate the quickfix list
nnoremap <silent><leader>sw :<c-u>call<sid>__find_word_under_cursor()<cr>
function s:__find_word_under_cursor()
  exec "vimgrep /\\<" . expand("<cword>") . "\\>/gj %" | CocList quickfix
endfunction

" Custom escape path function mainly needed for Windows
function! s:__MyEscapePath(path)
  let l:path=substitute(a:path, '/', '\', 'g')
  let l:path=substitute(l:path, '\\\\', '\', 'g')
  return l:path
endfunction

" Open in Explorer
command! OpenInExplorer call s:OpenInExplorer(expand("%:p:h"))
function! s:OpenInExplorer(path)
  execute "silent! !explorer " . s:__MyEscapePath(a:path)
  normal! \<cr>
endfunction

" Removes trailing spaces.
command! TrimWS  call s:TrimWhiteSpace()
function! s:TrimWhiteSpace()
  %s/\s\+$//e
  ''
endfunction

" Escape path and yank to clipboard
function! s:EscapePathWin32AndClipboard(path)
  let @*=s:__MyEscapePath(a:path)
endfunction

command! CopyFile    call s:EscapePathWin32AndClipboard(expand("%:p"))
command! CopyFileDir call s:EscapePathWin32AndClipboard(expand("%:p:h"))
command! OpenDotInitFile edit $MYVIMRC
command! OpenTODO edit E:\myCAE\sandbox\TODO.md

" lightline settings "
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'absolutepath', 'modified' ] ]
  \ },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 1
  \   },
  \ 'colorscheme': 'material_vim',
  \ 'tabline' : {'left': [['buffers']], 'right': [['close']]},
  \ 'component_expand' : {'buffers': 'lightline#bufferline#buffers'},
  \ 'component_type' : {'buffers': 'tabsel'},
  \ 'component_function': {
  \   'cocstatus': 'coc#status'
  \ }
  \ }

" Hacking arround issue #7377. Basically, we need fixup the $path variable so
" the clipboard starts working again.
" TODO: Check if this is still needed.
let s:path_with_trailing=$path . ';'
let $path=substitute(s:path_with_trailing, ';;', ';', 'g')

" XML Folding based on syntax
let g:xml_syntax_folding = 1

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
highlight link EchoDocFloat Pmenu

" git grep
command! -bang -nargs=* GGrep
  \  call fzf#vim#grep(
  \    'git grep --line-number '.shellescape(<q-args>), 0,
  \    { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Handle external files changes
aug checktime_grp
  au!
  au FocusGained,BufEnter * :checktime
aug END

" Projectionist
let g:projectionist_heuristics = get(g:, 'projectionist_heuristics', {})

" indentLine settings
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 0

" csearch
command! -bang -nargs=? CSearch call codesearch#csearch(<q-args>, <bang>0)
nnoremap <leader>cs :CSearch \b<C-R><C-W>\b<CR>

if has("win32")
  call setup#init_windows_specific()
else
  call setup#init_unix_specific()
endif

