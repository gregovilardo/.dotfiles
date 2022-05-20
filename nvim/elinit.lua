local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- colorscheme
Plug ('catppuccin/nvim', {as= 'catppuccin'})
Plug 'https://github.com/Shatur/neovim-ayu'
--gruvbox is nice to

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug ('nvim-treesitter/nvim-treesitter', {['do']= vim.fn[':TSUpdate']})

-- for telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

vim.call('plug#end')


vim.g.mapleader = " "
noremap <leader>ps :lua require('telescope.buitin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

require('ayu').setup({mirage=true})
require('ayu').colorscheme()
require "user.options"
require "user.lualine"


















