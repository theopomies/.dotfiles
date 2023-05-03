vim.cmd [[
try
colorscheme dracula
highlight Normal guibg=none
catch /^Vim\%((\a\+)\)\=:E185/
colorscheme default
set background=dark
endtry
]]
