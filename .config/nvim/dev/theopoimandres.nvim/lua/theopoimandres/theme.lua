local blend = require('theopoimandres.utils').blend

local M = {}

function M.get(config)
    local p = require('theopoimandres.palette')

    -- Helper function to resolve palette references
    local function resolve_color(color_ref)
        return p[color_ref] or color_ref
    end

    local theme = {}
    local groups = config.groups or {}
    local styles = {
        italic = (config.disable_italics and p.none) or 'italic',
        vert_split = (config.bold_vert_split and resolve_color(groups.border)) or p.none,
        background = (config.disable_background and p.none) or resolve_color(groups.background),
        float_background = (config.disable_float_background and p.none) or resolve_color(groups.panel),
    }
    styles.nc_background = (config.dim_nc_background and not config.disable_background and resolve_color(groups.panel))
        or styles.background

    theme = {
        -- Basic editor highlights
        ColorColumn = { bg = p.gray4 },
        Conceal = { bg = p.none },
        CurSearch = { link = 'IncSearch' },
        Cursor = { fg = p.gray4, bg = p.gray1 },
        CursorColumn = { bg = p.gray4 },
        CursorLine = { bg = p.gray4 },
        CursorLineNr = { fg = p.gray1, style = 'bold' },
        DarkenedPanel = { bg = groups.panel },
        DarkenedStatusline = { bg = groups.panel },

        -- Diff highlights
        DiffAdd = { bg = blend(resolve_color(groups.git_add), resolve_color(groups.background), 0.5) },
        DiffChange = { bg = p.gray4 },
        DiffDelete = { bg = blend(resolve_color(groups.git_delete), resolve_color(groups.background), 0.5) },
        DiffText = { bg = blend(resolve_color(groups.git_text), resolve_color(groups.background), 0.5) },
        diffAdded = { link = 'DiffAdd' },
        diffChanged = { link = 'DiffChange' },
        diffRemoved = { link = 'DiffDelete' },

        -- Basic UI
        Directory = { fg = p.light_white },
        ErrorMsg = { fg = p.purple, style = 'bold' },
        FloatBorder = { fg = groups.border },
        FloatTitle = { fg = p.gray2 },
        FoldColumn = { fg = p.gray2 },
        Folded = { fg = p.text, bg = groups.panel },
        IncSearch = { fg = p.gray5, bg = p.turquoise },
        LineNr = { fg = p.gray2 },
        MatchParen = { fg = p.gray1, bg = p.gray3 },
        ModeMsg = { fg = p.light_blue },
        MoreMsg = { fg = p.light_blue },
        NonText = { fg = p.gray2 },
        Normal = { fg = p.text, bg = styles.background },
        NormalFloat = { fg = p.text, bg = styles.float_background },
        NormalNC = { fg = p.text, bg = styles.nc_background },

        -- Popup menu
        Pmenu = { fg = p.gray1, bg = styles.float_background },
        PmenuSbar = { bg = p.gray2 },
        PmenuSel = { fg = p.turquoise, bg = p.gray4 },
        PmenuThumb = { bg = p.gray3 },

        Question = { fg = p.yellow },
        Search = { fg = p.gray4, bg = p.turquoise },
        SpecialKey = { fg = p.turquoise },

        -- Spell checking
        SpellBad = { sp = p.purple, style = 'undercurl' },
        SpellCap = { sp = p.light_blue, style = 'undercurl' },
        SpellLocal = { sp = p.yellow, style = 'undercurl' },
        SpellRare = { sp = p.light_blue, style = 'undercurl' },

        SignColumn = { fg = p.text, bg = p.none },

        -- Status line
        StatusLine = { fg = p.gray1 },
        StatusLineNC = { fg = p.gray1 },

        -- Tabs
        TabLine = { fg = p.gray1 },
        TabLineFill = { bg = p.gray4 },
        TabLineSel = { fg = p.turquoise, style = 'bold' },

        Title = { fg = p.gray_blue },
        VertSplit = { fg = groups.border, bg = styles.vert_split },
        Visual = { bg = p.gray4 },
        WarningMsg = { fg = p.yellow },
        Whitespace = { fg = p.gray2 },
        WildMenu = { link = 'IncSearch' },

        -- Syntax highlighting - incorporating Helix theme semantics
        Comment = { fg = p.comment, style = styles.italic }, -- Comments are italic

        -- Constants
        Constant = { fg = p.turquoise },
        String = { fg = p.turquoise },
        Character = { fg = p.purple },
        Number = { fg = p.turquoise },
        Boolean = { fg = p.turquoise },
        Float = { fg = p.turquoise },

        -- Identifiers
        Identifier = { fg = p.variable },
        Function = { fg = p.function_name },

        -- Statements
        Statement = { fg = p.dark_blue, style = styles.italic }, -- Keywords are italic
        Conditional = { fg = p.dark_blue, style = styles.italic },
        Repeat = { fg = p.dark_blue, style = styles.italic },
        Label = { fg = p.gray_blue },
        Operator = { fg = p.dark_blue },
        Keyword = { fg = p.dark_blue, style = styles.italic }, -- Keywords italic
        Exception = { fg = p.dark_blue, style = styles.italic },

        -- Preprocessing
        PreProc = { fg = p.gray_blue, style = styles.italic }, -- Preprocessor italic
        Include = { fg = p.dark_blue, style = styles.italic },

        -- Types
        Type = { fg = p.turquoise },
        StorageClass = { fg = p.dark_blue, style = styles.italic },
        Structure = { fg = p.turquoise },
        Typedef = { fg = p.turquoise },

        -- Special
        Special = { fg = p.gray2 },
        SpecialChar = { fg = p.purple },
        Tag = { fg = p.turquoise },
        Delimiter = { fg = p.punctuation },
        SpecialComment = { fg = p.gray2, style = styles.italic },
        Debug = { fg = p.purple },

        Underlined = { style = 'underline' },
        Bold = { style = 'bold' },
        Italic = { style = 'italic' },

        Error = { fg = p.error },
        Todo = { bg = p.yellow, fg = p.background2 },

        -- Quickfix
        qfLineNr = { fg = p.gray2 },
        qfFileName = { fg = p.gray1 },

        -- HTML
        htmlH1 = { fg = p.turquoise, style = 'bold' },
        htmlH2 = { fg = p.turquoise, style = 'bold' },

        -- Markdown
        mkdCodeDelimiter = { bg = p.background3, fg = p.text },
        mkdCodeStart = { fg = p.turquoise, style = 'bold' },
        mkdCodeEnd = { fg = p.turquoise, style = 'bold' },
        mkdLink = { fg = p.light_blue, style = 'underline' },

        markdownHeadingDelimiter = { fg = p.dark_blue, style = 'bold' },
        markdownCode = { fg = p.gray1 },
        markdownCodeBlock = { fg = p.turquoise },
        markdownH1 = { fg = p.dark_blue, style = 'bold' },
        markdownH2 = { fg = p.dark_blue, style = 'bold' },
        markdownH3 = { fg = p.dark_blue, style = 'bold' },
        markdownH4 = { fg = p.dark_blue, style = 'bold' },
        markdownLinkText = { fg = p.light_blue, style = 'underline' },

        -- Debug
        debugPC = { bg = p.background1 },
        debugBreakpoint = { bg = p.background2, fg = p.purple },

        -- Diagnostics
        DiagnosticError = { fg = groups.error },
        DiagnosticHint = { fg = groups.hint },
        DiagnosticInfo = { fg = groups.info },
        DiagnosticWarn = { fg = groups.warn },
        DiagnosticUnderlineError = { sp = resolve_color(groups.error), undercurl = true },
        DiagnosticUnderlineHint = { sp = resolve_color(groups.hint), undercurl = true },
        DiagnosticUnderlineInfo = { sp = resolve_color(groups.info), underdotted = true },
        DiagnosticUnderlineWarn = { sp = resolve_color(groups.warn), undercurl = true },

        -- Treesitter - semantic highlighting with italics
        ['@variable'] = { fg = p.variable },
        ['@variable.builtin'] = { fg = p.variable_special, style = styles.italic }, -- Built-in vars italic
        ['@variable.special'] = { fg = p.variable_special, style = styles.italic }, -- Special vars italic

        ['@constant'] = { fg = p.turquoise },
        ['@constant.builtin'] = { fg = p.turquoise },
        ['@constant.macro'] = { fg = p.turquoise },

        ['@string'] = { fg = p.string },
        ['@string.escape'] = { fg = p.purple },
        ['@string.special'] = { fg = p.turquoise },

        ['@character'] = { fg = p.purple },
        ['@character.special'] = { fg = p.purple },

        ['@number'] = { fg = p.number },
        ['@boolean'] = { fg = p.boolean },
        ['@float'] = { fg = p.number },

        ['@function'] = { fg = p.function_name },
        ['@function.builtin'] = { fg = p.function_name },
        ['@function.call'] = { fg = p.function_name },
        ['@function.macro'] = { fg = p.function_name },

        ['@method'] = { fg = p.function_name },
        ['@method.call'] = { fg = p.function_name },

        ['@constructor'] = { fg = p.turquoise },
        ['@parameter'] = { fg = p.variable },

        ['@keyword'] = { fg = p.keyword, style = styles.italic }, -- Keywords italic
        ['@keyword.function'] = { fg = p.keyword, style = styles.italic },
        ['@keyword.operator'] = { fg = p.operator, style = styles.italic },
        ['@keyword.return'] = { fg = p.keyword, style = styles.italic },
        ['@keyword.import'] = { fg = p.keyword, style = styles.italic },
        ['@keyword.export'] = { fg = p.keyword, style = styles.italic },

        ['@conditional'] = { fg = p.keyword, style = styles.italic },
        ['@repeat'] = { fg = p.keyword, style = styles.italic },
        ['@label'] = { fg = p.gray_blue },

        ['@operator'] = { fg = p.operator },

        ['@exception'] = { fg = p.keyword, style = styles.italic },

        ['@type'] = { fg = p.type },
        ['@type.builtin'] = { fg = p.type },
        ['@type.definition'] = { fg = p.type },
        ['@type.qualifier'] = { fg = p.keyword, style = styles.italic },

        ['@storageclass'] = { fg = p.keyword, style = styles.italic },
        ['@attribute'] = { fg = p.gray_blue, style = styles.italic }, -- Attributes italic
        ['@field'] = { fg = p.variable },
        ['@property'] = { fg = p.variable },

        ['@include'] = { fg = p.keyword, style = styles.italic },
        ['@preproc'] = { fg = p.gray_blue, style = styles.italic },

        ['@comment'] = { fg = p.comment, style = styles.italic }, -- Comments italic
        ['@comment.documentation'] = { fg = p.comment, style = styles.italic },

        ['@punctuation.delimiter'] = { fg = p.punctuation },
        ['@punctuation.bracket'] = { fg = p.text },
        ['@punctuation.special'] = { fg = p.punctuation },

        ['@tag'] = { fg = p.turquoise },
        ['@tag.attribute'] = { fg = p.gray_blue, style = styles.italic }, -- Tag attributes italic
        ['@tag.delimiter'] = { fg = p.text },

        ['@text'] = { fg = p.text },
        ['@text.literal'] = { fg = p.turquoise },
        ['@text.reference'] = { fg = p.light_blue },
        ['@text.title'] = { fg = p.gray_blue },
        ['@text.uri'] = { fg = p.turquoise },
        ['@text.underline'] = { style = 'underline' },
        ['@text.todo'] = { bg = p.yellow, fg = p.background2 },

        ['@emphasis'] = { fg = p.gray_blue, style = styles.italic },
        ['@strong'] = { fg = p.gray_blue, style = 'bold' },

        -- Git signs
        GitSignsAdd = { fg = groups.git_add },
        GitSignsChange = { fg = groups.git_change },
        GitSignsDelete = { fg = groups.git_delete },
        SignAdd = { link = 'GitSignsAdd' },
        SignChange = { link = 'GitSignsChange' },
        SignDelete = { link = 'GitSignsDelete' },

        -- Telescope
        TelescopeMatching = { fg = p.turquoise },
        TelescopeNormal = { fg = p.text },
        TelescopeSelection = { fg = p.text, bg = p.gray4 },
        TelescopeTitle = { fg = p.gray2 },
        TelescopeBorder = { fg = p.gray3 },
        TelescopePromptBorder = { fg = p.gray3 },
        TelescopePromptNormal = { fg = p.text },
        TelescopePromptPrefix = { fg = p.gray2 },

        -- nvim-cmp
        CmpItemAbbr = { fg = p.gray2 },
        CmpItemAbbrDeprecated = { fg = p.purple, style = 'strikethrough' },
        CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
        CmpItemAbbrMatchFuzzy = { fg = p.turquoise, style = 'bold' },
        CmpItemKind = { fg = p.light_blue },
        CmpItemKindClass = { fg = p.yellow },
        CmpItemKindFunction = { fg = p.light_blue },
        CmpItemKindInterface = { fg = p.dark_blue },
        CmpItemKindMethod = { fg = p.purple },
        CmpItemKindSnippet = { fg = p.gray1 },
        CmpItemKindVariable = { fg = p.turquoise },

        -- LSP
        LspReferenceText = { bg = p.gray4 },
        LspReferenceRead = { bg = p.gray4 },
        LspReferenceWrite = { bg = p.gray4 },
        LspCodeLens = { fg = p.gray2 },
        LspCodeLensSeparator = { fg = p.gray3 },

        -- Oil.nvim
        OilDir = { fg = p.light_blue },
        OilFile = { fg = p.text },
        OilLink = { fg = p.turquoise },
        OilSocket = { fg = p.purple },
        OilFifo = { fg = p.yellow },
        OilCreate = { fg = p.turquoise },
        OilDelete = { fg = p.purple },
        OilMove = { fg = p.yellow },
        OilCopy = { fg = p.light_blue },
    }

    -- Terminal colors
    vim.g.terminal_color_0 = p.background3 -- black
    vim.g.terminal_color_8 = p.background3 -- bright black
    vim.g.terminal_color_1 = p.purple      -- red
    vim.g.terminal_color_9 = p.purple      -- bright red
    vim.g.terminal_color_2 = p.turquoise   -- green
    vim.g.terminal_color_10 = p.turquoise  -- bright green
    vim.g.terminal_color_3 = p.yellow      -- yellow
    vim.g.terminal_color_11 = p.yellow     -- bright yellow
    vim.g.terminal_color_4 = p.light_blue  -- blue
    vim.g.terminal_color_12 = p.dark_blue  -- bright blue
    vim.g.terminal_color_5 = p.pink        -- magenta
    vim.g.terminal_color_13 = p.pink       -- bright magenta
    vim.g.terminal_color_6 = p.light_blue  -- cyan
    vim.g.terminal_color_14 = p.dark_blue  -- bright cyan
    vim.g.terminal_color_7 = p.white       -- white
    vim.g.terminal_color_15 = p.white      -- bright white

    return theme
end

return M
