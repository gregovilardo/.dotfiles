local set = vim.keymap.set
-- set leader key to space
vim.g.mapleader = " "

set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })
-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.hlsearch:get() then
		vim.cmd.nohl()
		return ""
	else
		return "<CR>"
	end
end, { expr = true })

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostinc" })
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto prev diagnostinc" })

-- use jk to exit insert mode
set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
set("n", "x", '"_x')

-- delete  without copying into register
set("n", "d", '"_d')

-- yank and delete
set("n", "yd", "d", { desc = "Yank and delete" })

-- increment/decrement numbers
set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<C-b>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" }) -- open new tab
set("n", "<C-n>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" }) -- open new tab

set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory (oil.nvim)" })
