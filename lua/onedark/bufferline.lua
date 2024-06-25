local colors = require("onedark.colors")

local preset = {
  separator = colors.sidebar,
  modified = colors.green,
  duplicate = colors.bg_yellow,
  warning = colors.dark_yellow,
  hint = colors.purple,
  info = colors.dark_cyan,
  error = colors.dark_red,
  indicator = colors.red,
}

local colors = {
  normal = { fg = colors.grey, bg = colors.bg_d },
  visible = { fg = colors.light_grey, bg = colors.bg1 },
  selected = { fg = colors.fg, bg = colors.bg2 },
}

local highlights = {
  fill = { bg = preset.separator },
  background = { italic = true, nocombine = true },

  buffer_visible = { italic = true },
  buffer_selected = { bold = true, italic = false },

  tab = { italic = true },
  tab_selected = { bold = true, italic = false },

  tab_separator = { bg = preset.separator, fg = preset.separator },
  tab_separator_selected = { bg = preset.separator, fg = preset.separator },

  separator = { fg = preset.separator },
  separator_selected = { fg = preset.separator },
  separator_visible = { fg = preset.separator },

  modified = { fg = preset.modified },
  modified_selected = { fg = preset.modified },
  modified_visible = { fg = preset.modified },

  duplicate = { fg = preset.duplicate },
  duplicate_selected = { fg = preset.duplicate },
  duplicate_visible = { fg = preset.duplicate },

  warning = { fg = preset.warning, bold = true },
  warning_visible = { fg = preset.warning, italic = true },
  warning_selected = { fg = preset.warning, italic = true },
  warning_diagnostic = { fg = preset.warning, italic = false },
  warning_diagnostic_visible = { fg = preset.warning },
  warning_diagnostic_selected = { fg = preset.warning, italic = false },

  info = { fg = preset.info, bold = true },
  info_visible = { fg = preset.info, italic = true },
  info_selected = { fg = preset.info },
  info_diagnostic = { fg = preset.info, italic = false },
  info_diagnostic_visible = { fg = preset.info },
  info_diagnostic_selected = { fg = preset.info, italic = false },

  hint = { fg = preset.hint, bold = true },
  hint_visible = { fg = preset.hint, italic = true, bold = true },
  hint_selected = { fg = preset.hint },
  hint_diagnostic = { fg = preset.hint, italic = false },
  hint_diagnostic_visible = { fg = preset.hint },
  hint_diagnostic_selected = { fg = preset.hint, italic = false },

  error = { fg = preset.error, bold = true },
  error_visible = { fg = preset.error, italic = true },
  error_selected = { fg = preset.error, bold = true },
  error_diagnostic = { fg = preset.error, italic = false },
  error_diagnostic_visible = { fg = preset.error },
  error_diagnostic_selected = { fg = preset.error, italic = false, bold = true },

  indicator_visible = { sp = preset.indicator },
  indicator_selected = { sp = preset.indicator },
}

local result = {}

for key, val in pairs(highlights) do
  local to_set_colors = {}
  if key:find("visible") then
    to_set_colors = vim.tbl_extend("keep", val, colors.visible)
  elseif key:find("selected") then
    to_set_colors = vim.tbl_extend("keep", val, colors.selected, { sp = preset.indicator })
  else
    to_set_colors = vim.tbl_extend("keep", val, colors.normal)
  end

  -- set sp colors
  -- to_set_colors = vim.tbl_extend("keep", to_set_colors, { sp = preset.indicator })
  result[key] = to_set_colors
end

return result
