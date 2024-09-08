local c = require('onedark.colors')
local adjust_color = require("onedark.utils").adjust_color

local tkbarbecue = {}

tkbarbecue.normal = { bg = adjust_color(c.grey, 0.4) }

return tkbarbecue
