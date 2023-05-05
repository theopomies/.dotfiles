local plugins = {
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("core.utils").lazy_load "nvim-lspconfig"
    end,
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      -- "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --   },
  --   config = function()
  --     require("mason-lspconfig").setup()
  --     require("mason-lspconfig").setup_handlers {
  --       -- The first entry (without a key) will be the default handler
  --       -- and will be called for each installed server that doesn't have
  --       -- a dedicated handler.
  --       function(server_name) -- default handler (optional)
  --         require("lspconfig")[server_name].setup {}
  --       end,
  --     }
  --   end,
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    dependencies = "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "github/copilot.vim",
    cmd = { "Copilot" },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context"
  -- }
}

return plugins
