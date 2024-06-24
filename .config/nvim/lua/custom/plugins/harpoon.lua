return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file with harpoon" })
    keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toogle harpoon menu" })
    keymap.set("n", "<M-q>", function()
      ui.nav_file(1)
    end)
    keymap.set("n", "<M-w>", function()
      ui.nav_file(2)
    end)
    keymap.set("n", "<M-e>", function()
      ui.nav_file(3)
    end)
    keymap.set("n", "<M-r>", function()
      ui.nav_file(4)
    end)
    -- keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    -- keymap.set(
    --   "n",
    --   "<leader>hp",
    --   "<cmd>lua requirw('harpoon.ui').nav_prev()<cr>",
    --   { desc = "Go to previous harpoon mark" }
    -- )
  end,
}
