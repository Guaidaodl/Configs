source ~/.vim/config/utils.vim

function! ConfigKeymap()
  let mapleader = ' '

  """跟文件类型有关的快捷键
  autocmd FileType html noremap <F5> :!open %<CR><CR>
  autocmd FileType vim  noremap <F5> :source %<CR>
  autocmd FileType vim setl sw=2 sts=2
  autocmd FileType ruby setl sw=2 sts=2

  call keymap#mapMacAlt()

  "insert模式下的快捷键
  inoremap <C-k> <Esc>d$a
  inoremap jk <Esc>

  " Cmdline 的快捷键
  cnoremap <C-A> <Home>
  cnoremap <C-F> <Right>
  cnoremap <C-B> <Left>
  cnoremap <C-E> <End>
  
  "visual mode
  vnoremap jk <Esc>

  nnoremap <C-q> :NvimTreeToggle<CR>
  nnoremap <C-k> d$
  "移动光标的快捷键
  nnoremap H ^
  nnoremap L $

  " laeder相关的配置
  call utils#nnore_leader_key_map('p', '"0p', 'paste 0')
  call utils#vnore_leader_key_map('x', '"+d', 'Ctrl-X')
  call utils#vnore_leader_key_map('c', '"+y', 'Ctrl-C')
  call utils#nnore_leader_key_map('v', '"+p', 'Ctrl-V')

  let g:which_key_map.P = { 'name': '+Preferences'}
  call utils#nnore_leader_key_map('Pe', ':tabe $MYVIMRC<CR>', 'edit config')
  call utils#nnore_leader_key_map('Pl', ':source $MYVIMRC<CR> :echo "(>^.^<)"<CR>', 'load config')
  call utils#nnore_leader_key_map('Pi', ':PlugInstall<CR>', 'install plugins')
  call utils#nnore_leader_key_map('Pc', ':PlugClean<CR>', 'clean plugins')
  call utils#nnore_leader_key_map('Pu', ':PlugUpdate<CR>', 'update plugins')
  call utils#nnore_leader_key_map('Pg', ':PlugUpgrade<CR>', 'upgrade vim-plug')

  " File 相关的配置
  let g:which_key_map.f = { 'name': '+File'}
  call utils#nnore_leader_key_map('fq', ':q<CR>', 'quit')
  call utils#nnore_leader_key_map('fn', ':new<CR>', 'new')
  call utils#nnore_leader_key_map('fs', ':w<CR>', 'save')
  call utils#nnore_leader_key_map('fS', ':w ', 'save as')

  " leaderf 相关的配置
  let g:which_key_map.j = { 'name': '+Jump'}
  let g:Lf_ShortcutF = "<leader>jf"
  call utils#nnore_leader_key_map('jb', ':Leaderf buffer --popup<CR>', 'buffer')
  call utils#nnore_leader_key_map('jf', ':Leaderf file --popup<CR>', 'files')
  call utils#nnore_leader_key_map('jt', ':Leaderf bufTag --popup<CR>', 'bufTag')
  call utils#nnore_leader_key_map('jr', ':Leaderf rg --popup<CR>', 'rg')
  call utils#nnore_leader_key_map('jh', ':Leaderf cmdHistory --popup<CR>', 'cmd history')
  if has("gui_vimr")
    " mac 的一些快捷键
    nnoremap <D-e> :Leaderf buffer --popup<CR>
    nnoremap <D-o> :Leaderf file --popup<CR>
  endif

  "Buffer 相关的快捷键
  let g:which_key_map.b = { 'name': '+Buffer' }
  let g:Lf_ShortcutB = '<leader>fb'
  call utils#nnore_leader_key_map('bl', ':Leaderf buffer --popup<CR>', 'buffers')
  call utils#nnore_leader_key_map('bp', ':bp<CR>', 'previous buffer')
  call utils#nnore_leader_key_map('bn', ':bn<CR>', 'next buffer')
  call utils#nnore_leader_key_map('bd', ':bd<CR>', 'delete buffer')
  call utils#nnore_leader_key_map('bk', ':bd<CR>', 'kill buffer')
  nnoremap <silent> <C-h> :bp<CR>
  nnoremap <silent> <C-l> :bn<CR>

  let g:which_key_map.e = { 'name': '+Edit' }
  vnoremap <leader>y "+y
  call utils#nnore_leader_key_map('ey', '"+yy', 'copy line')
  call utils#nnore_leader_key_map('ep', '"+p', 'paste')
  call utils#nnore_leader_key_map('er', ':%s///gc<Left><Left><Left><Left>', 'replace')

  " Windows 相关的快捷键
  nnoremap <silent> <leader>w[ :NERDTreeToggle<CR>
  let g:which_key_map.w = { 'name': '+Windows'}
  call utils#nnore_leader_key_map('w1', ':1 wincmd w<CR>', 'window 1')
  call utils#nnore_leader_key_map('w2', ':2 wincmd w<CR>', 'window 2')
  call utils#nnore_leader_key_map('w3', ':3 wincmd w<CR>', 'window 3')
  call utils#nnore_leader_key_map('w4', ':4 wincmd w<CR>', 'window 4')
  call utils#nnore_leader_key_map('w5', ':5 wincmd w<CR>', 'window 5')
  let g:which_key_map.w.Q = { 'name': '+Quit Other'}
  call utils#nnore_leader_key_map('wQ1', ':1q<CR>', 'Quit W1')
  call utils#nnore_leader_key_map('wQ2', ':2q<CR>', 'Quit W2')
  call utils#nnore_leader_key_map('wQ3', ':3q<CR>', 'Quit W3')
  call utils#nnore_leader_key_map('wQ4', ':4q<CR>', 'Quit W4')
  call utils#nnore_leader_key_map('wQ5', ':5q<CR>', 'Quit W5')
  call utils#nnore_leader_key_map('wq', ':q<CR>', 'quit')
  call utils#nnore_leader_key_map('ws', '<C-w>s', 'split')
  call utils#nnore_leader_key_map('wv', '<C-w>v', 'vsplit')
  call utils#nnore_leader_key_map('wo', '<C-w><C-w>', 'other')
  call utils#nnore_leader_key_map('wm', '<C-w>o', 'maximum')
  call utils#nnore_leader_key_map('wh', '<C-w>h', 'go left')
  call utils#nnore_leader_key_map('wh', '<C-w>h', 'go left')
  call utils#nnore_leader_key_map('wj', '<C-w>j', 'go down')
  call utils#nnore_leader_key_map('wk', '<C-w>k', 'go up')
  call utils#nnore_leader_key_map('wl', '<C-w>l', 'go right')
  call utils#nnore_leader_key_map('w=', '<C-w>=', 'equal')
  if has("gui_vimr")
    nnoremap <D-1> :1 wincmd w<CR>
    nnoremap <D-2> :2 wincmd w<CR>
    nnoremap <D-3> :3 wincmd w<CR>
    nnoremap <D-4> :4 wincmd w<CR>
    nnoremap <D-5> :5 wincmd w<CR>
  endif
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
  call utils#nnore_leader_key_map('qc', ':ccl<CR>', 'Close')
  call utils#nnore_leader_key_map('qo', ':copen<CR>', 'Open')
  call utils#nnore_leader_key_map('qn', ':cn<CR>', 'Next error')
  call utils#nnore_leader_key_map('qp', ':cp<CR>', 'Previous error')
  call utils#nnore_leader_key_map('ql', ':cl<CR>', 'list error')

  " Tab
  let g:which_key_map.t = {'name': '+Tab'}
  call utils#nnore_leader_key_map('t1', "1gt", "Tab 1")
  call utils#nnore_leader_key_map('t2', "2gt", "Tab 2")
  call utils#nnore_leader_key_map('t3', "3gt", "Tab 3")
  call utils#nnore_leader_key_map('t4', "4gt", "Tab 4")
  call utils#nnore_leader_key_map('t5', "5gt", "Tab 5")
  call utils#nnore_leader_key_map('t6', "6gt", "Tab 6")
  call utils#nnore_leader_key_map('t7', "7gt", "Tab 7")
  call utils#nnore_leader_key_map('tn', ":tabnew<CR>", "new")
  call utils#nnore_leader_key_map('ts', ":tabs<CR>", "tabs")
  call utils#nnore_leader_key_map('tl', ":tabnext<CR>", "left")
  call utils#nnore_leader_key_map('th', ":tabprevious<CR>", "right")
  call utils#nnore_leader_key_map('to', ":tabonly<CR>", "only")
  call utils#nnore_leader_key_map('td', ":tabclose<CR>", "delete")
  call utils#nnore_leader_key_map('te', ":call EditCurrentBufferInNewTab()<CR>", "edit")

  " 折叠的快捷键, z 实在太难摁了
  nnoremap <leader>h za
  
  " marco
  let g:which_key_map.m = {'name': '+macro'}
  call utils#nnore_leader_key_map('mm', "@@", "repeat")
  call utils#nnore_leader_key_map('ma', "@a", "@a")
  call utils#nnore_leader_key_map('mb', "@b", "@b")
  call utils#nnore_leader_key_map('mc', "@c", "@c")
  call utils#nnore_leader_key_map('md', "@d", "@d")
  call utils#nnore_leader_key_map('m1', "@1", "@1")
  call utils#nnore_leader_key_map('m2', "@2", "@2")
  call utils#nnore_leader_key_map('m3', "@3", "@3")
  call utils#nnore_leader_key_map('m4', "@4", "@4")
  call utils#nnore_leader_key_map('m5', "@5", "@5")

  " 定义 lsp 的键位描述
  let g:which_key_map.l = { "name": "+lsp" }
  call utils#nnore_leader_key_map('ld', ':lua vim.lsp.buf.definition()<CR>', 'Definition')
  call utils#nnore_leader_key_map('lD', ':lua vim.lsp.buf.declaration()<CR>', 'Declaration')
  call utils#nnore_leader_key_map('lh', ':lua vim.lsp.buf.hover()<CR>', 'Hover')
  call utils#nnore_leader_key_map('lr', ':lua vim.lsp.buf.rename()<CR>', 'Rename')
  call utils#nnore_leader_key_map('ls', ':lua vim.lsp.buf.signature_help()<CR>', 'Signature')
  call utils#nnore_leader_key_map('lf', ':lua vim.lsp.buf.formatting()<CR>', 'Format File')
  call utils#vnore_leader_key_map('lf', ':lua vim.lsp.buf.range_formatting()<CR>', 'Format')
  call utils#nnore_leader_key_map('lR', ':lua vim.lsp.buf.references()<CR>', 'Reference')


  call which_key#register('<Space>', "g:which_key_map")
  call which_key#register('<Space>', "g:which_key_map")
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
