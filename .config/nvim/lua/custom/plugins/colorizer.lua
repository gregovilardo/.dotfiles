return {
	"catgoose/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			{ filetypes = { "css", "html" } },
		})
		vim.keymap.set("n", "ct", ":ColorizerToggle<CR>", { desc = "colorizer toggle" })
	end,
}
