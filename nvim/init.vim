" init.vim

call plug#begin(stdpath('data') . '/plugged')

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
Plug 'sebdemers/coc-codesearch', {'dir': 'D:\src\coc-codesearch', 'frozen': 1}
"Plug 'sheerun/vim-polyglot'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tikhomirov/vim-glsl'
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
Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python -m chadtree deps'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colors
Plug 'gruvbox-community/gruvbox'
Plug 'marko-cerovac/material.nvim'
Plug 'navarasu/onedark.nvim'

call plug#end()

" FZF
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }
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

nnoremap <silent><nowait> <space>ff  :<c-u>CocList files -folder<cr>
nnoremap <silent><nowait> <space>fF  :<c-u>CocList --tab files -folder<cr>
nnoremap <silent><nowait> <space>fw  :<c-u>CocList files -workspace<cr>
nnoremap <silent><nowait> <space>fW  :<c-u>CocList --tab files -workspace<cr>
nnoremap <silent><nowait> <space>gf  :<c-u>CocList grep -folder -w <c-r><c-w><cr>
nnoremap <silent><nowait> <space>gF  :<c-u>CocList --tab grep -folder -w <c-r><c-w><cr>
nnoremap <silent><nowait> <space>gw  :<c-u>CocList grep -workspace -w <c-r><c-w><cr>
nnoremap <silent><nowait> <space>gW  :<c-u>CocList --tab grep -workspace -w <c-r><c-w><cr>
nnoremap <silent><nowait> <space>gg  :<c-u>CocList grep -w <c-r><c-w><cr>
nnoremap <silent><nowait> <space>gi  :<c-u>CocList grep -i <c-r><c-w><cr>
nnoremap <silent><nowait> <space>b   :<c-u>CocList buffers<cr>
nnoremap <silent><nowait> <space>B   :<c-u>CocList --tab buffers<cr>
nnoremap <silent><nowait> <space>j   :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k   :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p   :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <space>s   :<C-u>CocList symbols<CR>
nnoremap <silent><nowait> <c-p>      :<c-u>Files<cr>
nnoremap <silent><nowait> <A-o>      :<c-u>FSHere<cr>
nnoremap <silent><nowait> <A-m>      :<c-u>CocList outline<cr>

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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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


" edit file in the clipboard
nnoremap <silent><leader>ee :execute 'edit ' . @*<cr>

" ClangFormat
let g:clang_format_path = 'C:/Program Files/LLVM/bin/clang-format.exe'
map  <leader>cf      :py3f C:/Program Files/LLVM/share/clang/clang-format.py<cr>
imap <leader>cf <c-o>:py3f C:/Program Files/LLVM/share/clang/clang-format.py<cr>

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

" chadthree settings
let g:chadtree_settings = {
    \ 'theme' : {
      \ 'icon_glyph_set' : 'ascii',
    \ },
    \ 'view' : {
      \ 'open_direction' : 'right',
      \ 'width' : 61,
    \ },
  \ }

" ctags path
let g:tagbar_ctags_bin='C:/Users/sebdemers/scoop/shims/ctags.exe'

" XML Folding based on syntax
let g:xml_syntax_folding = 1

" Projectionist
let g:projectionist_heuristics = get(g:, 'projectionist_heuristics', {})

" csearch
let g:codesearch#csearch_cmd = 'csearch -n'
command! -bang -nargs=? CSearch call codesearch#csearch(<q-args>, <bang>0)
command! -bang -nargs=? CSearchCpp call codesearch#csearch_cpp(<q-args>, <bang>0)

" nvim-treesitter
lua << EOF
require'nvim-treesitter.install'.compilers = { 'clang', 'gcc', 'cl' }

-- Basic setup from https://github.com/nvim-treesitter/nvim-treesitter#modules
require'nvim-treesitter.configs'.setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "cpp",
    "glsl",
    "lua",
    "cmake",
    "go",
    "rust"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
EOF

" vim-maximizer
let g:maximizer_default_mapping_key = '<leader>mt'

let g:coc_enable_locationlist = 0
augroup coc_group
  autocmd!
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  autocmd User CocLocationsChange CocList --normal location
augroup END

aug fswitch_vim_grp
  au!
  au BufEnter *.cxx,*.cpp
    \ let b:fswitchdst = 'h,hxx,hpp' |
    \ let b:fswitchlocs = 'reg:/src/inc/,../../inc/**,./'
  au BufEnter *.h
    \ let b:fswitchdst = 'cxx,cpp,c' |
    \ let b:fswitchlocs = 'reg:/inc/src/,reg:/inc//,./'
aug END

set secure
