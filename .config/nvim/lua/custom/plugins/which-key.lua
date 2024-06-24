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
			wk.register({
				s = {
					name = "splits and terminal",
				},
				f = {
					name = "fzf",
				},
				g = {
					name = "git & fzf",
				},
				c = {
					name = "lsp (rename, code action)",
				},
			}, { prefix = "<leader>" })
		end,
		opts = {},
	},
}
