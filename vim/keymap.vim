source ~/.vim/config/utils.vim

function! ConfigKeymap()
  let mapleader = ' '

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
  vnoremap fd <Esc>

  nnoremap <C-t> :NERDTreeToggle<CR>
  nnoremap <C-k> d$
  "移动光标的快捷键
  nnoremap H ^
  nnoremap L $

  " laeder相关的配置
  call keymap#nnore_leader_key_map('p', '"0p', 'paste 0')
  call keymap#vnore_leader_key_map('x', '"+d', 'Ctrl-X')
  call keymap#vnore_leader_key_map('c', '"+y', 'Ctrl-C')
  call keymap#nnore_leader_key_map('v', '"+p', 'Ctrl-V')

  let g:which_key_map.P = { 'name': '+Preferences'}
  call keymap#nnore_leader_key_map('Pe', ':tabe $MYVIMRC<CR>', 'edit config')
  call keymap#nnore_leader_key_map('Pl', ':source $MYVIMRC<CR> :echo "(>^.^<)"<CR>', 'load config')
  call keymap#nnore_leader_key_map('Pi', ':PlugInstall<CR>', 'install plugins')
  call keymap#nnore_leader_key_map('Pc', ':PlugClean<CR>', 'clean plugins')
  call keymap#nnore_leader_key_map('Pu', ':PlugUpdate<CR>', 'update plugins')
  call keymap#nnore_leader_key_map('Pg', ':PlugUpgrade<CR>', 'upgrade vim-plug')

  " File 相关的配置
  let g:which_key_map.f = { 'name': '+File'}
  call keymap#nnore_leader_key_map('fq', ':q<CR>', 'quit')
  call keymap#nnore_leader_key_map('fn', ':new<CR>', 'new')
  call keymap#nnore_leader_key_map('fs', ':w<CR>', 'save')
  call keymap#nnore_leader_key_map('fS', ':w ', 'save as')

  " leaderf 相关的配置
  let g:which_key_map.j = { 'name': '+Jump'}
  let g:Lf_ShortcutF = "<leader>jf"
  call keymap#nnore_leader_key_map('jb', ':Leaderf buffer --popup<CR>', 'buffer')
  call keymap#nnore_leader_key_map('jf', ':Leaderf file --popup<CR>', 'files')
  call keymap#nnore_leader_key_map('jt', ':Leaderf bufTag --popup<CR>', 'bufTag')
  call keymap#nnore_leader_key_map('jr', ':Leaderf rg --popup<CR>', 'rg')
  call keymap#nnore_leader_key_map('jh', ':Leaderf cmdHistory --popup<CR>', 'cmd history')

  "Buffer 相关的快捷键
  let g:which_key_map.b = { 'name': '+Buffer' }
  let g:Lf_ShortcutB = '<leader>fb'
  call keymap#nnore_leader_key_map('bl', ':Leaderf buffer --popup<CR>', 'buffers')
  call keymap#nnore_leader_key_map('bp', ':bp<CR>', 'previous buffer')
  call keymap#nnore_leader_key_map('bn', ':bn<CR>', 'next buffer')
  call keymap#nnore_leader_key_map('bd', ':bd<CR>', 'delete buffer')
  call keymap#nnore_leader_key_map('bk', ':bd<CR>', 'kill buffer')
  nnoremap <silent> <C-h> :bp<CR>
  nnoremap <silent> <C-l> :bn<CR>

  let g:which_key_map.e = { 'name': '+Edit' }
  vnoremap <leader>y "+y
  call keymap#nnore_leader_key_map('ey', '"+yy', 'copy line')
  call keymap#nnore_leader_key_map('ep', '"+p', 'paste')
  call keymap#nnore_leader_key_map('er', ':%s///gc<Left><Left><Left><Left>', 'replace')

  " Windows 相关的快捷键
  nnoremap <silent> <leader>w[ :NERDTreeToggle<CR>
  let g:which_key_map.w = { 'name': '+Windows'}
  call keymap#nnore_leader_key_map('1', ':1 wincmd w<CR>', 'window 1')
  call keymap#nnore_leader_key_map('2', ':2 wincmd w<CR>', 'window 2')
  call keymap#nnore_leader_key_map('3', ':3 wincmd w<CR>', 'window 3')
  call keymap#nnore_leader_key_map('4', ':4 wincmd w<CR>', 'window 4')
  call keymap#nnore_leader_key_map('5', ':5 wincmd w<CR>', 'window 5')
  call keymap#nnore_leader_key_map('w1', ':1 wincmd w<CR>', 'window 1')
  call keymap#nnore_leader_key_map('w2', ':2 wincmd w<CR>', 'window 2')
  call keymap#nnore_leader_key_map('w3', ':3 wincmd w<CR>', 'window 3')
  call keymap#nnore_leader_key_map('w4', ':4 wincmd w<CR>', 'window 4')
  call keymap#nnore_leader_key_map('w5', ':5 wincmd w<CR>', 'window 5')
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
  let g:which_key_map.q = {'name': '+QuickFix'}
  call keymap#nnore_leader_key_map('qc', ':ccl<CR>', '')
  call keymap#nnore_leader_key_map('qo', ':copen<CR>', '')
  call keymap#nnore_leader_key_map('qn', ':cn<CR>', '')
  call keymap#nnore_leader_key_map('qp', ':cp<CR>', '')
  call keymap#nnore_leader_key_map('ql', ':cl<CR>', '')

  " Tab
  let g:which_key_map.t = {'name': '+Tab'}
  call keymap#nnore_leader_key_map('t1', "1gt", "Tab 1")
  call keymap#nnore_leader_key_map('t2', "2gt", "Tab 2")
  call keymap#nnore_leader_key_map('t3', "3gt", "Tab 3")
  call keymap#nnore_leader_key_map('t4', "4gt", "Tab 4")
  call keymap#nnore_leader_key_map('t5', "5gt", "Tab 5")
  call keymap#nnore_leader_key_map('t6', "6gt", "Tab 6")
  call keymap#nnore_leader_key_map('t7', "7gt", "Tab 7")
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

  " 定义 lsp 的键位描述
  let g:which_key_map.l = { "name": "+lsp" }
  let g:which_key_map.l["f"] = "Format"
  let g:which_key_map.l["d"] = "Definition"
  let g:which_key_map.l["D"] = "Declaration"
  let g:which_key_map.l["p"] = "Parameters"
  let g:which_key_map.l["r"] = "References"


  call which_key#register('<Space>', "g:which_key_map")
  call which_key#register('<Space>', "g:which_key_map")
endfunction

function! keymap#vnore_leader_key_map(key_sequence, map, description)
  call keymap#leader_key_map("vnoremap", a:key_sequence, a:map, a:description)
endfunction

function! keymap#nnore_leader_key_map(key_sequence, map, description)
  call keymap#leader_key_map("nnoremap", a:key_sequence, a:map, a:description)
endfunction

function! keymap#leader_key_map(map_type, key_sequence, map, description)
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
