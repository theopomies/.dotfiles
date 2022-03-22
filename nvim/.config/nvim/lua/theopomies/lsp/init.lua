local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("theopomies.lsp.handlers").setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "gf", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "gl", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
keymap(
"n",
"gl",
'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
opts
)
keymap("n", "gk", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>Q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

vim.cmd([[
command! Format execute 'lua vim.lsp.buf.formatting()'
augroup _lsp
    autocmd!
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
augroup end
]])


