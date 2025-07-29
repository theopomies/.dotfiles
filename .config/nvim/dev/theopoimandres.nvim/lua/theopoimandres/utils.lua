local M = {}

--- Apply highlight group
function M.highlight(group, hl)
    local palette = require('theopoimandres.palette')

    -- Helper function to resolve palette references
    local function resolve_color(color_ref)
        return palette[color_ref] or color_ref
    end

    -- Create a copy of hl to avoid modifying the original
    local highlight_args = vim.deepcopy(hl)

    -- Resolve palette references in color fields
    if highlight_args.fg then
        highlight_args.fg = resolve_color(highlight_args.fg)
    end
    if highlight_args.bg then
        highlight_args.bg = resolve_color(highlight_args.bg)
    end
    if highlight_args.sp then
        highlight_args.sp = resolve_color(highlight_args.sp)
    end

    if highlight_args.style then
        if type(highlight_args.style) == 'table' then
            highlight_args = vim.tbl_extend('force', highlight_args, highlight_args.style)
        elseif highlight_args.style:lower() ~= 'none' then
            for s in string.gmatch(highlight_args.style, '([^,]+)') do
                highlight_args[s] = true
            end
        end
        highlight_args.style = nil
    end
    vim.api.nvim_set_hl(0, group, highlight_args)
end

--- Blend two colors
function M.blend(color1, color2, alpha)
    local palette = require('theopoimandres.palette')

    -- Resolve palette references to hex colors
    local hex1 = palette[color1] or color1
    local hex2 = palette[color2] or color2

    local c1 = M.hex_to_rgb(hex1)
    local c2 = M.hex_to_rgb(hex2)

    local r = math.floor(c1.r * (1 - alpha) + c2.r * alpha)
    local g = math.floor(c1.g * (1 - alpha) + c2.g * alpha)
    local b = math.floor(c1.b * (1 - alpha) + c2.b * alpha)

    return string.format('#%02X%02X%02X', r, g, b)
end

--- Convert hex color to RGB
function M.hex_to_rgb(hex)
    if not hex or hex == 'NONE' then
        return { r = 0, g = 0, b = 0 }
    end

    hex = hex:gsub('#', '')
    if #hex ~= 6 then
        error('Invalid hex color: ' .. hex)
    end

    return {
        r = tonumber(hex:sub(1, 2), 16) or 0,
        g = tonumber(hex:sub(3, 4), 16) or 0,
        b = tonumber(hex:sub(5, 6), 16) or 0,
    }
end

return M
