" show line number
set number

" This will set the width of a tab character to 4 spaces and will also convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Set leader to space
let mapleader = "\<Space>"

call plug#begin()
" Autopair and rainbow brackets
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'

" NERDTree
Plug 'scrooloose/nerdtree'

" dart support
Plug 'dart-lang/dart-vim-plugin'

" flutter support
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select
Plug 'akinsho/flutter-tools.nvim'

" Text editing support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tokyonight theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

let g:coc_global_extensions = ['coc-flutter']

" Select autocomplete with Enter key
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-g>u pumvisible() ? "\<C-y>" : "\<C-g>u"

" select tokyonight theme 
colorscheme tokyonight

" Enable rainbow brackets
let g:rainbow_active = 1

" Open NERDTree with leader + n
nmap <Leader>n :NERDTreeToggle<CR>

" flutter shortcodes
nnoremap <leader>fr :CocCommand flutter.run<CR>
nnoremap <leader>fd :CocCommand flutter.devices<CR>

lua << EOF
require("flutter-tools").setup{
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to :h flutter-tools for help
  dev_log = {
    enabled = true,
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
}
EOF

 " Show hover
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
 " Jump to definition
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
 " Open code actions using the default lsp UI, if you want to change this please see the plugins above
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
 " Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>

" This will map Ctrl+c to copy the selected text to the system clipboard and Ctrl+v to paste from the system clipboard while in insert mode.
inoremap <C-c> <Esc>"+y
inoremap <C-v> <Esc>"+p

" This will let me delete a full word in insert mode using shift+backspace 
inoremap <S-BS> <C-o>db

" select a word or multiple words with shift+Ctrl+arrows 
inoremap <C-S-Right> <Esc>viw
inoremap <C-S-Left> <Esc>vib
