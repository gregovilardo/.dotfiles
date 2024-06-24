return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("colorizer").setup({
			{ filetypes = { "css", "html" }, user_default_options = { names = true } },
		})
	end,
}
