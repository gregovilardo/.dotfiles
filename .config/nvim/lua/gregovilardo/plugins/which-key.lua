return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    local wk = require("which-key")
    -- As an example, we will create the following mappings:
    --  * <leader>ff find files
    --  * <leader>fr show recent files
    --  * <leader>fb Foobar
    -- we'll document:
    --  * <leader>fn new file
    --  * <leader>fe edit file
    -- and hide <leader>1

    wk.register({
      f = {
        name = "file", -- optional group name
      },
      { prefix = "<leader>" },
    })
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
