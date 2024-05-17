return {
  {
    "echasnovski/mini.nvim",
    config = function()
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [s]urround [a]dd [i]nner [w]ord [)]paren
      -- - sd'   - [s]urround [d]elete [']quotes
      -- - sr)'  - [s]urround [r]eplace [)] [']
      require("mini.surround").setup()

      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
}
