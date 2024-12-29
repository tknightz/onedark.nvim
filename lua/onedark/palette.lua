local adjust_color = require("onedark.utils").adjust_color

local base_colors = {
  dark = {
    bg = "#101017",
    fg = "#9baece",
    black = "#0c0e15",
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
for name, val in pairs(base_colors.dark) do
  extended_dark[name.."_1"] = adjust_color(val, 0.23)
  extended_dark[name.."_2"] = adjust_color(val, 0.4)
  extended_dark[name.."_3"] = adjust_color(val, 0.6)
  extended_dark[name.."_4"] = adjust_color(val, 0.8)
  extended_dark[name.."_6"] = adjust_color(val, 1.2)
  extended_dark[name.."_7"] = adjust_color(val, 1.5)
end

local extended_light = {}
for name, val in pairs(base_colors.light) do
  extended_light[name.."_1"] = adjust_color(val, 0.25)
  extended_light[name.."_2"] = adjust_color(val, 0.4)
  extended_light[name.."_3"] = adjust_color(val, 0.6)
  extended_light[name.."_4"] = adjust_color(val, 0.8)
  extended_light[name.."_6"] = adjust_color(val, 1.2)
  extended_light[name.."_7"] = adjust_color(val, 1.5)
end

return {
  dark = vim.tbl_deep_extend("force", base_colors.dark, extended_dark),
  light = vim.tbl_deep_extend("force", base_colors.light, extended_light),
}
