local config = {
	cmd = { os.getenv("XDG_DATA_HOME") .. "/nvim/mason/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "pom.xml", "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Goto definition" })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "Goto references" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Goto declaration" })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "Goto type definition" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "" })

				vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { desc = "Rename", buffer = 0 })
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = 0 })
			end,
		})
	end,
}
require("jdtls").start_or_attach(config)
