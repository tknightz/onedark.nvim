local M = {}

M.adjust_color = function(color, factor)
  local r = tonumber(color:sub(2, 3), 16)
  local g = tonumber(color:sub(4, 5), 16)
  local b = tonumber(color:sub(6, 7), 16)

  r = math.floor(r * factor)
  g = math.floor(g * factor)
  b = math.floor(b * factor)

  if r > 255 then
    r = 255
  end
  if g > 255 then
    g = 255
  end
  if b > 255 then
    b = 255
  end

  return string.format("#%02X%02X%02X", r, g, b)
end

M.blend_colors = function(color1, color2, ratio)
  local _ratio = ratio ~= nil and ratio or 0.5

  local r1 = tonumber(color1:sub(2, 3), 16)
  local g1 = tonumber(color1:sub(4, 5), 16)
  local b1 = tonumber(color1:sub(6, 7), 16)

  local r2 = tonumber(color2:sub(2, 3), 16)
  local g2 = tonumber(color2:sub(4, 5), 16)
  local b2 = tonumber(color2:sub(6, 7), 16)

  local r = math.floor(r1 + (r2 - r1) * _ratio)
  local g = math.floor(g1 + (g2 - g1) * _ratio)
  local b = math.floor(b1 + (b2 - b1) * _ratio)

  return string.format("#%02X%02X%02X", r, g, b)
end

return M
