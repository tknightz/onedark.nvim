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
  LightGrey = { fg = c.grey_7 },
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
  Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg },
  Sidebar = { bg = c.bg_4 },
  Terminal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg },
  WinBar = { bg = c.bg_6 },
  WinBarNC = { bg = c.bg_6 },
  InactiveWinBar = { bg = c.bg_4, fg = c.grey, fmt = "italic" },
  EndOfBuffer = { fg = cfg.ending_tildes and c.grey_3 or c.bg, bg = cfg.transparent and c.none or c.bg0 },
  FoldColumn = { fg = c.grey, bg = c.none, fmt = "nocombine" },
  Folded = { bg = cfg.transparent and c.none or c.blue_1 },
  SignColumn = { fg = c.fg, bg = c.none, fmt = "nocombine" },
  ToolbarLine = { fg = c.fg },
  Cursor = { fmt = "reverse" },
  vCursor = { fmt = "reverse" },
  iCursor = { fmt = "reverse" },
  lCursor = { fmt = "reverse" },
  CursorIM = { fmt = "reverse" },
  CursorColumn = { bg = c.grey_3 },
  CursorLine = { bg = c.cyan_1 },
  ColorColumn = { bg = c.grey_2 },
  CursorLineNr = { fg = c.purple, fmt = "italic,bold" },
  LineNr = { fg = c.grey },
  Conceal = { fg = c.grey, bg = c.grey_3 },
  DiffAdd = { fg = c.none, bg = c.green_1 },
  DiffChange = { fg = c.none, bg = c.blue_1 },
  DiffDelete = { fg = c.none, bg = c.red_2 },
  DiffText = { fg = c.none, bg = c.blue_2 },
  DiffAdded = colors.Green,
  DiffRemoved = colors.Red,
  DiffFile = colors.Cyan,
  DiffIndexLine = colors.Grey,
  Directory = { fg = c.blue },
  ErrorMsg = { fg = c.red, fmt = "bold" },
  WarningMsg = { fg = c.yellow, fmt = "bold" },
  MoreMsg = { fg = c.blue, fmt = "italic" },
  CurSearch = { fg = c.bg, bg = c.orange },
  IncSearch = { fg = c.bg, bg = c.orange },
  Search = { fg = c.bg, bg = c.orange_7 },
  Substitute = { fg = c.bg, bg = c.green },
  MatchParen = { fg = c.none, bg = c.grey },
  NonText = { fg = c.grey, fmt = "nocombine" },
  Whitespace = { fg = c.grey_3 },
  SpecialKey = { fg = c.grey },
  Pmenu = { fg = c.fg, bg = c.blue_1 },
  PmenuSbar = { fg = c.none, bg = c.grey_3 },
  PmenuSel = { fg = c.black, bg = c.blue },
  WildMenu = { fg = c.bg, bg = c.blue },
  PmenuThumb = { fg = c.none, bg = c.grey },
  Question = { fg = c.yellow },
  SpellBad = { fg = c.none, fmt = "undercurl", sp = c.red },
  SpellCap = { fg = c.none, fmt = "undercurl", sp = c.yellow },
  SpellLocal = { fg = c.none, fmt = "undercurl", sp = c.blue },
  SpellRare = { fg = c.none, fmt = "undercurl", sp = c.purple },

  StatusLine = { fg = c.fg, bg = c.grey_2 },
  StatusLineNC = { fg = c.fg, bg = c.grey_2 },
  StatusLineTerm = { fg = c.fg, bg = c.grey_2 },
  StatusLineTermNC = { fg = c.grey, bg = c.grey_2 },

  StatusLineModeNormal = { fg = c.black, bg = c.red, fmt = "bold" },
  StatusLineModeSeparatorNormal = { fg = c.red, bg = c.grey_3 },
  StatusLineModeInsert = { fg = c.black, bg = c.blue, fmt = "bold" },
  StatusLineModeSeparatorInsert = { fg = c.blue, bg = c.grey_3 },
  StatusLineModeVisual = { fg = c.black, bg = c.purple, fmt = "bold" },
  StatusLineModeSeparatorVisual = { fg = c.purple, bg = c.grey_3 },
  StatusLineModeCommand = { fg = c.black, bg = c.orange, fmt = "bold" },
  StatusLineModeSeparatorCommand = { fg = c.orange, bg = c.grey_3 },
  StatusLineModePending = { fg = c.black, bg = c.cyan, fmt = "bold" },
  StatusLineModeSeparatorPending = { fg = c.cyan, bg = c.grey_3 },

  StatusLineTitle = { fg = c.fg, bg = c.grey_2 },

  StatusLineEncoding = { fg = c.fg, bg = c.grey_2 },

  StatusLineFiletype = { fg = c.fg, bg = c.grey_2 },
  StatusLineFiletypeSeparator = { fg = c.red, bg = c.grey_2 },

  StatusLinePosition = { fg = c.black, bg = c.red },
  StatusLinePositionSeparator = { fg = c.red, bg = c.grey_2 },

  StatusLineGit = { fg = c.green, bg = c.grey_3 },
  StatusLineGitSeparator = { fg = c.grey_3, bg = c.grey_2 },

  TabLine = { fg = c.fg, bg = c.grey_3 },
  TabLineFill = { fg = c.grey, bg = c.grey_3 },
  TabLineSel = { fg = c.bg, bg = c.fg },
  WinSeparator = { fg = c.grey_3, bg = c.none },
  VertSplit = { fg = c.grey_3, bg = c.none },
  Visual = { bg = c.blue_2 },
  VisualNOS = { fg = c.none, bg = c.blue_2, fmt = "underline" },
  QuickFixLine = { bg = c.purple_3, fmt = "italic" },
  Debug = { fg = c.yellow },
  debugPC = { fg = c.bg, bg = c.green },
  debugBreakpoint = { fg = c.bg, bg = c.red },
  ToolbarButton = { fg = c.bg, bg = c.blue_2 },
  FloatBorder = { fg = c.purple, bg = c.bg },
  NormalFloat = { fg = c.fg, bg = c.bg_7 },
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
  SpecialComment = { fg = c.grey_6, fmt = cfg.code_style.comments },
  Todo = { fg = c.red, fmt = cfg.code_style.comments },
  jsonBraces = colors.LightGrey,
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
  ["@string.special.url"] = { fg = c.purple, fmt = cfg.code_style.strings },
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

  TreesitterContext = { bg = c.cyan_1 },
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

  DiagnosticVirtualTextError = { bg = cfg.diagnostics.background and c.red_1 or c.none, fg = c.red_6 },
  DiagnosticVirtualTextWarn = { bg = cfg.diagnostics.background and c.yellow_1 or c.none, fg = c.yellow_6 },
  DiagnosticVirtualTextInfo = { bg = cfg.diagnostics.background and c.purple_1 or c.none, fg = c.purple },
  DiagnosticVirtualTextHint = { bg = cfg.diagnostics.background and c.cyan_1 or c.none, fg = c.cyan },

  DiagnosticUnderlineError = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
  DiagnosticUnderlineHint = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.cyan },
  DiagnosticUnderlineInfo = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple },
  DiagnosticUnderlineWarn = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },
  DiagnosticUnnecessary = { fg = c.grey, fmt = cfg.diagnostics.undercurl and "undercurl" or "underline" },

  LspReferenceText = { bg = c.grey_3 },
  LspReferenceWrite = { bg = c.grey_3 },
  LspReferenceRead = { bg = c.grey_3 },

  LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
  LspInlayHint = { fg = c.grey },
  LspCodeLensSeparator = { fg = c.grey },
}

hl.plugins.cmp = {
  CmpItemAbbr = colors.Fg,
  CmpItemAbbrDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  CmpItemAbbrMatch = colors.Cyan,
  CmpItemAbbrMatchFuzzy = colors.Cyan,
  CmpItemMenu = colors.LightGrey,
  CmpBorder = { fg = c.grey_3, bg = c.bg },
  CmpWin = { bg = c.bg },

  BlinkCmpLabel = colors.Fg,
  BlinkCmpLabelDeprecated = { fg = c.light_grey, fmt = "strikethrough" },
  BlinkCmpLabelMatch = colors.Cyan,
  BlinkCmpMenu = { fg = c.fg, bg = c.bg },
  BlinkCmpMenuBorder = { fg = c.purple },
  BlinkCmpMenuSelection = { bg = c.purple_2 },

  BlinkCmpDocBorder = { fg = c.orange },
  BlinkCmpGhostText = { fg = c.grey, fmt = "italic" },

  BlinkCmpSignatureHelpBorder = { fg = c.orange },
}

hl.plugins.whichkey = {
  WhichKey = colors.Red,
  WhichKeyFloat = { bg = c.none },
  WhichKeyDesc = colors.Blue,
  WhichKeyGroup = colors.Orange,
  WhichKeySeparator = colors.Green,
  WhichKeyBorder = { fg = c.purple_3 },
}

hl.plugins.bqf = {
  BqfPreviewFloat = { fg = c.fg, bg = c.bg_7 },
}

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
  GitSignsAdd = { fg = c.green_6 },
  GitSignsAddLn = { fg = c.green_6 },
  GitSignsAddNr = { fg = c.green_6 },
  GitSignsStagedAdd = { fg = c.green_3, fmt = "italic" },
  GitSignsStagedAddLn = { fg = c.green_3, fmt = "italic" },
  GitSignsStagedAddNr = { fg = c.green_3, fmt = "italic" },
  GitSignsChange = colors.Blue,
  GitSignsChangeLn = colors.Blue,
  GitSignsChangeNr = colors.Blue,
  GitSignsStagedChange = { fg = c.blue_3, fmt = "italic" },
  GitSignsStagedChangeLn = { fg = c.blue_3, fmt = "italic" },
  GitSignsStagedChangeNr = { fg = c.blue_3, fmt = "italic" },
  GitSignsDelete = colors.Red,
  GitSignsDeleteLn = colors.Red,
  GitSignsDeleteNr = colors.Red,
  GitSignsCurrentLineBlame = { fg = c.cyan_4, fmt = "italic" },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = hl.common.Sidebar,
  NeoTreeNormalNC = hl.common.Sidebar,
  NeoTreeEndOfBuffer = hl.common.Sidebar,
  NeoTreeVertSplit = { fg = c.grey_3 },
  NeoTreeWinSeparator = { fg = c.grey_3, bg = c.none },
  NeoTreeRootName = { fg = c.orange, fmt = "bold" },
  NeoTreeGitAdded = colors.Green,
  NeoTreeGitDeleted = colors.Red,
  NeoTreeGitModified = colors.Yellow,
  NeoTreeGitConflict = { fg = c.red, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.red, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.grey_3 },
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
  TelescopeBorder = { fg = c.grey_3 },
  TelescopePromptBorder = { fg = c.grey_3 },
  TelescopeResultsBorder = { fg = c.grey_3 },
  TelescopePreviewBorder = { fg = c.grey_3 },
  TelescopeMatching = { fg = c.orange, fmt = "bold" },
  TelescopePromptPrefix = colors.Green,
  TelescopeSelection = { bg = c.grey_3 },
  TelescopeSelectionCaret = colors.Yellow,
  TelescopePromptCounter = colors.Blue,
}

hl.plugins.edgy = {
  EdgyWinbar = { bg = c.grey_2 },
  EdgyTitle = { bg = c.grey_2, fg = c.purple, fmt = "bold" },
  EdgyIcon = { bg = c.purple_3, fg = c.purple },
  EdgyIconActive = { bg = c.purple_3, fg = c.purple },
  EdgyNormal = { bg = c.bg_4 },
}

hl.plugins.ufo = {
  UfoCursorFoldedLine = { bg = c.grey_3, fmt = "bold" },
  UfoFoldedBg = { bg = c.purple_1 },
}

hl.plugins.dashboard = {
  DashboardShortCut = colors.Grey,
  DashboardHeader = colors.Blue,
  DashboardCenter = colors.Grey,
  DashboardFooter = colors.Red,
}

hl.plugins.outline = {
  FocusedSymbol = { fg = c.purple, bg = c.grey_3, fmt = "bold" },
  AerialLine = { fg = c.purple, bg = c.grey_3, fmt = "bold" },
  SymbolsOutlineBg = { bg = c.bg_4 },
  OutlineCurrent = { fg = c.green, bg = c.none, fmt = "italic" },
}

hl.plugins.navic = {
  NavicText = { fg = c.fg, bg = c.bg_4 },
  NavicSeparator = { fg = c.light_grey, bg = c.bg_4 },
}

hl.plugins.trouble = {
  TroubleNormal = { bg = c.bg_4 },
  TroubleNormalNC = { bg = c.bg_4 },
  TroubleText = { bg = c.none },
  TroubleTextError = { fg = c.red },
  TroubleTextWarning = { fg = c.yellow },
  TroubleTextHint = { fg = c.purple },
  TroubleTextInformation = { fg = c.cyan },
  TroublePreview = { bg = c.purple_2 },
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
  IndentBlanklineChar = { fg = c.grey_3, fmt = "nocombine" },
  IndentBlanklineContextChar = { fg = c.grey, fmt = "nocombine" },
  IndentBlanklineContextStart = { sp = c.grey, fmt = "underline" },
  IndentBlanklineContextSpaceChar = { fmt = "nocombine" },

  -- Ibl v3
  IblIndent = { fg = c.grey_3, fmt = "nocombine" },
  IblWhitespace = { fg = c.grey, fmt = "nocombine" },
  IblScope = { fg = c.purple, fmt = "nocombine" },

  MiniIndentscopeSymbol = { fg = c.purple },
  IndentLine = { fg = c.grey_3, fmt = "nocombine" },
  IndentLineCurrent = { fg = c.purple, fmt = "nocombine" },
}

hl.plugins.snacks = {
  SnacksIndent = { fg = c.grey_3, fmt = "nocombine" },
  SnacksIndentScope = { fg = c.purple, fmt = "nocombine" },
  SnacksDashboardSpecial = { fg = c.blue, fmt = "bold" },
  SnacksDashboardFile = { fg = c.blue, fmt = "bold" },
}

hl.plugins.illuminati = {
  IlluminatedWordText = { bg = c.grey_3, fmt = "NONE" },
  IlluminatedWordRead = { bg = c.grey_3, fmt = "NONE" },
  IlluminatedWordWrite = { bg = c.purple_2, fmt = "NONE" },
}

hl.plugins.matchup = {
  MatchWord = { bg = c.purple_2, fmt = "underline" },
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
  ["@variable.css"] = { fg = c.yellow_7, fmt = cfg.code_style.variables },
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

  ["@checked_list_item.markdown"] = { fg = c.grey, fmt = "strikethrough" },
  ["@markup.list.checked.markdown"] = { fg = c.grey, fmt = "strikethrough" },
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

hl.plugins.misc = {
  Hlargs = { fg = c.red_7, fmt = "bold,italic" },
  YankyYanked = { bg = c.green_2, fmt = "italic" },
  YankyPut = { bg = c.purple_2, fmt = "bold" },
}

hl.plugins.notify = {
  NotifyERRORBorder = { fg = c.red_1 },
  NotifyWARNBorder = { fg = c.yellow_1 },
  NotifyINFOBorder = { fg = c.green_1 },
  NotifyDEBUGBorder = { fg = c.grey },
  NotifyTRACEBorder = { fg = c.grey },
  NotifyERRORIcon = { fg = c.red },
  NotifyWARNIcon = { fg = c.yellow },
  NotifyINFOIcon = { fg = c.green },
  NotifyDEBUGIcon = { fg = c.grey },
  NotifyTRACEIcon = { fg = c.purple },
  NotifyERRORTitle = { fg = c.red },
  NotifyWARNTitle = { fg = c.yellow },
  NotifyINFOTitle = { fg = c.green },
  NotifyDEBUGTitle = { fg = c.grey },
  NotifyTRACETitle = { fg = c.purple },
}

hl.plugins.notify = {
  NotifyERRORBorder = { fg = c.red_2 },
  NotifyWARNBorder = { fg = c.yellow_2 },
  NotifyINFOBorder = { fg = c.green_2 },
  NotifyDEBUGBorder = { fg = c.grey },
  NotifyTRACEBorder = { fg = c.grey },
  NotifyERRORIcon = { fg = c.red },
  NotifyWARNIcon = { fg = c.yellow },
  NotifyINFOIcon = { fg = c.green },
  NotifyDEBUGIcon = { fg = c.grey },
  NotifyTRACEIcon = { fg = c.purple },
  NotifyERRORTitle = { fg = c.red },
  NotifyWARNTitle = { fg = c.yellow },
  NotifyINFOTitle = { fg = c.green },
  NotifyDEBUGTitle = { fg = c.grey },
  NotifyTRACETitle = { fg = c.purple },
}

local lsp_kind_icons_color = {
  Default = "purple",
  Array = "yellow",
  Boolean = "orange",
  Class = "yellow",
  Color = "green",
  Constant = "orange",
  Constructor = "blue",
  Enum = "purple",
  EnumMember = "yellow",
  Event = "yellow",
  Field = "purple",
  File = "blue",
  Folder = "orange",
  Function = "blue",
  Interface = "green",
  Key = "cyan",
  Keyword = "cyan",
  Method = "blue",
  Module = "orange",
  Namespace = "red",
  Null = "grey",
  Number = "orange",
  Object = "red",
  Operator = "red",
  Package = "yellow",
  Property = "cyan",
  Reference = "orange",
  Snippet = "red",
  String = "green",
  Struct = "purple",
  Text = "green",
  TypeParameter = "red",
  Unit = "green",
  Value = "orange",
  Variable = "purple",
  Codeium = "yellow",
}

function M.setup()
  -- define cmp and aerial kind highlights with lsp_kind_icons_color
  for kind, color in pairs(lsp_kind_icons_color) do
    hl.plugins.cmp["CmpItemKind" .. kind] = { fg = c[color], fmt = cfg.cmp_itemkind_reverse and "reverse" }
    hl.plugins.cmp["BlinkCmpKind" .. kind] = { fg = c[color], fmt = cfg.cmp_itemkind_reverse and "reverse" }
    hl.plugins.cmp["BlinkCmpKindText" .. kind] = { fg = c[color.."_4"], fmt = cfg.cmp_itemkind_reverse and "reverse" }
    hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = c[color] }
    hl.plugins.navic["NavicIcons" .. kind] = { fg = c[color], bg = c.bg_4 }
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
