local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   all_modes = "",
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Regular: use jklm instead of hjkl
keymap("", "j", "<Left>", term_opts)
keymap("", "k", "<Down>", term_opts)
keymap("", "l", "<Up>", term_opts)
keymap("", "m", "<Right>", term_opts)

-- Windows
keymap("n", "<leader>j", "<C-w>h", opts)
keymap("n", "<leader>k", "<C-w>j", opts)
keymap("n", "<leader>l", "<C-w>k", opts)
keymap("n", "<leader>m", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<C-m>", ":bnext<CR>", opts)
keymap("n", "<C-j>", ":bprevious<CR>", opts)

-- Navigate blocks
keymap("n", "(", "{", opts)
keymap("n", ")", "}", opts)
keymap("n", "{", "(", opts)
keymap("n", "}", ")", opts)

-- Resize with arrows
keymap("n", "<leader><Up>", ":resize -2<CR>", opts)
keymap("n", "<leader><Down>", ":resize +2<CR>", opts)
keymap("n", "<leader><Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<leader><Right>", ":vertical resize +2<CR>", opts)

-- Move Text
keymap("i", "<C-k>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<C-l>", "<ESC>:m .-2<CR>==gi", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "K", ":m '>+1<CR>gv=gv", opts)
keymap("v", "L", ":m '<-2<CR>gv=gv", opts)
keymap("n", "K", ":m .+1<CR>==", opts)
keymap("n", "L", ":m .-2<CR>==", opts)

-- Escape insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Expect behavior like D C
keymap("n", "Y", "y$", opts)

-- Keep it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Undo breakpoints
keymap("i", ".", ".<c-g>u", opts)
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ";", ";<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)

-- Marks
keymap("n", "h", "m", opts)
keymap("n", "H", "`", opts)
keymap("n", "<leader>h", "'", opts)

-- QuickFix List
-- TODO When needed

-- Shift multiple lines
keymap("n", "<TAB>", ":><CR>", opts)
keymap("n", "<S-TAB>", ":<<CR>", opts)
keymap("v", "<TAB>", ":'<,'>><CR>gv", opts)
keymap("v", "<S-TAB>", ":'<,'><<CR>gv", opts)
