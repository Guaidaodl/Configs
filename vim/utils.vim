let s:debug = 0 

if (!s:debug && exists("g:custom_load_util"))
  finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 判断是否是 Unix 系, 包括Mac 和 Linux
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! utils#isUnix()
  return has('unix')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 判断是否是 Mac 系统
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! utils#isMac()
  return has('macunix')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 判断是否是 Linux 系统
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! utils#isLinux() 
  return !utils#isMac()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 添加 <leader> 相关的快捷键并添加描述
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! utils#vnore_leader_key_map(key_sequence, map, description)
  call utils#leader_key_map("vnoremap", a:key_sequence, a:map, a:description)
endfunction

function! utils#nnore_leader_key_map(key_sequence, map, description)
  call utils#leader_key_map("nnoremap", a:key_sequence, a:map, a:description)
endfunction

function! utils#leader_key_map(map_type, key_sequence, map, description)
  let index = 0
  let len = len(a:key_sequence)
  let current_map = g:which_key_map

  while index < len
    let key = a:key_sequence[index]
    if index < len -1
      """ 创建中间的节点
      if !has_key(current_map, key)
        let current_map[key] = {}
      endif
      let current_map = current_map[key]
    else
      " 写入描述
      let current_map[key] = a:description
    endif

    let index = index + 1
  endwhile
  let cmd = a:map_type . " <silent> <leader>" . a:key_sequence . " " . a:map
  execute cmd
endfunction
   
let g:custom_load_util = 1
