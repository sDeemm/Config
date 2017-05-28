"Snippet for console.log()"
function! PrintConsoleLog()
    normal! iconsole.log();
    normal! h
endfunction

function! StripTrailingWhiteSpaces()
    let _s=@/
    let l = line('.')
    let c = col('.')

    %s/\s\+$//e

    let @/=_s
    call cursor(l, c)
endfunction
