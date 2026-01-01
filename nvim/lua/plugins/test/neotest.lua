return {
  adapters = {
    ["neotest-vstest"] = {
      dap_settings = {
        type = "netcoredbg"
      },
    },
  },
  summary = {
    mappings = {
      jumpto = { "i", "l" },
    },
  },
}
