function! ConfigKeymap()
  
  let g:mapleader = ' '
  """跟文件类型有关的快捷键
  autocmd FileType html noremap <F5> :!open %<CR><CR>
  autocmd FileType vim  noremap <F5> :source %<CR>
  autocmd FileType ruby setl sw=2 sts=2
  
  "insert模式下的快捷键
  inoremap <C-k> <Esc>d$a
  inoremap jk <Esc>
  
  "visual mode
  vnoremap jk <esc>
  vnoremap <leader>y "+y
  "conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
  nnoremap <F10> :set transparency=0<CR>
  nnoremap <F11> :set transparency=30<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>
  "移动光标的快捷键
  nnoremap <C-k> d$
  
  " JumpList
  nnoremap <leader>je :YcmCompleter GoToDeclaration<CR>
  nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
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
  nnoremap <leader>bl :CtrlPBuffer<CR>
  nnoremap <leader>bp :bp<CR>
  nnoremap <leader>bn :bn<CR>
  
  "CtrlP 的快捷键
  nnoremap <leader>pat :CtrlPBufTagAll<CR>
  nnoremap <leader>pb  :CtrlPBuffer<CR>
  nnoremap <leader>pf  :CtrlP<CR>
  nnoremap <leader>pt  :CtrlPBufTag<CR>
  nnoremap <leader>pr  :CtrlPMRUFiles<CR>
  
  " Windows 相关的快捷键
  nnoremap <leader>wc :close<CR>
  nnoremap <leader>ws :split<CR>
  nnoremap <leader>wt :NERDTreeToggle<CR>
  nnoremap <leader>wv :vs<CR>
  nnoremap <leader>ww <C-w><C-w>
  nnoremap <leader>wo <C-w>o
  nnoremap <leader>wl <C-w>l
  nnoremap <leader>wh <C-w>h
  nnoremap <leader>wj <C-w>j
  nnoremap <leader>wk <C-w>k
  nnoremap <leader>w= <C-w>=
  nnoremap <leader>w+ 10<C-w>+
  nnoremap <leader>w- 10<C-w>-
  nnoremap <leader>w> 10<C-w>>
  nnoremap <leader>w< 10<C-w><
  
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
  if has('nvim')
    if has('macunix')
      tnoremap ˙ <C-\><C-N><C-w>h
      tnoremap ∆ <C-\><C-N><C-w>j
      tnoremap ˚ <C-\><C-N><C-w>k
      tnoremap ¬ <C-\><C-N><C-w>l
    else
      tnoremap <A-h> <C-\><C-N><C-w>h
      tnoremap <A-j> <C-\><C-N><C-w>j
      tnoremap <A-k> <C-\><C-N><C-w>k
      tnoremap <A-l> <C-\><C-N><C-w>l
    endif
  endif 
  
  " Cscpoe 相关的快捷键
  nnoremap <leader>cg :cs find g<SPACE>
  nnoremap <leader>cc :cs find c<SPACE>
  
  " Terminal And tab
  nnoremap <leader>tt :terminal<CR>
  nnoremap <leader>tn :tabnew<CR>
  nnoremap <leader>ts :tabs<CR>
  nnoremap <leader>tl :tabnext<CR>
  nnoremap <leader>th :tabprevious<CR>
  nnoremap <leader>to :tabonly<CR>
  nnoremap <leader>tc :tabclose<CR>
  nnoremap <leader>te :call EditCurrentBufferInNewTab()<CR>
  nnoremap <C-h> gT
  nnoremap <C-l> gt
  
  " Git 相关的快捷键
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>
  nnoremap <leader>gl :Git lg<CR>
  nnoremap <leader>gd :Git df<CR>
endfunction

function! EditCurrentBufferInNewTab()
  let cur = bufnr("%")
  execute "tabe" 
  execute "buffer" . cur
endfunction
