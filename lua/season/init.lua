local colors = require('season.colors')
local config = require('season.config')
local season = {}

--- Terminal highlighting
local function set_terminal_colors()
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.orange
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.white
  vim.g.terminal_color_8 = colors.brightBlack
  vim.g.terminal_color_9 = colors.brightred
  vim.g.terminal_color_10 = colors.brightGreen
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.brightBlue
  vim.g.terminal_color_13 = colors.brightMagenta
  vim.g.terminal_color_14 = colors.brightCyan
  vim.g.terminal_color_15 = colors.brightWhite
  vim.g.terminal_color_background = colors.white
  vim.g.terminal_color_foreground = colors.black
end

--- Groups highlighting
local function set_groups()
  local groups = {
    -- Base
    Normal = { fg = colors.black, bg = colors.white },
    NormalFloat = { bg = colors.white },
    FloatBorder = { fg = colors.brightBlack },
    FloatTitle = { fg = colors.black },
    ColorColumn = { bg = colors.brightGray },
    Cursor = { fg = colors.white, bg = colors.black },
    CursorColumn = { bg = colors.brightGray },
    CursorLine = { bg = colors.brightGray },
    CursorLineNr = { fg = colors.brightGreen, bg = colors.brightGray },
    LineNr = { fg = colors.brightBlack },

    Directory = { fg = colors.green },
    ErrorMsg = { fg = colors.red },
    WinSeparator = { fg = colors.brightWhite },
    VertSplit = { link = 'WinSeparator' },
    Folded = { fg = colors.black_idle, bg = colors.white },
    FoldColumn = { bg = colors.white },
    SignColumn = { bg = colors.white },

    MatchParen = { sp = colors.green, underline = true },
    ModeMsg = { fg = colors.brightGreen },
    MoreMsg = { fg = colors.brightGreen },
    NonText = { fg = colors.gray },
    Pmenu = { bg = colors.brightGray },
    PmenuSel = { bg = colors.brighterBlue },
    Question = { fg = colors.brightGreen },
    Search = { fg = colors.white, bg = colors.brightBlue },
    CurSearch = { fg = colors.white, bg = colors.magenta },
    IncSearch = { fg = colors.orange, bg = colors.brighterBlue },
    SpecialKey = { fg = colors.brightGreen },
    SpellCap = { sp = colors.black, undercurl = true },
    SpellLocal = { sp = colors.orange, undercurl = true },
    SpellBad = { sp = colors.red, undercurl = true },
    SpellRare = { sp = colors.cyan, undercurl = true },
    StatusLine = { fg = colors.black, bg = colors.white },
    StatusLineNC = { fg = colors.black_idle, bg = colors.white },
    WildMenu = { fg = colors.black, bg = colors.brightMagenta },
    TabLine = { fg = colors.brightBlack, bg = colors.gray },
    TabLineFill = { fg = colors.black, bg = colors.white },
    TabLineSel = { fg = colors.black, bg = colors.white },
    Title = { fg = colors.orange },
    Visual = { bg = colors.brighterBlue },
    WarningMsg = { fg = colors.orange },

    Comment = { fg = colors.brightBlack, italic = true },
    Constant = { fg = colors.brightBlue },
    String = { fg = colors.brightGreen },
    Identifier = { fg = colors.blue },
    Function = { fg = colors.green },
    Statement = { fg = colors.orange },
    Operator = { fg = colors.black },
    Exception = { fg = colors.brightMagenta },
    PreProc = { fg = colors.brightGreen },
    Type = { fg = colors.blue },
    Structure = { fg = colors.black },
    Special = { fg = colors.brightGreen },
    Delimiter = { fg = colors.black },
    Underlined = { sp = colors.black, underline = true },
    Ignore = { fg = colors.black },
    Error = { fg = colors.white, bg = colors.red },
    Todo = { fg = colors.brightMagenta },
    qfLineNr = { fg = colors.orange },
    qfError = { fg = colors.red },
    Conceal = { fg = colors.brightBlack },
    CursorLineConceal = { fg = colors.gray, bg = colors.brightGray },

    Added = { fg = colors.brightGreen },
    Removed = { fg = colors.brightRed },
    Changed = { fg = colors.brightBlue },
    DiffAdd = { bg = colors.brighterGreen },
    DiffAdded = { fg = colors.brightGreen },
    DiffDelete = { bg = colors.brightOrange },
    DiffRemoved = { fg = colors.brightRed },
    DiffText = { bg = colors.brightGray },
    DiffChange = { bg = colors.brighterBlue },

    -- LSP
    DiagnosticError = { fg = colors.brightRed },
    DiagnosticWarn = { fg = colors.brightOrange },
    DiagnosticInfo = { fg = colors.brightBlue },
    DiagnosticHint = { fg = colors.brightCyan },

    DiagnosticUnderlineError = { sp = colors.brightRed, undercurl = true },
    DiagnosticUnderlineWarn = { sp = colors.brightOrange, undercurl = true },
    DiagnosticUnderlineInfo = { sp = colors.brightBlue, undercurl = true },
    DiagnosticUnderlineHint = { sp = colors.brightCyan, undercurl = true },

    -- Markdown
    markdownCode = { fg = colors.magenta },

    -- TreeSitter
    ['@property'] = { fg = colors.blue },
    ['@tag'] = { link = 'Structure' },
    ['@tag.attribute'] = { fg = colors.blue },
    ['@tag.delimiter'] = { link = 'Delimiter' },
    ['@tag.builtin.tsx'] = { link = 'Structure' },
    ['@tag.builtin.jsx'] = { link = 'Structure' },
    ['@type.builtin'] = { fg = colors.blue },
    ['@type.qualifier'] = { fg = colors.orange },
    ['@variable'] = { fg = colors.black },
    ['@variable.builtin'] = { fg = colors.green },
    ['@variable.member'] = { fg = colors.blue },
    ['@variable.parameter'] = { fg = colors.black },
    ['@module'] = { fg = colors.black },
    ['@markup.heading'] = { fg = colors.orange },
    ['@keyword.storage'] = { fg = colors.orange },
    ['@function.builtin'] = { link = '@function' },

    ['@lsp.type.keyword'] = {},
    ['@keyword'] = { link = 'Statement' },
    ['@keyword.function'] = { fg = colors.blue },

    ['@lsp.type.namespace'] = { link = '@module' },
    ['@lsp.type.type'] = { link = '@type' },
    ['@lsp.type.class'] = { link = '@type' },
    ['@lsp.type.enum'] = { link = '@type' },
    ['@lsp.type.interface'] = { link = '@type' },
    ['@lsp.type.struct'] = { link = '@variable.member' },
    ['@lsp.type.parameter'] = { fg = colors.orange },
    ['@lsp.type.field'] = { link = '@variable.member' },
    ['@lsp.type.variable'] = { link = '@variable' },
    ['@lsp.type.property'] = { link = '@variable.member' },
    ['@lsp.type.enumMember'] = { link = '@constant' },
    ['@lsp.type.function'] = { link = '@function' },
    ['@lsp.type.method'] = { link = '@function.method' },
    ['@lsp.type.macro'] = { link = '@function.macro' },
    ['@lsp.type.decorator'] = { link = '@function' },
    ['@lsp.mod.constant'] = { link = '@constant' },

    ['@lsp.type.string'] = {},
    ['@string'] = { link = 'String' },
    ['@string.escape'] = { fg = colors.green },
    ['@string.special.url.tsx'] = { fg = colors.magenta },

    -- TreesitterContext
    TreesitterContext = { bg = colors.brighterBlue },

    -- Telescope
    TelescopePromptBorder = { fg = colors.brightGreen },
    TelescopeBorder = { fg = colors.brightGreen },
    TeleScopeTitle = { fg = colors.black },

    -- Cmp
    CmpNormal = { bg = colors.brightGray },
    CmpDocNormal = { bg = colors.brightGray },
    CmpGhostText = { fg = colors.brightBlack },
    CmpItemAbbrMatch = { fg = colors.orange },
    CmpItemAbbrMatchFuzzy = { fg = colors.green },
    CmpItemKindText = { fg = colors.brightGreen },
    CmpItemKindMethod = { fg = colors.orange },
    CmpItemKindFunction = { fg = colors.green },
    CmpItemKindConstructor = { fg = colors.orange },
    CmpItemKindField = { fg = colors.blue },
    CmpItemKindVariable = { fg = colors.black },
    CmpItemKindClass = { fg = colors.blue },
    CmpItemKindInterface = { fg = colors.blue },
    CmpItemKindModule = { fg = colors.orange },
    CmpItemKindProperty = { fg = colors.orange },
    CmpItemKindUnit = { fg = colors.brightBlue },
    CmpItemKindValue = { fg = colors.brightBlue },
    CmpItemKindEnum = { fg = colors.blue },
    CmpItemKindKeyword = { fg = colors.orange },
    CmpItemKindSnippet = { fg = colors.cyan },
    CmpItemKindColor = { fg = colors.magenta },
    CmpItemKindFile = { fg = colors.magenta },
    CmpItemKindReference = { fg = colors.magenta },
    CmpItemKindFolder = { fg = colors.magenta },
    CmpItemKindEnumMember = { fg = colors.brightBlue },
    CmpItemKindConstant = { fg = colors.brightBlue },
    CmpItemKindStruct = { fg = colors.blue },
    CmpItemKindEvent = { fg = colors.black },
    CmpItemKindOperator = { fg = colors.black },
    CmpItemKindTypeParameter = { fg = colors.black },
    CmpItemMenu = { fg = colors.brightBlack },

    -- Word under cursor
    CursorWord = { bg = colors.brighterBlue },
    CursorWord0 = { bg = colors.brighterBlue },
    CursorWord1 = { bg = colors.brighterBlue },

    -- Noice
    NoiceLspProgressTitle = { fg = colors.black },
    NoiceLspProgressClient = { fg = colors.magenta },

    -- WhichKey
    WhichKeyFloat = { bg = colors.white },

    -- Indent blankline
    IndentBlanklineContextChar = { fg = colors.brightBlack },

    -- LSP Inlay Hints
    LspInlayHint = { fg = colors.brightBlack },

    -- LSP Signature
    LspSignatureActiveParameter = { italic = true },

    -- Dap
    NvimDapVirtualText = { fg = colors.cyan },

    -- DAP UI
    DapUIScope = { fg = colors.green },
    DapUIType = { fg = colors.blue },
    DapUIDecoration = { fg = colors.black },
    DapUIThread = { fg = colors.brightGreen },
    DapUIStoppedThread = { fg = colors.magenta },
    DapUISource = { fg = colors.cyan },
    DapUILineNumber = { fg = colors.brightBlue },
    DapUIFloatBorder = { fg = colors.white },
    DapUIWatchesEmpty = { fg = colors.orange },
    DapUIWatchesValue = { fg = colors.brightGreen },
    DapUIWatchesError = { fg = colors.red },
    DapUIBreakpointsPath = { fg = colors.cyan },
    DapUIBreakpointsInfo = { fg = colors.brightBlue },
    DapUIBreakpointsCurrentLine = { fg = colors.brightBlue, bold = true },

    -- Visual Multi
    VM_Extend = { bg = colors.brighterBlue },
    VM_Cursor = { bg = colors.brighterBlue, sp = colors.black, underline = true },
    VM_Insert = { sp = colors.black, underline = true },
    VM_Mono = { fg = colors.white, bg = colors.brightBlack },

    -- Mini
    MiniFilesTitleFocused = { fg = colors.black, bold = true },
    MiniHipatternsFixme = { fg = colors.white, bg = colors.brightRed, bold = true },
    MiniHipatternsHack = { fg = colors.white, bg = colors.brightOrange, bold = true },
    MiniHipatternsTodo = { fg = colors.white, bg = colors.brightMagenta, bold = true },
    MiniHipatternsNote = { fg = colors.white, bg = colors.brightCyan, bold = true },
    MiniIconsAzure = { fg = colors.brightBlue },
    MiniIconsBlue = { fg = colors.blue },
    MiniIconsCyan = { fg = colors.cyan },
    MiniIconsOrange = { fg = colors.orange },
    MiniIconsPurple = { fg = colors.magenta },
    MiniIconsRed = { fg = colors.red },
    MiniIconsYellow = { fg = colors.yellow },
    MiniIndentscopeSymbol = { fg = colors.brightBlack },
    MiniIndentscopeSymbolOff = { fg = colors.orange },
    MiniJump = { sp = colors.orange, undercurl = true },
    MiniJump2dDim = { fg = colors.brightBlack, nocombine = true },
    MiniJump2dSpot = { fg = colors.orange, bold = true, underline = true, nocombine = true },
    MiniJump2dSpotAhead = { fg = colors.blue, underline = true, nocombine = true },
    MiniJump2dSpotUnique = { fg = colors.black, bold = true, underline = true, nocombine = true },
    MiniStarterItemPrefix = { fg = colors.brightGreen },
    MiniStarterFooter = { link = 'Comment' },
    MiniStatuslineDevinfo = { fg = colors.black, bg = colors.white },
    MiniStatuslineFileinfo = { fg = colors.black, bg = colors.white },
    MiniStatuslineFilename = { fg = colors.black_idle, bg = colors.white },
    MiniStatuslineInactive = { fg = colors.black_idle, bg = colors.white },
    MiniStatuslineModeCommand = { fg = colors.white, bg = colors.orange, bold = true },
    MiniStatuslineModeInsert = { fg = colors.white, bg = colors.brightGreen, bold = true },
    MiniStatuslineModeNormal = { fg = colors.white, bg = colors.blue, bold = true },
    MiniStatuslineModeOther = { fg = colors.white, bg = colors.cyan, bold = true },
    MiniStatuslineModeReplace = { fg = colors.white, bg = colors.brightMagenta, bold = true },
    MiniStatuslineModeVisual = { fg = colors.white, bg = colors.brightGreen, bold = true },
    MiniTablineCurrent = { fg = colors.black, bg = colors.white, bold = true },
    MiniTablineFill = { fg = colors.black, bg = colors.white },
    MiniTablineHidden = { fg = colors.brightBlack, bg = colors.gray },
    MiniTablineModifiedCurrent = { fg = colors.white, bg = colors.black, bold = true },
    MiniTablineModifiedHidden = { fg = colors.gray, bg = colors.brightBlack },
    MiniTablineModifiedVisible = { fg = colors.white, bg = colors.black },
    MiniTablineVisible = { fg = colors.black, bg = colors.white },
    MiniTestFail = { fg = colors.red, bold = true },
    MiniTestPass = { fg = colors.brightGreen, bold = true },
    MiniTrailspace = { bg = colors.brightRed },

    -- Neotree
    NeotreeGitUntracked = { fg = colors.black },
    NeotreeGitModified = { link = 'Changed' },
    NeoTreeGitRenamed = { link = 'Changed' },
  }

  groups = vim.tbl_deep_extend('force', groups, type(config.overrides) == 'function' and config.overrides() or config.overrides)

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

--- User settings
---@param values table
function season.setup(values) setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) }) end

--- Set colorscheme
function season.colorscheme()
  if vim.version().minor < 8 then
    vim.notify('Neovim 0.8+ is required for season colorscheme', vim.log.levels.ERROR, { title = 'season colorscheme' })
    return
  end

  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
  vim.o.termguicolors = true
  vim.g.colors_name = 'season'

  if config.terminal then
    set_terminal_colors()
  end
  set_groups()
end

return season
