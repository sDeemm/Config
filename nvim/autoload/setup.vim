let s:cpo_save = &cpo
set cpo&vim

function! setup#init_windows_specific()
  let g:python_host_prog='python.exe'
  let g:python3_host_prog='python3.exe'
endfunction

function! setup#init_unix_specific()
  cmap w!! w !sudo tee > /dev/null %
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
