return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"mfussenegger/nvim-lint",

			{ "j-hui/fidget.nvim", opts = {} },

			-- Autoformatting
			"stevearc/conform.nvim",

			-- Schema information
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("neodev").setup({
				-- library = {
				--   plugins = { "nvim-dap-ui" },
				--   types = true,
				-- },
			})

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			local servers = {
				marksman = true,
				pyright = true,
				html = true,
				bashls = true,
				gopls = true,
				lua_ls = true,
				rust_analyzer = true,
				templ = true,
				cssls = true,
				hls = true,
				ts_ls = true,
				tailwindcss = true,
				zls = true,

				-- svls = {
				-- 	root_dir = function(fname)
				-- 		return "/home/gregovilardo/Documents/QuartusProyect/TP1"
				-- 		-- print("HOLA")
				-- 		-- return require("lspconfig.util").find_git_ancestor(fname)
				-- 	end,
				-- 	cmd = { "svls" },
				-- 	filetypes = { "sv", "verilog", "systemverilog" },
				-- },
				-- lemminx = {
				-- 	settings = {
				-- 		xml = {
				-- 			server = {
				-- 				workDir = "~/.cache/lemminx",
				-- 			},
				-- 		},
				-- 	},
				-- },
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},

				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				},

				clangd = {
					-- TODO: Could include cmd, but not sure those were all relevant flags.
					--    looks like something i would have added while i was floundering
					init_options = { clangdFileStatus = true },
					filetypes = { "c", "cc", "cpp" },
				},
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"stylua",
				"lua_ls",
				-- "delve",
				"tailwindcss-language-server",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			local disable_semantic_tokens = {
				lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Goto definition" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "Goto references" })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Goto declaration" })
					vim.keymap.set(
						"n",
						"gT",
						vim.lsp.buf.type_definition,
						{ buffer = 0, desc = "Goto type definition" }
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "" })

					vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { desc = "Rename", buffer = 0 })
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = 0 })

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})

			-- Autoformatting Setup
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					lua = { "stylua" },
					xml = { "xmlformat" },
					markdown = { "deno_fmt " },
					python = function(bufnr)
						if require("conform").get_formatter_info("ruff_format", bufnr).available then
							return { "ruff_format" }
						else
							return { "isort", "black" }
						end
					end,
				},
				formatters = {
					deno_fmt = {
						command = "deno",
						args = { "fmt", "-" },
						stdin = true,
					},
				},
			})
			-- Linting configuration
			local lint = require("lint")
			lint.linters_by_ft = {
				-- markdown = { "vale" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
			}

			-- local eslint_d = lint.linters.eslint_d
			-- eslint_d.args = {
			--   "",
			-- }

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			-- vim.keymap.set("n", "<leader>l", function()
			-- 	lint.
			-- end, { desc = "Toggle linting" })

			vim.api.nvim_create_user_command("LintInfo", function()
				local filetype = vim.bo.filetype
				local linters = lint.linters_by_ft[filetype]

				if linters then
					print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
				else
					print("No linters configured for filetype: " .. filetype)
				end
			end, {})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						lsp_fallback = true,
						quiet = true,
					})
				end,
			})
		end,
	},
}
