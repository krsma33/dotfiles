return function(_, opts)
  opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types
    or { "terminal", "Trouble", "qf", "Outline", "trouble" }
  table.insert(opts.open_files_do_not_replace_types, "edgy")
  opts.default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "󰁕", -- this can only be used in the git_status source
        -- Status type
        untracked = "", -- "󱄶",
        ignored = "", -- "",
        unstaged = "", -- "󰄱",
        staged = "", -- "",
        conflict = "",
      },
    },
  }

  if require("utils.path").is_windows then
    opts.filesystem = {
      -- on windows recursive delete files crash the neovim
      use_libuv_file_watcher = false,
    }
  end

  return opts
end
