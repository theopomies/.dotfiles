local utils = require('theopoimandres.utils')

local M = {}

local config = {
    bold_vert_split = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false, -- Important: we want italics enabled by default
    dim_nc_background = false,

    groups = {
        background = 'background2',
        panel = 'background3',
        border = 'background3',
        comment = 'gray2',
        link = 'light_blue',
        punctuation = 'gray1',

        error = 'purple',
        hint = 'gray1',
        info = 'light_blue',
        warn = 'yellow',

        git_add = 'turquoise',
        git_change = 'light_blue',
        git_delete = 'purple',
        git_dirty = 'dark_blue',
        git_ignore = 'gray2',
        git_merge = 'light_blue',
        git_rename = 'turquoise',
        git_stage = 'light_blue',
        git_text = 'turquoise',

        headings = {
            h1 = 'turquoise',
            h2 = 'yellow',
            h3 = 'purple',
            h4 = 'pink',
            h5 = 'light_blue',
            h6 = 'dark_blue',
        },
    },
    highlight_groups = {},
}

function M.setup(opts)
    opts = opts or {}

    if opts.groups and type(opts.groups.headings) == 'string' then
        opts.groups.headings = {
            h1 = opts.groups.headings,
            h2 = opts.groups.headings,
            h3 = opts.groups.headings,
            h4 = opts.groups.headings,
            h5 = opts.groups.headings,
            h6 = opts.groups.headings,
        }
    end

    config = vim.tbl_deep_extend('force', config, opts)
end

function M.colorscheme()
    if vim.g.colors_name then
        vim.cmd('hi clear')
    end

    vim.opt.termguicolors = true
    vim.g.colors_name = 'theopoimandres'

    local theme = require('theopoimandres.theme').get(config)

    -- Set theme highlights
    for group, color in pairs(theme) do
        -- Skip highlight group if user overrides
        if config.highlight_groups[group] == nil then
            utils.highlight(group, color)
        end
    end

    -- Set user highlights
    for group, color in pairs(config.highlight_groups) do
        utils.highlight(group, color)
    end
end

return M
