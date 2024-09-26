return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "thick",
			-- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
			sort_by = "directory",
		},
	},
}
