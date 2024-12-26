local set = vim.keymap.set
-- set leader key to space
vim.g.mapleader = " "

set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

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

-- For window resize
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<C-b>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" }) -- open new tab
set("n", "<C-n>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" }) -- open new tab

set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory (oil.nvim)" })

set("n", "<C-x>", ":bd<CR>", { desc = "Close current buffer" })

set("n", "<M-j>", ":m+1<CR>", { desc = "Swap lines down" })
set("n", "<M-k>", ":m-2<CR>", { desc = "Swap lines up" })

set("n", "cd", ":Telescope git_worktree git_worktrees<CR>", { desc = "List an cd to git worktrees" })

-- set("n", "<C-Tab>", "i<CR><Esc>:m-2j$a <Esc>", { desc = "Insert <CR>" })
set("n", "<C-p>", "i<CR><Esc>k$a <Esc>", { desc = "Insert <CR>" })

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- code actions on visual mode
set({ "v", "n" }, "<M-CR>", vim.lsp.buf.code_action)

-- obsidian.nvim
set(
	"n",
	"<leader>on",
	":ObsidianTemplate New-note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>",
	{ desc = "Obsidian note from template" }
)
set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", { desc = "remove date from obsidian template" })
