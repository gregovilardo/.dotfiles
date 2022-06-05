" PlugInstall
call plug#begin('~/.config/nvim/plugged')

" color schemes
Plug 'https://github.com/Shatur/neovim-ayu'
Plug 'shaunsingh/nord.nvim'
Plug 'https://github.com/savq/melange'
Plug 'ellisonleao/gruvbox.nvim'

"  create colorscheme
Plug 'rktjmp/lush.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" TSIntsall, TSUpdate, etc...

" for telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-tree.lua'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" LSP Mananger
Plug 'VonHeikemen/lsp-zero.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'


call plug#end()

let mapleader = " "
noremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>   

set termguicolors 
colorscheme gruvbox 

lua require "user.options"
lua require "user.lsp"
lua require "user.nvim-tree"
lua require "user.keymaps"
" lua require "user.colorscheme"
lua require "user.lualine"
