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
  inoremap jk <Esc>
  
  "visual mode
  vnoremap <leader>y "+y
  "conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
  nnoremap <F10> :set transparency=0<CR>
  nnoremap <F11> :set transparency=30<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  "移动光标的快捷键
  nnoremap <C-k> d$
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  
  " TagBar
  nnoremap <F8> :TagbarToggle<CR>
  
  " laeder相关的配置
  nnoremap <leader><SPACE> :
  nnoremap <leader>x :close<CR>
  
  " File 相关的配置
  nnoremap <leader>fs :w<CR>
  nnoremap <leader>fo :e<SPACE>
  
  "copy line to system clipboard
  nnoremap <leader>y "+yy
  nnoremap <leader>ev :tabe $MYVIMRC<CR>
  nnoremap <leader>sv :source $MYVIMRC<CR>:echo "(>^.^<)"<CR>
  
  "Buffer 相关的快捷键
  nnoremap <leader>b1 :buffer 1<CR>
  nnoremap <leader>b2 :buffer 2<CR>
  nnoremap <leader>b3 :buffer 3<CR>
  nnoremap <leader>b4 :buffer 4<CR>
  nnoremap <leader>b5 :buffer 5<CR>
  nnoremap <leader>b6 :buffer 6<CR>
  nnoremap <leader>b7 :buffer 7<CR>
  nnoremap <leader>b8 :buffer 8<CR>
  nnoremap <leader>b9 :buffer 9<CR>
  nnoremap <leader>bl :LeaderfBuffer<CR>
  nnoremap <leader>bp :bp<CR>
  nnoremap <leader>bn :bn<CR>
  nnoremap <leader>bd :bd<CR>
  nnoremap <leader>bk :bd!<CR> " kill buffer
  nnoremap <C-h> :bp<CR>
  nnoremap <C-l> :bn<CR>
  
  "LeaderF 的快捷键
  nnoremap <leader>ft  :LeaderfBufTag<CR>
  nnoremap <leader>fb  :LeaderfBuffer<CR>
  nnoremap <leader>ff  :LeaderfFile<CR>
  nnoremap <leader>fa  :LeaderfTag<CR>
  nnoremap <leader>fr  :LeaderfMru<CR>
  
  " Windows 相关的快捷键
  nnoremap <leader>wc :close<CR>
  nnoremap <leader>ws :split<CR>
  nnoremap <leader>wt :NERDTreeFocus<CR>
  nnoremap <leader>w[ :NERDTreeToggle<CR>
  nnoremap <leader>w] :TagbarToggle<CR>
  nnoremap <leader>wv :vs<CR>
  nnoremap <leader>ww <C-w><C-w>
  nnoremap <leader>wo <C-w>o
  nnoremap <leader>wl <C-w>l
  nnoremap <leader>wh <C-w>h
  nnoremap <leader>wj <C-w>j
  nnoremap <leader>wk <C-w>k
  nnoremap <leader>wg :Goyo<CR>
  nnoremap <leader>w= <C-w>=
  nnoremap <leader>w+ 10<C-w>+
  nnoremap <leader>w- 10<C-w>-
  nnoremap <leader>w> 10<C-w>>
  nnoremap <leader>w< 10<C-w><
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
  
  " GTags 相关的快捷键
  nnoremap <leader>cg :cs find g<SPACE>
  nnoremap <leader>cc :cs find c<SPACE>
  nnoremap <C-j> :GtagsCursor<CR>

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
endfunction

function! EditCurrentBufferInNewTab()
  let cur = bufnr("%")
  execute "tabe" 
  execute "buffer" . cur
endfunction
