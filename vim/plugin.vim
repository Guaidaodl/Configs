source ~/.vim/config/utils.vim

function! plugin#main()
  call plug#begin('~/.vim/plug')
  
  " enhanced
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'tpope/vim-surround'
  Plug 'easymotion/vim-easymotion'
  Plug 'akinsho/toggleterm.nvim'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    " 支持 neovim 内置的 lsp
    Plug 'deoplete-plugins/deoplete-lsp'
  endif

  
  Plug 'itchyny/lightline.vim'
  Plug 'vim-scripts/vim-auto-save'
 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

  Plug 'liuchengxu/vim-which-key'
  " Git 
  " 配置: config_git_plugins
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  " 预览
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 
  "Code snippet
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  
  " Themes
  Plug 'sickill/vim-monokai'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'dracula/vim'
  Plug 'vim-scripts/Solarized'
  
  """"""""""""""""""""""""""""" IDE 相关的插件
  " lsp 相关
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/trouble.nvim'

  Plug 'jiangmiao/auto-pairs'

  " 彩虹括号
  Plug 'luochen1990/rainbow'
  " 调试
  let g:vimspector_enable_mappings = 'HUMAN'
  Plug 'puremourning/vimspector'

  " 异步运行命令
  Plug 'skywind3000/asyncrun.vim'
  Plug 'skywind3000/asynctasks.vim'

  """ 语法高亮
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'udalov/kotlin-vim'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'wlangstroth/vim-racket'
  Plug 'pboettch/vim-cmake-syntax'

  call plug#end()
  
  """""""""""""""""""""""""""插件相关设置
  call plugin#config_toggleterm()
  call plugin#config_lightline()
  call plugin#config_which_key()
  call plugin#config_asyncrun()
  call plugin#config_ultisnips()
  call plugin#config_rainbow()
  if has('nvim')
    call plugin#config_nvim_tree()
    call plugin#config_deoplete()
    call plugin#config_telescope()
    call plugin#config_lsp()
  endif
  call plugin#config_git_plugins()
  call plugin#config_treesitter()
  """vim-auto-save
  let g:auto_save = 1 "enable the vim-auto-save
  let g:auto_save_in_insert_mode = 0 "do not save while in insert mode
  let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
  let g:auto_save_slient = 1 "do not display the auto-save notification

  """ airline 
  let g:airline_theme='bubblegum'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_section_b = "%{airline#util#wrap(airline#extensions#branch#get_head(),0)}" 
endfunction

function! plugin#config_nvim_tree()
lua << EOF
require'nvim-tree'.setup {
}
EOF
endfunction
function! plugin#config_lightline()
  let g:lightline = {}
  let g:lightline.active = {
      \ 'left': [ [ 'winnr', 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
  let g:lightline.inactive = {
      \ 'left': [ [ 'winnr', 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }
  let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }
endfunction

""" 配置 toggleterm.nvim
function! plugin#config_toggleterm()
lua << EOF
require("toggleterm").setup{}
EOF
endfunction

""" 配置 deoplete
function! plugin#config_deoplete()
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#option({
  \ 'smart_case': v:true,
  \})
endfunction

function! plugin#config_telescope()
  autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
lua << EOF
  require('telescope').setup {
    pickers = {
      find_files = {
        previewer = false,
        theme="dropdown",
      },
      buffers= {
        previewer = false,
        heme="dropdown",
      }
    },
  }
EOF
endfunction

""" 配置 whichkey
function! plugin#config_which_key()
  let g:mapleader = "\<Space>"
  let g:which_key_use_floating_win = 1
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
endfunction

"""" 配置 Asyncrun
function! plugin#config_asyncrun()
  " 自动打开 quickfix window ，高度为 6
  let g:asyncrun_open = 10

  " 设置 F10 打开/关闭 Quickfix 窗口
  nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
endfunction

""" 配置 Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
function! plugin#config_ultisnips()
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endfunction


""" 配置 rainbow
function! plugin#config_rainbow()
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
endfunction

function! plugin#config_lsp() 
lua << EOF
  local lspconfig = require('lspconfig')
  local on_attach = function(client, bufnr)
  end
  lspconfig.rls.setup{}
  lspconfig.clangd.setup{}
  lspconfig.pyright.setup{
    on_attach = on_attach
  }
EOF
endfunction

function! plugin#config_git_plugins()
  let g:gitgutter_enable = 1

  " Git 相关的快捷键
  let g:which_key_map.g = {'name': '+git'}
  call utils#nnore_leader_key_map('gb', ":Git blame<CR>", "blame")
  call utils#nnore_leader_key_map('gc', ":Git commit<CR>", "commit")
  call utils#nnore_leader_key_map('gd', ":Git diff<CR>", "diff")
  call utils#nnore_leader_key_map('gs', ":tab Git<CR>", "status")
endfunction

function! plugin#config_treesitter()
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    disable = {},

    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- 扩展模式, 支持 html 等
  }
}
EOF
endfunction

