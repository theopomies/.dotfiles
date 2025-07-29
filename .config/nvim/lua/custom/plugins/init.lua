-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        disable_background = true, -- disable background
      }
    end,
    -- optionally set the colorscheme within lazy config
    init = function()
      -- vim.cmd.colorscheme 'poimandres'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- theme = 'dracula-nvim',
      theme = 'poimandres',
      -- theme = 'theopoimandres',
    },
  },

  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },

  -- TypeScript
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  {
    'windwp/nvim-ts-autotag',
    setup = function()
      require('nvim-ts-autotag').setup {
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      }
    end,
  },

  {
    'dmmulroy/tsc.nvim',
    dependencies = {
      'rcarriga/nvim-notify',
    },
    opts = {},
    -- lazy.nvim
  },

  require 'custom.plugins.xcodebuild',

  {
    'supermaven-inc/supermaven-nvim',
    opts = {
      keymaps = {
        accept_suggestion = '<Tab>',
        clear_suggestion = '<C-]>',
        accept_word = '<C-j>',
      },
      disable_inline_completion = true,
    },
  },
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'Avante' },
      code = {
        disable_background = true,
        style = 'language',
        -- Optional: Set highlight groups to NONE to enforce no background
        highlight = 'NONE', -- For code blocks
        highlight_language = 'NONE',
        highlight_inline = 'NONE', -- For inline code
      },
    },
    ft = { 'markdown', 'Avante' },
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- TheopoimanDres - Custom theme
  {
    'theopomies/theopoimandres.nvim',
    dev = true, -- This will look for the plugin locally in dev/
    lazy = false,
    priority = 1000,
    config = function()
      require('theopoimandres').setup {
        disable_background = true, -- disable background like the original poimandres config
        disable_italics = false, -- We want italics!
      }
    end,
    init = function()
      vim.cmd.colorscheme 'theopoimandres'
    end,
  },
}
