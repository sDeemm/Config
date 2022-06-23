" platform.vim

if has("win32")
  " Hacking arround issue #7377. Basically, we need fixup the $path variable so
  " the clipboard starts working again.
  " TODO: Check if this is still needed.
  "let s:path_with_trailing=$path . ';'
  "let $path=substitute(s:path_with_trailing, ';;', ';', 'g')

  call setup#init_windows_specific()
else
  call setup#init_unix_specific()
endif
