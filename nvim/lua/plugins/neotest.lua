return {
  {
    "Nsidorenco/neotest-vstest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "Nsidorenco/neotest-vstest",
    },
    opts = require("plugins.test.neotest"),
    discovery = {
      enabled = true,
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
  },
}
