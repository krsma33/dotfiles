return {
  appearance = {
    -- sets the fallback highlight groups to nvim-cmp's highlight groups
    -- useful for when your theme doesn't support blink.cmp
    -- will be removed in a future release, assuming themes add support
    use_nvim_cmp_as_default = true,
    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
  },
  completion = {
    accept = {
      -- experimental auto-brackets support
      auto_brackets = {
        enabled = true,
      },
    },
    trigger = {
      show_in_snippet = false
    },
    menu = {
      draw = {
        -- Left and right padding, optionally { left, right } for different padding on each side
        padding = { 1, 0 },
        -- Gap between columns
        gap = 1,
        -- Use treesitter to highlight the label text of completions from these sources
        treesitter = { "lsp" },
        -- Components to render, grouped by column
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = {
      enabled = false,
    },
  },

  sources = {
    compat = {},
    default = { "lsp", "path", "snippets", "buffer" },
    cmdline = {},
  },
  keymap = {
    preset = "super-tab"
  },
}
