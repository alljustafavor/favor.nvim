return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    --"3rd/image.nvim",
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
  },
  cmd = "Neotree",
  keys = {
    { "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
