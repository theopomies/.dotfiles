local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Have packer manage itself
    use "wbthomason/packer.nvim"

    -- Useful lua functions used ny lots of plugins
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -- Autopairs, integrates with both cmp and treesitter
    use "windwp/nvim-autopairs"

    -- Terminal
    use "akinsho/toggleterm.nvim"

    -- Colorschemes
    use { "dracula/vim", { as = "dracula" }}
    use "akinsho/bufferline.nvim"
    use "nvim-lualine/lualine.nvim"

    -- ===============LSP=================
    use "neovim/nvim-lspconfig"

    use "jose-elias-alvarez/null-ls.nvim"
    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- Treesitter
    --use {
    --    "nvim-treesitter/nvim-treesitter",
    --    run = ":TSUpdate",
    --}

    -- ------------Languages--------------
    use "williamboman/nvim-lsp-installer"
    -- Rust
    use "simrat39/rust-tools.nvim"

    -- Solidity
    use "tomlion/vim-solidity"
    use "sohkai/syntastic-local-solhint"

    -- -----------------------------------
    -- ===================================

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"

    -- Git
    use "tpope/vim-fugitive"
    --use "lewis6991/gitsigns.nvim"

    -- Tpope the god
    use "tpope/vim-surround"
    use "tpope/vim-commentary"
    use "christoomey/vim-system-copy"

    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    use "lukas-reineke/indent-blankline.nvim"

    use "lewis6991/impatient.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

