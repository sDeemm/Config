
function! setup#init_windows_specific()
  let g:python_host_prog='C:/Python27/python.exe'
  let g:python3_host_prog='E:/scoop/apps/python/3.8.0/python.exe'
endfunction

function! setup#init_unix_specific()
  cmap w!! w !sudo tee > /dev/null %
endfunction
