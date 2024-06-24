return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["-"] = "actions.select_vsplit",
      ["_"] = "actions.select_split",
      ["<C-l>"] = false,
      ["<C-h>"] = false,
      ["<C-p>"] = false,
      ["<C-t>"] = "actions.select_tab",
      ["<Tab>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      -- ["<Tab>"] = "actions.parent",
      -- ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
