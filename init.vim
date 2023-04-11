" show line number
set number

" This will set the width of a tab character to 4 spaces and will also convert tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

"Set the encoding to UTF-8
set encoding=UTF-8

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

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" adding icons to nerdTree
Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:coc_global_extensions = ['coc-flutter']

" Select autocomplete with Enter key
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <C-g>u pumvisible() ? "\<C-y>" : "\<C-g>u"

" select tokyonight theme 
colorscheme tokyonight

" Enable rainbow brackets
let g:rainbow_active = 1

" NERDTree Config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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


" This will let me delete a full word in insert mode using shift+backspace 
inoremap <S-BS> <C-o>db

" select a word or multiple words with shift+Ctrl+arrows 
inoremap <C-S-Right> <Esc>viw
inoremap <C-S-Left> <Esc>vib


" Configure Bufferline
"lua require('bufferline').setup{
"  options = {
"  	mode = "buffers",
"  }
"}

" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{
	options = {
		mode = "buffers",
	}
}
EOF


" Key mappings for Bufferline
nnoremap <TAB> :BufferLineCycleNext<CR>
nnoremap <S-TAB> :BufferLineCyclePrev<CR>

" Key mapping to close the current buffer
nnoremap <Space>x :bd<CR>


" Key mappings for window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Open terminal vertically
nnoremap <Space>v :vsplit term://zsh<CR>

" Open terminal horizontally
nnoremap <Space>h :split term://zsh<CR>

