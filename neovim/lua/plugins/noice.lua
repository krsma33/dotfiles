return {
  "folke/noice.nvim",
  event = "VimEnter",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
