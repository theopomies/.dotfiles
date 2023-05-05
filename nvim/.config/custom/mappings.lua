local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- resize window
    ["+"] = { ":res +5<CR>", "increase current windows height" },
    ["-"] = { ":res -5<CR>", "decrease current windows height" },
    ["<leader>>"] = { ":vert res +5<CR>", "increase current windows width" },
    ["<leader><"] = { ":vert res -5<CR>", "decrease current windows width" },
  },
}

M.nvterm = {
  n = {
    -- toggle in normal mode
    ["<leader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new
    ["<leader>H"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader>V"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "toggle vertical term",
    },
  },
}

M.nvimtree = {
  n = {
    -- cd ..
    ["<C-d>"] = {
      function()
        require("nvim-tree.api").tree.change_root_to_node()
      end,
      "change working directory to hovered file",
    },
  },
}

M.copilot = {
  n = {
    ["<leader>ce"] = { "<cmd> Copilot enable<CR>", "enable Github Copilot" },
    ["<leader>cd"] = { "<cmd> Copilot disable<CR>", "disable Github Copilot" },
  },
}

M.lspconfig_custom = {
  plugin = true,
  n = {
    ["<leader>fd"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },
  },
}

return M
