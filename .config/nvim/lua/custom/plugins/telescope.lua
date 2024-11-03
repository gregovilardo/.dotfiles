return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	tag = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-smart-history.nvim" },
		-- { "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			mappings = {
				i = {
					["<C-n>"] = actions.move_selection_next,
					["<C-b>"] = actions.move_selection_previous,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				wrap_results = true,
				-- history = {
				--   path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
				--   limit = 100,
				-- },
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension("git_worktree"))
		-- pcall(require("telescope").load_extension, "smart_history")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<space>ff", builtin.find_files, { desc = "Find files in cwd" })
		vim.keymap.set("n", "<space>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<space>fs", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set("n", "<space>fr", builtin.oldfiles, { desc = "Find recent files" })
		vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find, { desc = "Current buffer fzf" })
		vim.keymap.set("n", "<space>gw", builtin.grep_string, { desc = "Find string under cursor " })
		vim.keymap.set("n", "<space>gs", builtin.git_status, { desc = "Git status" })

		-- vim.keymap.set("n", "<space>fa", function()
		-- 	---@diagnostic disable-next-line: param-type-mismatch
		-- 	builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
		-- end)

		vim.keymap.set("n", "<space>en", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find file on nvim config" })
	end,
}
