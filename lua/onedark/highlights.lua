local c = require("onedark.colors")
local cfg = vim.g.onedark_config

local M = {}
local hl = { langs = {}, plugins = {} }

local function vim_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_command(
      string.format(
        "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
        group_name,
        group_settings.fg or "none",
        group_settings.bg or "none",
        group_settings.sp or "none",
        group_settings.fmt or "none"
      )
    )
  end
end

local colors = {
  Fg = { fg = c.fg },
  LightGrey = { fg = c.light_grey },
  Grey = { fg = c.grey },
  Red = { fg = c.red },
  Cyan = { fg = c.cyan },
  Yellow = { fg = c.yellow },
  Orange = { fg = c.orange },
  Green = { fg = c.green },
  Blue = { fg = c.blue },
  Purple = { fg = c.purple },
}
hl.common = {
  Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  Sidebar = { bg = c.sidebar },
  Terminal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
  WinBar = { bg = c.bg_d },
  WinBarNC = { bg = c.bg_d },
  InactiveWinBar = { bg = c.bg_d, fg = c.grey, fmt = "italic" },
  EndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0 },
  FoldColumn = { fg = c.grey, bg = c.none, fmt = "nocombine" },
  Folded = { fg = c.fg, bg = cfg.transparent and c.none or c.bg2 },
  SignColumn = { fg = c.fg, bg = c.none, fmt = "nocombine" },
  ToolbarLine = { fg = c.fg },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.bg1 },
  CursorLine = { bg = c.bg1 },
  ColorColumn = { bg = c.bg1 },
  CursorLineNr = { fg = c.purple, fmt = "italic,bold" },
  LineNr = { fg = c.grey },
  Conceal = { fg = c.grey, bg = c.bg1 },
  DiffAdd = { fg = c.none, bg = c.diff_add },
  DiffChange = { fg = c.none, bg = c.diff_change },
  DiffDelete = { fg = c.none, bg = c.diff_delete },
  DiffText = { fg = c.none, bg = c.diff_text },
  DiffAdded = colors.Green,
  DiffRemoved = colors.Red,
  DiffFile = colors.Cyan,
  DiffIndexLine = colors.Grey,
  Directory = { fg = c.blue },
  ErrorMsg = { fg = c.red, fmt = "bold" },
  WarningMsg = { fg = c.yellow, fmt = "bold" },
  MoreMsg = { fg = c.blue, fmt = "italic" },
  CurSearch = { fg = c.bg0, bg = c.orange },
  IncSearch = { fg = c.bg0, bg = c.orange },
  Search = { fg = c.bg0, bg = c.light_yellow },
  Substitute = { fg = c.bg0, bg = c.green },
  MatchParen = { fg = c.none, bg = c.grey },
  NonText = { fg = c.grey, fmt = "nocombine" },
  Whitespace = { fg = c.bg2 },
  SpecialKey = { fg = c.grey },
  Pmenu = { fg = c.fg, bg = c.bg_d },
  PmenuSbar = { fg = c.none, bg = c.bg1 },
  PmenuSel = { fg = c.black, bg = c.bg_blue },
  WildMenu = { fg = c.bg0, bg = c.blue },
  PmenuThumb = { fg = c.none, bg = c.grey },
  Question = { fg = c.yellow },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.yellow },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.blue },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.purple },
  StatusLine = { fg = c.fg, bg = c.none },
  StatusLineTerm = { fg = c.fg, bg = c.bg2 },
  StatusLineNC = { fg = c.grey, bg = c.none },
  StatusLineTermNC = { fg = c.grey, bg = c.bg1 },
  TabLine = { fg = c.fg, bg = c.bg1 },
  TabLineFill = { fg = c.grey, bg = c.bg1 },
  TabLineSel = { fg = c.bg0, bg = c.fg },
  WinSeparator = { fg = c.bg1, bg = c.none },
  Visual = { bg = c.bg3 },
  VisualNOS = { fg = c.none, bg = c.bg2, fmt = "underline" },
  QuickFixLine = { bg = c.dark_purple, fmt = "italic" },
  Debug = { fg = c.yellow },
  debugPC = { fg = c.bg0, bg = c.green },
  debugBreakpoint = { fg = c.bg0, bg = c.red },
  ToolbarButton = { fg = c.bg0, bg = c.bg_blue },
  FloatBorder = { fg = c.bg2, bg = c.bg0 },
  NormalFloat = { fg = c.fg, bg = c.bg1 },
}

hl.syntax = {
  String = { fg = c.green, fmt = cfg.code_style.strings },
  Character = colors.Orange,
  Number = colors.Orange,
  Float = colors.Orange,
  Boolean = colors.Orange,
  Type = colors.Yellow,
  Structure = colors.Yellow,
  StorageClass = colors.Yellow,
  Identifier = { fg = c.red, fmt = cfg.code_style.variables },
  Constant = colors.Cyan,
  PreProc = colors.Purple,
  PreCondit = colors.Purple,
  Include = colors.Purple,
  Keyword = { fg = c.purple, fmt = cfg.code_style.keywords },
  Define = colors.Purple,
  Typedef = colors.Yellow,
  Exception = colors.Purple,
  Conditional = { fg = c.purple, fmt = cfg.code_style.keywords },
  Repeat = { fg = c.purple, fmt = cfg.code_style.keywords },
  Statement = colors.Purple,
  Macro = colors.Red,
  Error = colors.Purple,
  Label = colors.Purple,
  Special = colors.Red,
  SpecialChar = colors.Red,
  Function = { fg = c.blue, fmt = cfg.code_style.functions },
  Operator = colors.Purple,
  Title = colors.Cyan,
  Tag = colors.Green,
  Delimiter = colors.LightGrey,
  Comment = { fg = c.grey, fmt = cfg.code_style.comments },
  SpecialComment = { fg = c.grey, fmt = cfg.code_style.comments },
  Todo = { fg = c.red, fmt = cfg.code_style.comments },
}

-- i always use neovim >= 0.9
hl.treesitter = {
  ["@annotation"] = colors.Fg,
  ["@attribute"] = colors.Cyan,
  ["@attribute.typescript"] = colors.Blue,
  ["@boolean"] = colors.Orange,
  ["@character"] = colors.Orange,
  ["@comment"] = { fg = c.grey, fmt = cfg.code_style.comments },
  ["@conditional"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@constant"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constant.builtin"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constant.macro"] = { fg = c.orange, fmt = cfg.code_style.constants },
  ["@constructor"] = { fg = c.yellow, fmt = "bold" },
  ["@error"] = colors.Fg,
  ["@exception"] = colors.Purple,
  ["@field"] = colors.Cyan,
  ["@float"] = colors.Orange,
  ["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@function.call"] = { fg = c.blue, fmt = "bold,italic" },
  ["@function.method.call"] = { fg = c.blue, fmt = "bold,italic" },
  ["@function.builtin"] = { fg = c.cyan, fmt = cfg.code_style.functions },
  ["@function.macro"] = { fg = c.cyan, fmt = cfg.code_style.functions },
  ["@include"] = colors.Cyan,
  ["@keyword"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@keyword.function"] = { fg = c.purple, fmt = cfg.code_style.functions },
  ["@keyword.operator"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@keyword.export"] = { fg = c.yellow, fmt = cfg.code_style.keywords },
  ["@keyword.return"] = { fg = c.red, fmt = cfg.code_style.keywords },
  ["@label"] = colors.Red,
  ["@function.method"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@method"] = { fg = c.blue, fmt = cfg.code_style.functions },
  ["@namespace"] = colors.Yellow,
  ["@none"] = { fg = c.none },
  ["@number"] = colors.Orange,
  ["@operator"] = colors.Purple,
  ["@parameter"] = colors.Red,
  ["@parameter.reference"] = colors.Fg,
  ["@preproc"] = colors.Purple,
  ["@property"] = colors.Cyan,
  ["@punctuation.delimiter"] = colors.LightGrey,
  ["@punctuation.bracket"] = colors.LightGrey,
  ["@punctuation.special"] = colors.Red,
  ["@repeat"] = { fg = c.purple, fmt = cfg.code_style.keywords },
  ["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
  ["@string.regex"] = { fg = c.orange, fmt = cfg.code_style.strings },
  ["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
  ["@symbol"] = colors.Cyan,
  ["@tag"] = colors.Purple,
  ["@tag.attribute"] = colors.Yellow,
  ["@tag.delimiter"] = colors.Purple,
  ["@text"] = colors.Fg,
  ["@text.strong"] = { fg = c.fg, fmt = "bold" },
  ["@text.emphasis"] = { fg = c.fg, fmt = "italic" },
  ["@text.underline"] = { fg = c.fg, fmt = "underline" },
  ["@text.strike"] = { fg = c.fg, fmt = "strikethrough" },
  ["@text.title"] = { fg = c.orange, fmt = "bold" },
  ["@text.literal"] = colors.Green,
  ["@text.uri"] = { fg = c.purple, fmt = "undercurl" },
  ["@text.todo"] = { fg = c.red, fmt = cfg.code_style.comments },
  ["@text.math"] = colors.Fg,
  ["@text.reference"] = colors.Blue,
  ["@text.environment"] = colors.Fg,
  ["@text.environment.name"] = colors.Fg,
  ["@text.diff.add"] = colors.Green,
  ["@text.diff.delete"] = colors.Red,
  ["@note"] = colors.Fg,
  ["@warning"] = colors.Fg,
  ["@danger"] = colors.Fg,
  ["@type"] = colors.Yellow,
  ["@type.builtin"] = colors.Orange,
  ["@variable"] = { fg = c.fg, fmt = cfg.code_style.variables },
  ["@variable.member"] = colors.Cyan,
  ["@variable.property"] = colors.Cyan,
  ["@variable.builtin"] = { fg = c.red, fmt = cfg.code_style.variables },

  ["@markup.link.url"] = colors.Cyan,
  ["@markup.link.label"] = colors.Orange,

  TreesitterContext = { bg = c.bg_cyan },
  TreesitterContextLineNumber = { fg = c.cyan, fmt = "bold,italic" },
}

hl.lsp = {
  ["@lsp.type.comment"] = hl.treesitter["@comment"],
  ["@lsp.type.enum"] = hl.treesitter["@type"],
  ["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
  ["@lsp.type.interface"] = hl.treesitter["@type"],
  ["@lsp.type.typeParameter"] = hl.treesitter["@type"],
  ["@lsp.type.keyword"] = hl.treesitter["@keyword"],
  ["@lsp.type.namespace"] = hl.treesitter["@namespace"],
  ["@lsp.type.parameter"] = hl.treesitter["@parameter"],
  ["@lsp.type.property"] = hl.treesitter["@property"],
  ["@lsp.type.variable"] = hl.treesitter["@variable"],
  ["@lsp.type.macro"] = hl.treesitter["@function.macro"],
  ["@lsp.type.method"] = hl.treesitter["@method"],
  ["@lsp.type.number"] = hl.treesitter["@number"],
  ["@lsp.type.generic"] = hl.treesitter["@text"],
  ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
  ["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
  ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
  ["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
  ["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
  ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
  ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
  ["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
}

hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = colors.Orange,
  LspCxxHlGroupMemberVariable = colors.Orange,
  LspCxxHlGroupNamespace = colors.Blue,
  LspCxxHlSkippedRegion = colors.Grey,
  LspCxxHlSkippedRegionBeginEnd = colors.Red,

  DiagnosticError = { fg = c.red },
  DiagnosticHint = { fg = c.purple },
  DiagnosticInfo = { fg = c.cyan },
  DiagnosticWarn = { fg = c.yellow },

  DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and c.bg_red or c.none, fg = c.red },
  DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and c.bg_yellow or c.none, fg = c.yellow },
  DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and c.bg_purple or c.none, fg = c.purple },
  DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and c.bg_cyan or c.none, fg = c.cyan },

  DiagnosticUnderlineError = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
  DiagnosticUnderlineHint = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple },
  DiagnosticUnderlineInfo = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue },
  DiagnosticUnderlineWarn = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },
  DiagnosticUnnecessary = { fg = c.grey, fmt = cfg.diagnostics.undercurl and "undercurl" or "underline" },

  LspReferenceText = { bg = c.bg2 },
  LspReferenceWrite = { bg = c.bg2 },
  LspReferenceRead = { bg = c.bg2 },

  LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
  LspInlayHint = { fg = c.grey },
  LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.cmp = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = colors.Cyan,
  CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
  CmpItemMenu = colors.LightGrey,
  -- CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
  CmpBorder = { fg = c.bg2 },
  CmpWin = { bg = c.bg },
  CmpItemKindText = { fg = c.green },
}

hl.plugins.whichkey = {
  WhichKey = colors.Red,
  WhichKeyFloat = { bg = c.none },
  WhichKeyDesc = colors.Blue,
  WhichKeyGroup = colors.Orange,
  WhichKeySeparator = colors.Green,
  WhichKeyBorder = { fg = c.bg2 },
}

-- comment
hl.plugins.diffview = {
  DiffviewFilePanelTitle = { fg = c.blue, fmt = "bold" },
  DiffviewFilePanelCounter = { fg = c.purple, fmt = "bold" },
  DiffviewFilePanelFileName = colors.Fg,
  DiffviewNormal = hl.common.Sidebar,
  DiffviewCursorLine = hl.common.CursorLine,
  DiffviewVertSplit = hl.common.VertSplit,
  DiffviewSignColumn = hl.common.SignColumn,
  DiffviewStatusLine = hl.common.StatusLine,
  DiffviewStatusLineNC = hl.common.StatusLineNC,
  DiffviewEndOfBuffer = hl.common.Sidebar,
  DiffviewFilePanelRootPath = colors.Grey,
  DiffviewFilePanelPath = colors.Grey,
  DiffviewFilePanelInsertions = colors.Green,
  DiffviewFilePanelDeletions = colors.Red,
  DiffviewStatusAdded = colors.Green,
  DiffviewStatusUntracked = colors.Blue,
  DiffviewStatusModified = colors.Blue,
  DiffviewStatusRenamed = colors.Blue,
  DiffviewStatusCopied = colors.Blue,
  DiffviewStatusTypeChange = colors.Blue,
  DiffviewStatusUnmerged = colors.Blue,
  DiffviewStatusUnknown = colors.Red,
  DiffviewStatusDeleted = colors.Red,
  DiffviewStatusBroken = colors.Red,
}

hl.plugins.gitsigns = {
  GitSignsAdd = colors.Green,
  GitSignsAddLn = colors.Green,
  GitSignsAddNr = colors.Green,
  GitSignsChange = colors.Blue,
  GitSignsChangeLn = colors.Blue,
  GitSignsChangeNr = colors.Blue,
  GitSignsDelete = colors.Red,
  GitSignsDeleteLn = colors.Red,
  GitSignsDeleteNr = colors.Red,
  GitSignsCurrentLineBlame = { fg = c.dark_cyan, fmt = "italic" },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = hl.common.Sidebar,
  NeoTreeNormalNC = hl.common.Sidebar,
  NeoTreeEndOfBuffer = hl.common.Sidebar,
  NeoTreeVertSplit = { fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
  NeoTreeWinSeparator = { fg = c.bg1, bg = c.none },
  NeoTreeRootName = { fg = c.orange, fmt = "bold" },
  NeoTreeGitAdded = colors.Green,
  NeoTreeGitDeleted = colors.Red,
  NeoTreeGitModified = colors.Yellow,
  NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.bg2 },
  NeoTreeSymbolicLinkTarget = colors.Purple,
}

hl.plugins.neotest = {
  NeotestAdapterName = { fg = c.purple, fmt = "bold" },
  NeotestDir = colors.Cyan,
  NeotestExpandMarker = colors.Grey,
  NeotestFailed = colors.Red,
  NeotestFile = colors.Cyan,
  NeotestFocused = { fmt = "bold,italic" },
  NeotestIndent = colors.Grey,
  NeotestMarked = { fg = c.orange, fmt = "bold" },
  NeotestNamespace = colors.Blue,
  NeotestPassed = colors.Green,
  NeotestRunning = colors.Yellow,
  NeotestWinSelect = { fg = c.cyan, fmt = "bold" },
  NeotestSkipped = colors.LightGrey,
  NeotestTarget = colors.Purple,
  NeotestTest = colors.Fg,
  NeotestUnknown = colors.LightGrey,
}

hl.plugins.telescope = {
  TelescopePromptTitle = { fg = c.cyan },
  TelescopeBorder = { fg = c.bg2 },
  TelescopePromptBorder = { fg = c.bg2 },
  TelescopeResultsBorder = { fg = c.bg2 },
  TelescopePreviewBorder = { fg = c.bg2 },
  TelescopeMatching = { fg = c.orange, fmt = "bold" },
  TelescopePromptPrefix = colors.Green,
  TelescopeSelection = { bg = c.bg2 },
  TelescopeSelectionCaret = colors.Yellow,
  TelescopePromptCounter = colors.Blue,
}

hl.plugins.edgy = {
  EdgyWinbar = { bg = c.bg_d },
  EdgyTitle = { bg = c.bg_d, fg = c.purple, fmt = "bold" },
  EdgyIcon = { bg = c.dark_purple, fg = c.purple },
  EdgyIconActive = { bg = c.dark_purple, fg = c.purple },
  EdgyNormal = { bg = c.sidebar },
}

hl.plugins.ufo = {
  UfoCursorFoldedLine = { bg = c.bg2, fmt = "bold" },
  UfoFoldedBg = { bg = c.bg_purple },
}

hl.plugins.dashboard = {
  DashboardShortCut = colors.Grey,
  DashboardHeader = colors.Blue,
  DashboardCenter = colors.Grey,
  DashboardFooter = colors.Red,
}

hl.plugins.outline = {
  FocusedSymbol = { fg = c.purple, bg = c.bg2, fmt = "bold" },
  AerialLine = { fg = c.purple, bg = c.bg2, fmt = "bold" },
  SymbolsOutlineBg = { bg = c.sidebar },
}

hl.plugins.navic = {
  NavicText = { fg = c.fg, bg = c.bg_d },
  NavicSeparator = { fg = c.light_grey, bg = c.bg_d },
}

hl.plugins.trouble = {
  TroubleNormal = { bg = c.sidebar },
  TroubleNormalNC = { bg = c.sidebar },
  TroubleText = { bg = c.none },
  TroubleTextError = { fg = c.red },
  TroubleTextWarning = { fg = c.yellow },
  TroubleTextHint = { fg = c.purple },
  TroubleTextInformation = { fg = c.cyan },
  TroublePreview = { bg = c.dark_purple },
}

hl.plugins.rainbow_delimiters = {
  RainbowDelimiterRed = colors.Red,
  RainbowDelimiterYellow = colors.Yellow,
  RainbowDelimiterBlue = colors.Blue,
  RainbowDelimiterOrange = colors.Orange,
  RainbowDelimiterGreen = colors.Green,
  RainbowDelimiterViolet = colors.Purple,
  RainbowDelimiterCyan = colors.Cyan,
}

hl.plugins.indent_blankline = {
  IndentBlanklineIndent1 = colors.Blue,
  IndentBlanklineIndent2 = colors.Green,
  IndentBlanklineIndent3 = colors.Cyan,
  IndentBlanklineIndent4 = colors.LightGrey,
  IndentBlanklineIndent5 = colors.Purple,
  IndentBlanklineIndent6 = colors.Red,
  IndentBlanklineChar = { fg = c.bg2, fmt = "nocombine" },
  IndentBlanklineContextChar = { fg = c.grey, fmt = "nocombine" },
  IndentBlanklineContextStart = { sp = c.grey, fmt = "underline" },
  IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

  -- Ibl v3
  IblIndent = { fg = c.bg2, fmt = "nocombine" },
  IblWhitespace = { fg = c.grey, fmt = "nocombine" },
  IblScope = { fg = c.purple, fmt = "nocombine" },

  MiniIndentscopeSymbol = { fg = c.purple },
}

hl.plugins.illuminati = {
  IlluminatedWordText = { bg = c.bg2, fmt = "NONE" },
  IlluminatedWordRead = { bg = c.bg2, fmt = "NONE" },
  IlluminatedWordWrite = { bg = c.dark_purple, fmt = "NONE" },
}

hl.plugins.matchup = {
  MatchWord = { bg = c.dark_purple, fmt = "underline" },
  MatchParen = { fmt = "inverse" },
  MatchParenCur = { fmt = "italic,bold" },
}

hl.langs.c = {
  cInclude = colors.Blue,
  cStorageClass = colors.Purple,
  cTypedef = colors.Purple,
  cDefine = colors.Cyan,
  cTSInclude = colors.Blue,
  cTSConstant = colors.Cyan,
  cTSConstMacro = colors.Purple,
  cTSOperator = colors.Purple,
}

hl.langs.cpp = {
  cppStatement = { fg = c.purple, fmt = "bold" },
  cppTSInclude = colors.Blue,
  cppTSConstant = colors.Cyan,
  cppTSConstMacro = colors.Purple,
  cppTSOperator = colors.Purple,
}

hl.langs.css = {
  ["@variable.css"] = { fg = c.light_yellow, fmt = cfg.code_style.variables },
}

hl.langs.markdown = {
  markdownBlockquote = colors.Grey,
  markdownBold = { fg = c.none, fmt = "bold" },
  markdownBoldDelimiter = colors.Grey,
  markdownCode = colors.Green,
  markdownCodeBlock = colors.Green,
  markdownCodeDelimiter = colors.Yellow,
  markdownH1 = { fg = c.red, fmt = "bold" },
  markdownH2 = { fg = c.purple, fmt = "bold" },
  markdownH3 = { fg = c.orange, fmt = "bold" },
  markdownH4 = { fg = c.red, fmt = "bold" },
  markdownH5 = { fg = c.purple, fmt = "bold" },
  markdownH6 = { fg = c.orange, fmt = "bold" },
  markdownHeadingDelimiter = colors.Grey,
  markdownHeadingRule = colors.Grey,
  markdownId = colors.Yellow,
  markdownIdDeclaration = colors.Red,
  markdownItalic = { fg = c.none, fmt = "italic" },
  markdownItalicDelimiter = { fg = c.grey, fmt = "italic" },
  markdownLinkDelimiter = colors.Grey,
  markdownLinkText = colors.Red,
  markdownLinkTextDelimiter = colors.Grey,
  markdownListMarker = colors.Red,
  markdownOrderedListMarker = colors.Red,
  markdownRule = colors.Purple,
  markdownUrl = { fg = c.blue, fmt = "underline" },
  markdownUrlDelimiter = colors.Grey,
  markdownUrlTitleDelimiter = colors.Green,
}

hl.langs.tex = {
  latexTSInclude = colors.Blue,
  latexTSFuncMacro = { fg = c.fg, fmt = cfg.code_style.functions },
  latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
  latexTSEnvironmentName = colors.Yellow,
  texCmdEnv = colors.Cyan,
  texEnvArgName = colors.Yellow,
  latexTSTitle = colors.Green,
  latexTSType = colors.Blue,
  latexTSMath = colors.Orange,
  texMathZoneX = colors.Orange,
  texMathZoneXX = colors.Orange,
  texMathDelimZone = colors.LightGrey,
  texMathDelim = colors.Purple,
  texMathOper = colors.Red,
  texCmd = colors.Purple,
  texCmdPart = colors.Blue,
  texCmdPackage = colors.Blue,
  texPgfType = colors.Yellow,
}

hl.langs.vim = {
  vimOption = colors.Red,
  vimSetEqual = colors.Yellow,
  vimMap = colors.Purple,
  vimMapModKey = colors.Orange,
  vimNotation = colors.Red,
  vimMapLhs = colors.Fg,
  vimMapRhs = colors.Blue,
  vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
  vimCommentTitle = { fg = c.light_grey, fmt = cfg.code_style.comments },
}

local lsp_kind_icons_color = {
  Default = c.purple,
  Array = c.yellow,
  Boolean = c.orange,
  Class = c.yellow,
  Color = c.green,
  Constant = c.orange,
  Constructor = c.blue,
  Enum = c.purple,
  EnumMember = c.yellow,
  Event = c.yellow,
  Field = c.purple,
  File = c.blue,
  Folder = c.orange,
  Function = c.blue,
  Interface = c.green,
  Key = c.cyan,
  Keyword = c.cyan,
  Method = c.blue,
  Module = c.orange,
  Namespace = c.red,
  Null = c.grey,
  Number = c.orange,
  Object = c.red,
  Operator = c.red,
  Package = c.yellow,
  Property = c.cyan,
  Reference = c.orange,
  Snippet = c.red,
  String = c.green,
  Struct = c.purple,
  Text = c.Green,
  TypeParameter = c.red,
  Unit = c.green,
  Value = c.orange,
  Variable = c.purple,
  Codeium = c.yellow,
}

function M.setup()
  -- define cmp and aerial kind highlights with lsp_kind_icons_color
  for kind, color in pairs(lsp_kind_icons_color) do
    hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
    hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
    hl.plugins.navic["NavicIcons" .. kind] = { fg = color, bg = c.bg_d }
  end

  vim_highlights(hl.common)
  vim_highlights(hl.syntax)
  vim_highlights(hl.treesitter)
  if hl.lsp then
    vim_highlights(hl.lsp)
  end
  for _, group in pairs(hl.langs) do
    vim_highlights(group)
  end
  for _, group in pairs(hl.plugins) do
    vim_highlights(group)
  end

  -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
  local function replace_color(prefix, color_name)
    if not color_name then
      return ""
    end
    if color_name:sub(1, 1) == "$" then
      local name = color_name:sub(2, -1)
      color_name = c[name]
      if not color_name then
        vim.schedule(function()
          vim.notify('onedark.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "onedark.nvim" })
        end)
        return ""
      end
    end
    return prefix .. "=" .. color_name
  end

  for group_name, group_settings in pairs(vim.g.onedark_config.highlights) do
    vim.api.nvim_command(
      string.format(
        "highlight %s %s %s %s %s",
        group_name,
        replace_color("guifg", group_settings.fg),
        replace_color("guibg", group_settings.bg),
        replace_color("guisp", group_settings.sp),
        replace_color("gui", group_settings.fmt)
      )
    )
  end
end

return M
