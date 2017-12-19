
let s:debug = 0 

if (!s:debug && exists("g:custom_load_util"))
  finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 判断是否是 Unix 系, 包括Mac 和 Linux
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! IsUnix()
  return has('unix')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 判断是否是 Mac 系统
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! IsMac()
  return has('macunix')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 判断是否是 Linux 系统
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! IsLinux() 
  return !IsMac()
endfunction
    
let g:custom_load_util = 1
