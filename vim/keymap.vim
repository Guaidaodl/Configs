source ~/.vim/config/utils.vim
function! ConfigKeymap()

  let g:which_key_map = {}
  """跟文件类型有关的快捷键
  autocmd FileType html noremap <F5> :!open %<CR><CR>
  autocmd FileType vim  noremap <F5> :source %<CR>
  autocmd FileType vim setl sw=2 sts=2
  autocmd FileType ruby setl sw=2 sts=2

  call keymap#mapMacAlt()

  "insert模式下的快捷键
  inoremap <C-k> <Esc>d$a
  inoremap fd <Esc>

  " Cmdline 的快捷键
  cnoremap <C-A> <Home>
  cnoremap <C-F> <Right>
  cnoremap <C-B> <Left>
  cnoremap <C-E> <End>
  
  "visual mode
  vnoremap <leader>y "+y
  vnoremap fd <Esc>

  "conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
  nnoremap <C-t> :NERDTreeToggle<CR>
  "移动光标的快捷键
  nnoremap <C-k> d$

  " laeder相关的配置
  nnoremap <leader><SPACE> :Commands<CR>
  nnoremap <leader>x :close<CR>

  " File 相关的配置
  let g:which_key_map.f = { 'name': '+file'}
  let g:Lf_ShortcutF = "<leader>ff"
  call keymap#nnore_leader_key_map('fs', ':w<CR>', 'save')

  " leaderf 相关的配置
  call keymap#nnore_leader_key_map('fb', ':Leaderf buffer --popup<CR>', 'buffer')
  call keymap#nnore_leader_key_map('ff', ':Leaderf file --popup', 'files')
  call keymap#nnore_leader_key_map('ft', ':Leaderf bufTag --popup', 'bufTag')

  "copy line to system clipboard
  nnoremap <leader>y "+yy
  nnoremap <leader>ev :tabe $MYVIMRC<CR>
  nnoremap <leader>sv :source $MYVIMRC<CR>:echo "(>^.^<)"<CR>

  "Buffer 相关的快捷键
  let g:which_key_map.b = { 'buffer': '+buffer' }
  let g:Lf_ShortcutB = '<leader>fb'
  call keymap#nnore_leader_key_map('bl', ':Buffers', 'buffers')
  call keymap#nnore_leader_key_map('bp', ':bp<CR>', 'previous buffer')
  call keymap#nnore_leader_key_map('bn', ':bn<CR>', 'next buffer')
  call keymap#nnore_leader_key_map('bd', ':bd<CR>', 'delete buffer')
  call keymap#nnore_leader_key_map('bk', ':bd<CR>', 'kill buffer')
  nnoremap <silent> <C-h> :bp<CR>
  nnoremap <silent> <C-l> :bn<CR>

  " Windows 相关的快捷键
  nnoremap <silent> <leader>w[ :NERDTreeToggle<CR>
  let g:which_key_map.w = { 'name': '+windows'}
  call keymap#nnore_leader_key_map('wd', ':close<CR>', 'close')
  call keymap#nnore_leader_key_map('ws', '<C-w>s', 'split')
  call keymap#nnore_leader_key_map('wv', '<C-w>v', 'vsplit')
  call keymap#nnore_leader_key_map('wo', '<C-w><C-w>', 'other')
  call keymap#nnore_leader_key_map('wm', '<C-w>o', 'maximum')
  call keymap#nnore_leader_key_map('wh', '<C-w>h', 'go left')
  call keymap#nnore_leader_key_map('wh', '<C-w>h', 'go left')
  call keymap#nnore_leader_key_map('wj', '<C-w>j', 'go down')
  call keymap#nnore_leader_key_map('wk', '<C-w>k', 'go up')
  call keymap#nnore_leader_key_map('wl', '<C-w>l', 'go right')
  call keymap#nnore_leader_key_map('w=', '<C-w>=', 'equal')
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  " Terminal
  if has('nvim')
    tnoremap fd <C-\><C-N>
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
  else
    tnoremap <A-h> <C-w>h
    tnoremap <A-j> <C-w>j
    tnoremap <A-k> <C-w>k
    tnoremap <A-l> <C-w>l
  endif

  " Quickfix 相关的快捷键
  nnoremap <leader>qc :ccl<CR>
  nnoremap <leader>qo :copen<CR>
  nnoremap <leader>qn :cn<CR>
  nnoremap <leader>qp :cp<CR>
  nnoremap <leader>ql :cl<CR>

  " Tab
  let g:which_key_map.t = {'name': '+tab'}
  call keymap#nnore_leader_key_map('tn', ":tabnew<CR>", "new")
  call keymap#nnore_leader_key_map('ts', ":tabs<CR>", "tabs")
  call keymap#nnore_leader_key_map('tl', ":tabnext<CR>", "left")
  call keymap#nnore_leader_key_map('th', ":tabprevious<CR>", "right")
  call keymap#nnore_leader_key_map('to', ":tabonly<CR>", "only")
  call keymap#nnore_leader_key_map('td', ":tabclose<CR>", "delete")
  call keymap#nnore_leader_key_map('te', ":call EditCurrentBufferInNewTab()<CR>", "edit")

  " Git 相关的快捷键
  let g:which_key_map.g = {'name': '+git'}
  call keymap#nnore_leader_key_map('gb', ":Gblame<CR>", "blame")
  call keymap#nnore_leader_key_map('gc', ":Gcommit<CR>", "commit")
  call keymap#nnore_leader_key_map('gd', ":Git diff<CR>", "diff")
  call keymap#nnore_leader_key_map('gs', ":Gstatus<CR>", "status")


  " 折叠的快捷键, z 实在太难摁了
  nnoremap <leader>h za

  nnoremap <leader>r :%s///gc<Left><Left><Left><Left>
  
  " marco
  let g:which_key_map.m = {'name': '+macro'}
  call keymap#nnore_leader_key_map('mm', "@@", "repeat")
  call keymap#nnore_leader_key_map('ma', "@a", "@a")
  call keymap#nnore_leader_key_map('mb', "@b", "@b")
  call keymap#nnore_leader_key_map('mc', "@c", "@c")
  call keymap#nnore_leader_key_map('md', "@d", "@d")
  call keymap#nnore_leader_key_map('m1', "@1", "@1")
  call keymap#nnore_leader_key_map('m2', "@2", "@2")
  call keymap#nnore_leader_key_map('m3', "@3", "@3")
  call keymap#nnore_leader_key_map('m4', "@4", "@4")
  call keymap#nnore_leader_key_map('m5', "@5", "@5")

  call which_key#register('<Space>', "g:which_key_map")
endfunction

function! keymap#nnore_leader_key_map(key_sequence, map, description)
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
  let cmd = "nnoremap <silent> <leader>" . a:key_sequence . " " . a:map
  execute cmd
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""
"
" 映射 Mac 的特殊字符到 Alt
"
"""""""""""""""""""""""""""""""""""""""""""""""
function! keymap#mapMacAlt()
  map ˙ <A-h>
  tmap ˙ <A-h>
  map ∆ <A-j>

  tmap ∆ <A-j>
  map ˚ <A-k>
  tmap ˚ <A-k>
  map ¬ <A-l>
  tmap ¬ <A-l>
  map ≈ <A-x>
  tmap ≈ <A-x>
endfunction

function! EditCurrentBufferInNewTab()
  let cur = bufnr("%")
  execute "tabe" 
  execute "buffer" . cur
endfunction
