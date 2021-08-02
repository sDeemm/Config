" init.vim

call plug#begin(stdpath('data') . '/plugged')

"Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-fswitch'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdtree'
Plug 'sebdemers/coc-codesearch', {'dir': 'D:\src\coc-codesearch', 'frozen': 1}
"Plug 'sheerun/vim-polyglot'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'szw/vim-maximizer'
Plug 'dbeniamine/cheat.sh-vim'

" Colors
Plug 'gruvbox-community/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

" ***** Vim Settings ***** "

" Tabulation "
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Other settings "
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
set wildmenu
set wildignore+=*/build/*
set wildoptions=pum,tagfile
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

" Default folding
set foldmethod=indent
set nofoldenable
set foldnestmax=10

" Color Scheme "
" let g:material_theme_style = 'darker'
" colorscheme material
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
colorscheme onedark
set background=dark

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" abbrev
function! s:__setup_command_abbrev_helper(from, to)
  exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call <sid>__setup_command_abbrev_helper('C', 'CocConfig')
call <sid>__setup_command_abbrev_helper('CS', 'CSearch')
call <sid>__setup_command_abbrev_helper('L', 'CocList')
call <sid>__setup_command_abbrev_helper('LL', 'CocList --tab')
call <sid>__setup_command_abbrev_helper('T', 'OpenTODO')
call <sid>__setup_command_abbrev_helper('RC', 'OpenDotInitFile')
call <sid>__setup_command_abbrev_helper('R', 'CocListResume')

" ***** Key Maps ***** "
let mapleader=","

map <silent> <f8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarCurrentTag p<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

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
nnoremap <C-L> :<C-U>nohl<CR><C-L>
nnoremap Q @q
vnoremap Q :normal! @q<CR>
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-h> :cprev<CR>zzzv
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

nnoremap <space>ff   :<c-u>CocList files -folder<cr>
nnoremap <space>fF   :<c-u>CocList --tab files -folder<cr>
nnoremap <space>fw   :<c-u>CocList files -workspace<cr>
nnoremap <space>fW   :<c-u>CocList --tab files -workspace<cr>
nnoremap <space>b    :<c-u>CocList buffers<cr>
nnoremap <space>B    :<c-u>CocList --tab buffers<cr>
nnoremap <space>gf   :<c-u>CocList grep -folder -w <c-r><c-w><cr>
nnoremap <space>gF   :<c-u>CocList --tab grep -folder -w <c-r><c-w><cr>
nnoremap <space>gw   :<c-u>CocList grep -workspace -w <c-r><c-w><cr>
nnoremap <space>gW   :<c-u>CocList --tab grep -workspace -w <c-r><c-w><cr>
nnoremap <space>gg   :<c-u>CocList grep -w <c-r><c-w><cr>
nnoremap <space>gi   :<c-u>CocList grep -i <c-r><c-w><cr>
nnoremap <c-p> :<c-u>CocList files<cr>

nnoremap <silent><A-o> :<c-u>FSHere<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
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
nnoremap <silent><buffer> <Space>nl :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nnoremap <silent><buffer> <Space>nk :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nnoremap <silent><buffer> <Space>nj :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nnoremap <silent><buffer> <Space>nh :call CocLocations('ccls','$ccls/navigate',{'direction':'U'}

" Use K to show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

let g:coc_enable_locationlist = 0
augroup coc_group
  autocmd!
  "autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  autocmd User CocLocationsChange CocList --normal location
augroup END

"
" Autocmds for FSwitch
"
aug fswitch_vim_grp
  au!
  au BufEnter *.cxx, *.cpp
    \ let b:fswitchdst = 'h,hxx,hpp' |
    \ let b:fswitchlocs = 'reg:/src/include/'
  au BufEnter *.h
    \ let b:fswitchdst = 'cxx,cpp,c' |
    \ let b:fswitchlocs = 'reg:/include/src/'
aug END

" edit file in the clipboard
nnoremap <silent><leader>ee :execute 'edit ' . @*<cr>

" ClangFormat
let g:clang_format_path = 'D:/LLVM/bin/clang-format.exe'
map  <leader>cf      :py3f D:/LLVM/share/clang/clang-format.py<cr>
imap <leader>cf <c-o>:py3f D:/LLVM/share/clang/clang-format.py<cr>

" Find the word under cursor and populate the quickfix list
nnoremap <silent><leader>sw :<c-u>call <sid>__find_word_under_cursor()<cr>
function s:__find_word_under_cursor()
  execute 'CocList -I --normal --input='.expand('<cword>').' words'
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

command! CopyFile     call s:EscapePathWin32AndClipboard(expand("%:p"))
command! CopyFileName call s:EscapePathWin32AndClipboard(expand("%:t"))
command! CopyFileDir  call s:EscapePathWin32AndClipboard(expand("%:p:h"))
command! OpenDotInitFile edit $MYVIMRC
command! OpenTODO edit D:\myCAE\sandbox\TODO.md

" Lightline settings
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'absolutepath', 'modified' ] ]
  \ },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 1
  \   },
  \ 'colorscheme': 'one',
  \ 'component_function': {
  \   'cocstatus': 'coc#status'
  \ }
  \ }

" XML Folding based on syntax
let g:xml_syntax_folding = 1

" NERDTree
let NERDTreeWinPos="right"
let NERDTreeWinSize=61

" Projectionist
let g:projectionist_heuristics = get(g:, 'projectionist_heuristics', {})

" csearch
let g:codesearch#csearch_cmd = 'csearch -n'
command! -bang -nargs=? CSearch call codesearch#csearch(<q-args>, <bang>0)
command! -bang -nargs=? CSearchCpp call codesearch#csearch_cpp(<q-args>, <bang>0)

" vim-maximizer
let g:maximizer_default_mapping_key = '<leader>mt'

if has("win32")
  " Hacking arround issue #7377. Basically, we need fixup the $path variable so
  " the clipboard starts working again.
  " TODO: Check if this is still needed.
  let s:path_with_trailing=$path . ';'
  let $path=substitute(s:path_with_trailing, ';;', ';', 'g')

  call setup#init_windows_specific()
else
  call setup#init_unix_specific()
endif

set secure
