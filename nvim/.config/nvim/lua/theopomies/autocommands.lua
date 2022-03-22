vim.cmd [[
augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo,TelescopePrompt nnoremap <silent> <buffer> q :close!<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
augroup end
augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
augroup end
augroup _file_specific
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup end
augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
augroup end
augroup _trim_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup end
]]
