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
			subdir = "Templates",
			default = "limbo-note.md",
			substitutions = {
				title = function()
					local path = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd() .. "/", "")
					local filename = path:match("([^/]+)%.md$") or path:match("([^/]+)$")
					local title_with_hyphens = filename:match("^%d%d%d%d%-%d%d%-%d%d%_(.+)$") or filename
					local final_title = title_with_hyphens:gsub("-", " ")
					return final_title
				end,
				id = function()
					Length = 10
					local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
					local id = ""
					for i = 1, Length do
						local rand = math.random(1, #chars)
						id = id .. string.sub(chars, rand, rand)
					end
					return id .. "L"
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
				path = "~/Documents/Notes",
			},
		},
		notes_subdir = "Limbo",
		new_notes_location = "notes_subdir",
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vaul
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
				desc = { "Go to file (obsidian.nvim)" },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
	},
}
