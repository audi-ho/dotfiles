return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
    },
  },

  {
    "m4xshen/catppuccinight.nvim",
    lazy = false,
    name = "catppuccinight",
    opts = {
      flavour = "mocha",
      custom_highlights = function(colours)
        return {
          VertSplit = { fg = colours.surface0 },
        }
      end,
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "plenary.nvim", "ojroques/vim-oscyank" },
    opts = {
      action_callback = function(url)
        vim.api.nvim_command("let @\" = '" .. url .. "'")
        vim.fn.OSCYank(url)
      end,
    },
  },
  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_ignored_filetypes = { "octo" }
    end,
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "beautysh",
        "isort",
        "luacheck",
        "ruff",
        "shfmt",
        "stylua",
      },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  { "gpanders/editorconfig.nvim", event = { "BufReadPre", "BufNewFile" } },

  {
    "luukvbaal/nnn.nvim",
    config = {
      picker = {
        cmd = "tmux new-session nnn -APp",
        style = { border = "rounded" },
        session = "shared",
      },
      replace_netrw = "picker",
    },
    keys = { { "-", "<cmd>NnnPicker %:p<cr>", desc = "Open nnn" } },
  },
}
