local colors = require("leaf.colors").setup()

local leaf = {}

leaf.normal = {
  a = { bg = colors.blue0, fg = colors.bg0 },
  b = { bg = colors.bg0, fg = colors.blue1 },
  c = { bg = colors.bg0, fg = colors.blue1 },
}

leaf.insert = {
  a = { bg = colors.green0, fg = colors.bg0 },
  b = { bg = colors.bg0, fg = colors.green1 },
  c = { bg = colors.bg0, fg = colors.green1 },
}

leaf.command = {
  a = { bg = colors.yellow0, fg = colors.bg0 },
  b = { bg = colors.bg0, fg = colors.yellow1 },
  c = { bg = colors.bg0, fg = colors.yellow1 },
}

leaf.visual = {
  a = { bg = colors.purple0, fg = colors.bg0 },
  b = { bg = colors.bg0, fg = colors.purple1 },
  c = { bg = colors.bg0, fg = colors.purple1 },
}

leaf.replace = {
  a = { bg = colors.red0, fg = colors.bg0 },
  b = { bg = colors.bg0, fg = colors.red1 },
  c = { bg = colors.bg0, fg = colors.red1 },
}

leaf.terminal = {
  a = { bg = colors.teal0, fg = colors.bg0 },
  b = { bg = colors.bg0, fg = colors.teal1 },
  c = { bg = colors.bg0, fg = colors.teal1 },
}

leaf.inactive = {
  a = { bg = colors.bg0, fg = colors.blue1 },
  b = { bg = colors.bg0, fg = colors.bg0 },
  c = { bg = colors.bg0, fg = colors.bg1 },
}

if vim.g.leaf_lualine_bold then
  for _, mode in pairs(leaf) do
    mode.a.gui = "bold"
  end
end

return leaf
