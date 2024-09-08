local adjust_color = require("onedark.utils").adjust_color

local base_colors = {
  dark = {
    black = "#0c0e15",
    -- bg = "#141923",
    bg = "#101017",
    light_yellow = "#ffd38b",
    fg = "#9baece",
    purple = "#c75ae8",
    green = "#8bcd5b",
    orange = "#f07a65",
    blue = "#41a7fc",
    yellow = "#efbd5d",
    cyan = "#34bfd0",
    red = "#f43e5c",
    grey = "#455574",
  },
  light = {
    black = "#101012",
    bg = "#f0f0f0",

    fg = "#383a42",
    purple = "#a626a4",
    green = "#50a14f",
    orange = "#c18401",
    blue = "#4078f2",
    yellow = "#986801",
    cyan = "#0184bc",
    red = "#e45649",
    grey = "#a0a1a7",
  },
}

local extended_dark = {}
for name, val in ipairs(base_colors.dark) do
  extended_dark["darkest_"..name] = adjust_color(val, 0.3)
  extended_dark["dark_"..name] = adjust_color(val, 0.5)
  extended_dark["light_"..name] = adjust_color(val, 1.2)
end

return {
  dark = vim.tbl_deep_extend("force", base_colors.dark, extended_dark),
  light = base_colors.light,
}
