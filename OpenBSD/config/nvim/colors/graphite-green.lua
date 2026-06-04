-- Graphite-Green colorscheme for Neovim
-- Inspired by the Graphite-Green GTK theme with xterm syntax colors.
-- Pure black background with transparency support (Alacritty 0.85 opacity).

vim.cmd("hi clear")
vim.o.background = "dark"
vim.g.colors_name = "graphite-green"

local c = {
  none      = "NONE",
  bg        = "NONE",         -- transparent for Alacritty
  fg        = "#E5E5E5",      -- xterm white

  -- xterm standard palette
  black     = "#000000",
  red       = "#CD0000",
  green     = "#00CD00",
  yellow    = "#CDCD00",
  blue      = "#5C5CFF",      -- using bright blue (xterm blue is too dark)
  magenta   = "#CD00CD",
  cyan      = "#00CDCD",
  white     = "#E5E5E5",

  -- xterm bright palette
  br_red    = "#FF0000",
  br_green  = "#00FF00",
  br_yellow = "#FFFF00",
  br_blue   = "#5C5CFF",
  br_mag    = "#FF00FF",
  br_cyan   = "#00FFFF",
  br_white  = "#FFFFFF",

  -- graphite grays (UI chrome)
  gray1     = "#0D0D0D",
  gray2     = "#1A1A1A",
  gray3     = "#2D2D2D",
  gray4     = "#3D3D3D",
  gray5     = "#4D4D4D",
  gray6     = "#6C6C6C",

  -- Graphite-Green accents
  accent    = "#4CAF50",
  accent_dk = "#2E7D32",
  accent_lt = "#66BB6A",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

---------------------------------------------------------------------------
-- Editor UI
---------------------------------------------------------------------------
hi("Normal",        { fg = c.fg,     bg = c.bg })
hi("NormalNC",      { fg = c.fg,     bg = c.bg })
hi("NormalFloat",   { fg = c.fg,     bg = c.gray2 })
hi("FloatBorder",   { fg = c.accent, bg = c.gray2 })
hi("FloatTitle",    { fg = c.accent, bg = c.gray2, bold = true })
hi("Cursor",        { fg = c.black,  bg = c.accent })
hi("CursorLine",    { bg = c.gray2 })
hi("CursorColumn",  { bg = c.gray2 })
hi("ColorColumn",   { bg = c.gray2 })
hi("LineNr",        { fg = c.gray5,  bg = c.bg })
hi("CursorLineNr",  { fg = c.accent, bg = c.bg, bold = true })
hi("SignColumn",    { fg = c.gray5,  bg = c.bg })
hi("VertSplit",     { fg = c.gray4,  bg = c.bg })
hi("WinSeparator",  { fg = c.gray4,  bg = c.bg })
hi("StatusLine",    { fg = c.fg,     bg = c.bg })
hi("StatusLineNC",  { fg = c.gray6,  bg = c.bg })
hi("TabLine",       { fg = c.gray6,  bg = c.gray2 })
hi("TabLineFill",   { bg = c.gray2 })
hi("TabLineSel",    { fg = c.accent, bg = c.gray3, bold = true })
hi("WinBar",        { fg = c.fg,     bg = c.bg })
hi("WinBarNC",      { fg = c.gray6,  bg = c.bg })

-- Popup / completion menu
hi("Pmenu",         { fg = c.fg,     bg = c.gray2 })
hi("PmenuSel",      { fg = c.black,  bg = c.accent })
hi("PmenuSbar",     { bg = c.gray3 })
hi("PmenuThumb",    { bg = c.accent_dk })
hi("WildMenu",      { fg = c.black,  bg = c.accent })

-- Search & visual
hi("Visual",        { bg = c.gray4 })
hi("VisualNOS",     { bg = c.gray4 })
hi("Search",        { fg = c.black,  bg = c.yellow })
hi("IncSearch",     { fg = c.black,  bg = c.accent })
hi("CurSearch",     { fg = c.black,  bg = c.accent_lt })
hi("Substitute",    { fg = c.black,  bg = c.yellow })

-- Fold & whitespace
hi("Folded",        { fg = c.gray6,  bg = c.gray2 })
hi("FoldColumn",    { fg = c.gray5,  bg = c.bg })
hi("NonText",       { fg = c.gray4 })
hi("SpecialKey",    { fg = c.gray4 })
hi("Whitespace",    { fg = c.gray3 })
hi("EndOfBuffer",   { fg = c.gray3 })

-- Messages
hi("Directory",     { fg = c.accent })
hi("Title",         { fg = c.accent, bold = true })
hi("ErrorMsg",      { fg = c.br_red, bold = true })
hi("WarningMsg",    { fg = c.yellow, bold = true })
hi("ModeMsg",       { fg = c.accent, bold = true })
hi("MoreMsg",       { fg = c.accent })
hi("Question",      { fg = c.accent })
hi("Conceal",       { fg = c.gray6 })
hi("MatchParen",    { fg = c.accent_lt, bold = true, underline = true })

-- Diff
hi("DiffAdd",       { fg = c.green,  bg = c.gray2 })
hi("DiffChange",    { fg = c.yellow, bg = c.gray2 })
hi("DiffDelete",    { fg = c.red,    bg = c.gray2 })
hi("DiffText",      { fg = c.black,  bg = c.yellow })
hi("Added",         { fg = c.green })
hi("Changed",       { fg = c.yellow })
hi("Removed",       { fg = c.red })

-- Spell
hi("SpellBad",      { undercurl = true, sp = c.red })
hi("SpellCap",      { undercurl = true, sp = c.yellow })
hi("SpellLocal",    { undercurl = true, sp = c.cyan })
hi("SpellRare",     { undercurl = true, sp = c.magenta })

---------------------------------------------------------------------------
-- Syntax (xterm colors)
---------------------------------------------------------------------------
hi("Comment",       { fg = c.gray6,   italic = true })
hi("Constant",      { fg = c.magenta })
hi("String",        { fg = c.green })
hi("Character",     { fg = c.green })
hi("Number",        { fg = c.magenta })
hi("Boolean",       { fg = c.magenta })
hi("Float",         { fg = c.magenta })
hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.cyan })
hi("Statement",     { fg = c.green,   bold = true })
hi("Conditional",   { fg = c.green })
hi("Repeat",        { fg = c.green })
hi("Label",         { fg = c.green })
hi("Operator",      { fg = c.fg })
hi("Keyword",       { fg = c.green,   bold = true })
hi("Exception",     { fg = c.red })
hi("PreProc",       { fg = c.yellow })
hi("Include",       { fg = c.green })
hi("Define",        { fg = c.yellow })
hi("Macro",         { fg = c.yellow })
hi("PreCondit",     { fg = c.yellow })
hi("Type",          { fg = c.yellow })
hi("StorageClass",  { fg = c.yellow })
hi("Structure",     { fg = c.yellow })
hi("Typedef",       { fg = c.yellow })
hi("Special",       { fg = c.cyan })
hi("SpecialChar",   { fg = c.magenta })
hi("Tag",           { fg = c.green })
hi("Delimiter",     { fg = c.white })
hi("SpecialComment",{ fg = c.gray6,   bold = true })
hi("Debug",         { fg = c.red })
hi("Underlined",    { fg = c.cyan,    underline = true })
hi("Ignore",        { fg = c.gray5 })
hi("Error",         { fg = c.br_red,  bold = true })
hi("Todo",          { fg = c.black,   bg = c.accent, bold = true })

---------------------------------------------------------------------------
-- Treesitter
---------------------------------------------------------------------------
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.magenta })
hi("@variable.parameter",    { fg = c.fg, italic = true })
hi("@variable.member",       { fg = c.fg })
hi("@constant",              { fg = c.magenta })
hi("@constant.builtin",      { fg = c.magenta, bold = true })
hi("@string",                { fg = c.green })
hi("@string.escape",         { fg = c.cyan })
hi("@string.regex",          { fg = c.cyan })
hi("@character",             { fg = c.green })
hi("@number",                { fg = c.magenta })
hi("@boolean",               { fg = c.magenta })
hi("@float",                 { fg = c.magenta })
hi("@function",              { fg = c.cyan })
hi("@function.builtin",      { fg = c.cyan, bold = true })
hi("@function.call",         { fg = c.cyan })
hi("@function.method",       { fg = c.cyan })
hi("@function.method.call",  { fg = c.cyan })
hi("@constructor",           { fg = c.yellow })
hi("@keyword",               { fg = c.green, bold = true })
hi("@keyword.function",      { fg = c.green })
hi("@keyword.return",        { fg = c.green })
hi("@keyword.operator",      { fg = c.green })
hi("@keyword.import",        { fg = c.green })
hi("@keyword.conditional",   { fg = c.green })
hi("@keyword.repeat",        { fg = c.green })
hi("@keyword.exception",     { fg = c.red })
hi("@type",                  { fg = c.yellow })
hi("@type.builtin",          { fg = c.yellow, italic = true })
hi("@type.qualifier",        { fg = c.green })
hi("@attribute",             { fg = c.yellow })
hi("@property",              { fg = c.fg })
hi("@operator",              { fg = c.fg })
hi("@punctuation.bracket",   { fg = c.white })
hi("@punctuation.delimiter", { fg = c.white })
hi("@punctuation.special",   { fg = c.cyan })
hi("@comment",               { fg = c.gray6, italic = true })
hi("@markup.heading",        { fg = c.accent, bold = true })
hi("@markup.strong",         { bold = true })
hi("@markup.italic",         { italic = true })
hi("@markup.underline",      { underline = true })
hi("@markup.link.url",       { fg = c.cyan, underline = true })
hi("@markup.raw",            { fg = c.green })
hi("@tag",                   { fg = c.green })
hi("@tag.delimiter",         { fg = c.gray6 })
hi("@tag.attribute",         { fg = c.yellow })

---------------------------------------------------------------------------
-- Diagnostics
---------------------------------------------------------------------------
hi("DiagnosticError",          { fg = c.br_red })
hi("DiagnosticWarn",           { fg = c.yellow })
hi("DiagnosticInfo",           { fg = c.cyan })
hi("DiagnosticHint",           { fg = c.accent })
hi("DiagnosticOk",             { fg = c.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.br_red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.cyan })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.accent })
hi("DiagnosticVirtualTextError", { fg = c.br_red, bg = c.gray2 })
hi("DiagnosticVirtualTextWarn",  { fg = c.yellow,  bg = c.gray2 })
hi("DiagnosticVirtualTextInfo",  { fg = c.cyan,    bg = c.gray2 })
hi("DiagnosticVirtualTextHint",  { fg = c.accent,  bg = c.gray2 })

---------------------------------------------------------------------------
-- LSP
---------------------------------------------------------------------------
hi("LspReferenceText",  { bg = c.gray3 })
hi("LspReferenceRead",  { bg = c.gray3 })
hi("LspReferenceWrite", { bg = c.gray3, underline = true })
hi("LspInlayHint",      { fg = c.gray5, italic = true })
hi("LspSignatureActiveParameter", { fg = c.accent, bold = true })

---------------------------------------------------------------------------
-- Git signs
---------------------------------------------------------------------------
hi("GitSignsAdd",    { fg = c.green,  bg = c.bg })
hi("GitSignsChange", { fg = c.yellow, bg = c.bg })
hi("GitSignsDelete", { fg = c.red,    bg = c.bg })

---------------------------------------------------------------------------
-- Snacks / dashboard / indent
---------------------------------------------------------------------------
hi("SnacksIndent",       { fg = c.gray3 })
hi("SnacksIndentScope",  { fg = c.accent_dk })
hi("SnacksDashboardHeader", { fg = c.accent })
hi("SnacksDashboardIcon",   { fg = c.accent })
hi("SnacksDashboardKey",    { fg = c.accent_lt })
hi("SnacksDashboardDesc",   { fg = c.fg })
hi("SnacksDashboardFooter", { fg = c.gray6, italic = true })

---------------------------------------------------------------------------
-- Lazy.nvim UI
---------------------------------------------------------------------------
hi("LazyButton",       { fg = c.fg,     bg = c.gray3 })
hi("LazyButtonActive", { fg = c.black,  bg = c.accent })
hi("LazyH1",           { fg = c.black,  bg = c.accent, bold = true })
hi("LazySpecial",      { fg = c.accent })
hi("LazyProgressDone", { fg = c.accent })
hi("LazyProgressTodo", { fg = c.gray4 })

---------------------------------------------------------------------------
-- Which-key
---------------------------------------------------------------------------
hi("WhichKey",          { fg = c.accent })
hi("WhichKeyGroup",     { fg = c.cyan })
hi("WhichKeySeparator", { fg = c.gray5 })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeyValue",     { fg = c.gray6 })

---------------------------------------------------------------------------
-- Telescope / fzf-lua (if used)
---------------------------------------------------------------------------
hi("TelescopeBorder",       { fg = c.accent, bg = c.gray2 })
hi("TelescopeTitle",        { fg = c.accent, bold = true })
hi("TelescopePromptBorder", { fg = c.accent, bg = c.gray2 })
hi("TelescopePromptTitle",  { fg = c.black, bg = c.accent })
hi("TelescopeSelection",    { bg = c.gray3 })
hi("FzfLuaBorder",          { fg = c.accent })
hi("FzfLuaTitle",           { fg = c.black, bg = c.accent, bold = true })
hi("FzfLuaCursorLine",      { bg = c.gray3 })

---------------------------------------------------------------------------
-- Mini (statusline, icons, etc.)
---------------------------------------------------------------------------
hi("MiniStatuslineFilename",  { fg = c.fg,    bg = c.gray3 })
hi("MiniStatuslineDevinfo",   { fg = c.fg,    bg = c.gray3 })
hi("MiniStatuslineModeNormal",  { fg = c.black, bg = c.accent, bold = true })
hi("MiniStatuslineModeInsert",  { fg = c.black, bg = c.cyan, bold = true })
hi("MiniStatuslineModeVisual",  { fg = c.black, bg = c.magenta, bold = true })
hi("MiniStatuslineModeReplace", { fg = c.black, bg = c.red, bold = true })
hi("MiniStatuslineModeCommand", { fg = c.black, bg = c.yellow, bold = true })

---------------------------------------------------------------------------
-- Notify / Noice
---------------------------------------------------------------------------
hi("NotifyERRORBorder", { fg = c.red })
hi("NotifyWARNBorder",  { fg = c.yellow })
hi("NotifyINFOBorder",  { fg = c.accent })
hi("NotifyDEBUGBorder", { fg = c.gray5 })
hi("NotifyTRACEBorder", { fg = c.magenta })
hi("NotifyERRORTitle",  { fg = c.br_red })
hi("NotifyWARNTitle",   { fg = c.yellow })
hi("NotifyINFOTitle",   { fg = c.accent })
hi("NotifyDEBUGTitle",  { fg = c.gray6 })
hi("NotifyTRACETitle",  { fg = c.magenta })
