return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = { "markdown", "" },
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		disable_frontmatter = true,
		templates = {
			folder = "Templates",
			substitutions = {
				title = function()
					local format_title = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd() .. "/", "")
					format_title = string.gsub(format_title, ".md", "")
					format_title = format_title:match("^%d+%-%d+%-%d+_(.+)$")
					format_title = string.gsub(format_title, "-", " ")
					return format_title
				end,
			},
		},

		note_id_func = function(title)
			local date_part = os.date("%Y-%m-%d")
			local formatted_title = title:gsub(" ", "-")
			return date_part .. "_" .. formatted_title
		end,

		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "personal",
				path = "~/Notas",
			},
		},
	},
	-- setup = function()
	-- 	require("obsidian").setup({
	-- 		ui = { enable = false },
	-- 	})
	-- end,
}
