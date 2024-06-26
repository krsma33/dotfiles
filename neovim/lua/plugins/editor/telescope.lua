return {
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        prompt_position = "top",
      },
    },
    mappings = {
      i = {
        ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
      },
    },
    preview = {
      hide_on_startup = true,
    },
  },
}
