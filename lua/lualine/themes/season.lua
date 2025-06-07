local colors = require('season.colors')

local season = {
  visual = {
    a = { fg = colors.white, bg = colors.magenta, gui = 'bold' },
    b = { fg = colors.magenta, bg = colors.white },
  },
  replace = {
    a = { fg = colors.white, bg = colors.brightMagenta, gui = 'bold' },
    b = { fg = colors.brightMagenta, bg = colors.white },
  },
  inactive = {
    a = { fg = colors.black, bg = colors.white, gui = 'bold' },
    k = { fg = colors.black, bg = colors.white },
    c = { fg = colors.black, bg = colors.white },
  },
  normal = {
    a = { fg = colors.white, bg = colors.brightGreen, gui = 'bold' },
    b = { fg = colors.brightGreen, bg = colors.white },
    c = { fg = colors.black, bg = colors.white },
  },
  insert = {
    a = { fg = colors.white, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.blue, bg = colors.white },
  },
  command = {
    a = { fg = colors.white, bg = colors.orange, gui = 'bold' },
    b = { fg = colors.orange, bg = colors.white },
  },
  terminal = {
    a = { fg = colors.white, bg = colors.brightRed, gui = 'bold' },
    b = { fg = colors.brightRed, bg = colors.white },
  },
}

return season
