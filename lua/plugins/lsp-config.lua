return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "cssls",
          "eslint",
          "elixirls",
          "gopls",
          "html",
          "htmx",
          "jsonls",
          "tsserver",
          "markdown_oxide",
          "prismals",
          "pyright",
          "rust_analyzer",
          "tailwindcss",
          "lua_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      { "j-hui/fidget.nvim",       opts = {} },
      { "folke/neodev.nvim",       opts = {} },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.elixirls.setup({ capabilities = capabilities })
      lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.declaration, {})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("nvim-autopairs").setup({})
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
