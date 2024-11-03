return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			{ filetypes = { "css", "html" }, user_default_options = { names = true } },
		})
		vim.keymap.set("n", "ct", ":ColorizerToggle<CR>", { desc = "colorizer toggle" })
	end,
}
