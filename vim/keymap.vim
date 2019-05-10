source ~/.vim/config/utils.vim
function! ConfigKeymap()
  
  """跟文件类型有关的快捷键
  autocmd FileType html noremap <F5> :!open %<CR><CR>
  autocmd FileType vim  noremap <F5> :source %<CR>
  autocmd FileType vim setl sw=2 sts=2
  autocmd FileType ruby setl sw=2 sts=2

  call keymap#mapMacAlt()
  
  "insert模式下的快捷键
  inoremap <C-k> <Esc>d$a
  inoremap fd <Esc>
  
  "visual mode
  vnoremap <leader>y "+y
  vnoremap fd <Esc>

  "conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
  nnoremap <C-t> :NERDTreeToggle<CR>
  "移动光标的快捷键
  nnoremap <C-k> d$
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  
  " laeder相关的配置
  nnoremap <leader><SPACE> :Commands<CR>
  nnoremap <leader>x :close<CR>
  
  " File 相关的配置
  nnoremap <leader>fs :w<CR>
  nnoremap <leader>fo :e<SPACE>
  
  "copy line to system clipboard
  nnoremap <leader>y "+yy
  nnoremap <leader>ev :tabe $MYVIMRC<CR>
  nnoremap <leader>sv :source $MYVIMRC<CR>:echo "(>^.^<)"<CR>
  
  "Buffer 相关的快捷键
  nnoremap <silent> <leader>bl :Buffers<CR>
  nnoremap <silent> <leader>bp :bp<CR>
  nnoremap <silent> <leader>bn :bn<CR>
  nnoremap <silent> <leader>bd :bd<CR>l
  nnoremap <silent> <leader>bk :bd!<CR> " kill buffer
  nnoremap <silent> <C-h> :bp<CR>
  nnoremap <silent> <C-l> :bn<CR>
  
  " Windows 相关的快捷键
  nnoremap <silent> <leader>wc :close<CR>
  nnoremap <silent> <leader>ws :split<CR>
  nnoremap <silent> <leader>wt :NERDTreeFocus<CR>
  nnoremap <silent> <leader>w[ :NERDTreeToggle<CR>
  nnoremap <silent> <leader>w] :TagbarToggle<CR>
  nnoremap <silent> <leader>wv :vs<CR>
  nnoremap <silent> <leader>ww <C-w><C-w>
  nnoremap <silent> <leader>wo <C-w>o
  nnoremap <silent> <leader>wl <C-w>l
  nnoremap <silent> <leader>wh <C-w>h
  nnoremap <silent> <leader>wj <C-w>j
  nnoremap <silent> <leader>wk <C-w>k
  nnoremap <silent> <leader>wg :Goyo<CR>
  nnoremap <silent> <leader>w= <C-w>=
  nnoremap <silent> <leader>w+ 10<C-w>+
  nnoremap <silent> <leader>w- 10<C-w>-
  nnoremap <silent> <leader>w> 10<C-w>>
  nnoremap <silent> <leader>w< 10<C-w><
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
  
  " Terminal
  nnoremap <leader>tt :terminal<CR>
  if has('nvim')
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
  nnoremap <leader>tn :tabnew<CR>
  nnoremap <leader>ts :tabs<CR>
  nnoremap <leader>tl :tabnext<CR>
  nnoremap <leader>th :tabprevious<CR>
  nnoremap <leader>to :tabonly<CR>
  nnoremap <leader>tc :tabclose<CR>
  nnoremap <leader>te :call EditCurrentBufferInNewTab()<CR>
  
  " Git 相关的快捷键
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>
  nnoremap <leader>gl :Git lg<CR>
  nnoremap <leader>gd :Git df<CR>

  " 折叠的快捷键, z 实在太难摁了
  nnoremap <leader>h za

  nnoremap <leader>r :%s///gc<Left><Left><Left><Left>
  nnoremap <leader>m1 @1
  nnoremap <leader>m2 @2
  nnoremap <leader>m3 @3
  nnoremap <leader>m4 @4
  nnoremap <leader>m5 @5
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
