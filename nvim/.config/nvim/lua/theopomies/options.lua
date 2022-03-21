local options = {
    fileencoding = "utf-8",
    backup = false,
    undofile = true,
    writebackup = false,
    swapfile = false,
    mouse = "a",
    conceallevel = 0,

    splitbelow = true,
    splitright = true,

    termguicolors = true,

    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,

    cursorline = false,

    number = true,
    signcolumn = "yes",
    relativenumber = true,
    numberwidth = 4,

    scrolloff = 8,
    sidescrolloff = 8,

    smartcase = true,
    smartindent = true,
    ignorecase = true,
    hlsearch = false,
    incsearch = true,

    errorbells = false,
    termguicolors = true,
    showmode = false,
    showtabline = 2,
    ls = 0,
    cmdheight = 2,

    colorcolumn = "80",
    wrap = false,

    timeoutlen = 100,
    updatetime = 50,
}


for k,v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd([[
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set shortmess+=c
set isfname+=@-@
set whichwrap+=<,>,[,],h,l
set iskeyword+=-
set formatoptions-=cro
]])
