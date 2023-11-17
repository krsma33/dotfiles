local M = {}

local cmp = require "cmp"

M.opts = function()
  local conf = require "plugins.configs.cmp"
  table.insert(conf.sources, { name = "crates" })

  for k, _ in pairs(conf.mapping) do
    if k == "<C-e>" then
      conf.mapping[k] = cmp.mapping.abort()
    end
  end

  return conf
end

return M
