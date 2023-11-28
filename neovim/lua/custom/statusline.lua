local M = {}

M.override_statusline = function(modules)
  -- Add MultiCursor modes to status line
  local function is_active()
    local ok, hydra = pcall(require, "hydra.statusline")
    return ok and hydra.is_active()
  end

  local function get_name()
    local ok, hydra = pcall(require, "hydra.statusline")
    if ok then
      return hydra.get_name()
    end
    return ""
  end

  table.insert(
    modules,
    2,
    (function()
      if is_active() then
        return "%#St_pos_text# " .. get_name()
      end
    end)()
  )
end

return M
