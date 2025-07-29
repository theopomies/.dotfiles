local palette = require('theopoimandres.palette')

local theopoimandres = {}

theopoimandres.normal = {
    a = { fg = palette.gray5, bg = palette.turquoise, gui = 'bold' },
    b = { fg = palette.text, bg = palette.gray4 },
    c = { fg = palette.gray1, bg = palette.none },
}

theopoimandres.insert = {
    a = { fg = palette.gray5, bg = palette.dark_blue, gui = 'bold' },
    b = { fg = palette.text, bg = palette.gray4 },
}

theopoimandres.visual = {
    a = { fg = palette.gray5, bg = palette.yellow, gui = 'bold' },
    b = { fg = palette.text, bg = palette.gray4 },
}

theopoimandres.replace = {
    a = { fg = palette.gray5, bg = palette.purple, gui = 'bold' },
    b = { fg = palette.text, bg = palette.gray4 },
}

theopoimandres.command = {
    a = { fg = palette.gray5, bg = palette.yellow, gui = 'bold' },
    b = { fg = palette.text, bg = palette.gray4 },
}

theopoimandres.inactive = {
    a = { fg = palette.gray3, bg = palette.gray4, gui = 'bold' },
    b = { fg = palette.gray3, bg = palette.gray4 },
    c = { fg = palette.gray3, bg = palette.none },
}

return theopoimandres
