return {
  "folke/flash.nvim",
  opts = {
    highlight = {
      -- show a backdrop with hl FlashBackdrop
      backdrop = true,
      -- Highlight the search matches
      matches = true,
      -- extmark priority
      priority = 5000,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "FlashLabelCustom",
      },
    },
    modes = {
      -- disable regular search (use <c-s> to enable when needed)
      search = {
        enabled = false
      }
    },
  },
}
