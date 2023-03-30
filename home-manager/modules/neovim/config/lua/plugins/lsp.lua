return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason.nvim", "williamboman/mason-lspconfig.nvim" },
    },
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        underline = true,
        severity_sort = true,
      },
      autoformat = true,
      format = {
        formatting_options = nil,
        timout_ms = nil,
      },
      ---@type lspconfig.options
      servers = {
        pyright = {},
        lua_ls = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "flake8",
        "luacheck",
        "eslint_d",
        "prettier",
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim
  { import = "lazyvim.plugins.extras.lang.typescript" },

  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" } },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
        },
      }
    end,
  },
}