local c = require("onedark.colors")
local cfg = vim.g.onedark_config
local adjust_color = require("onedark.utils").adjust_color

local colors = {
  bg = c.grey_2,
  fg = c.fg,
  red = c.red,
  green = c.green,
  yellow = c.yellow,
  blue = c.blue,
  purple = c.purple,
  cyan = c.cyan,
  gray = c.grey,
}

local one_dark = {
  inactive = {
    a = { fg = colors.gray, bg = colors.bg, gui = "bold" },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or colors.bg },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.fg, bg = adjust_color(c.grey, 0.6) },
    c = { fg = colors.fg, bg = cfg.lualine.transparent and c.none or colors.bg },
    y = { fg = colors.fg, bg = adjust_color(c.grey, 0.6) },
  },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
  insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
}
return one_dark
