" PlugInstall
call plug#begin('~/.config/nvim/plugged')

" color schemes
Plug 'https://github.com/Shatur/neovim-ayu'
Plug 'sainnhe/sonokai'
Plug 'shaunsingh/nord.nvim'
" gruvbox is nice to

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" TSIntsall, TSUpdate, etc...

Plug 'https://github.com/neovim/nvim-lspconfig'

" for telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

let mapleader = " "
noremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>   

set termguicolors 
" colorscheme nord

lua require "user.options"
lua require "user.lsp"
lua require "user.nvim-tree"
lua require "user.keymaps"
lua require "user.colorscheme"
lua require "user.lualine"
