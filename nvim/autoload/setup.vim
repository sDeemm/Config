
function! setup#init_windows_specific()
  let g:python_host_prog='E:/scoop/apps/python27/current/python.exe'
  let g:python3_host_prog='E:/scoop/apps/python/current/python.exe'
endfunction

function! setup#init_unix_specific()
  cmap w!! w !sudo tee > /dev/null %
endfunction
