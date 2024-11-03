return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>c", group = "lsp (rename, code action)" },
				{ "<leader>f", group = "fzf" },
				{ "<leader>g", group = "git & fzf" },
				{ "<leader>s", group = "splits and terminal" },
				{ "<leader>h", group = "gitsigns hunks" },
				{ "<leader>t", group = "toggle (gitsigns)" },
			})
		end,
		opts = {},
	},
}
