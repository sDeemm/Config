" ==============================================================================
" MIT License
"
" Copyright (c) 2019 Sebastien Demers
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.
" ==============================================================================

let s:cpo_save = &cpo
set cpo&vim

let s:db_path_ = 'D:\.csearchindex\test.csearchindex'

let g:codesearch#csearch_cmd =
    \ get( g:, 'g:codesearch#csearch_cmd', 'csearch -indexpath ' . s:db_path_ . ' -n' )

function! codesearch#csearch(pattern, bang)
  let csearch_cmd = g:codesearch#csearch_cmd . ' '
  call s:__csearch_helper(csearch_cmd, a:pattern, a:bang)
endfunction

function! codesearch#csearch_cpp(pattern, bang)
  let csearch_cmd = g:codesearch#csearch_cmd . ' -f "\.(h|hh|hpp|hxx|c|cc|cpp|cxx)$" '
  call s:__csearch_helper(csearch_cmd, a:pattern, a:bang)
endfunction

function! s:__csearch_helper(csearch_cmd, pattern, bang)
  let search_word = len(a:pattern) > 0
      \ ? shellescape(a:pattern)
      \ : expand('<cword>')
  let source_value = a:csearch_cmd . search_word
  call fzf#run(fzf#wrap('csearch', {'source': source_value, 'sink*': function('s:__csearch_sink'), 'options': '--multi'}, a:bang))
endfunction

function! s:__csearch_sink(selection)
  for item in a:selection
    let s = split(item, ':', 1)
    execute 'edit +' . s[2] . ' ' . s[1]
    normal! zz
  endfor
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

