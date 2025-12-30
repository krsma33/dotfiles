return {
  transparent = true,
  contrast = "low",
  underlineStyle = "undercurl",
  overrides = {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none", fg = "#5292c6" },
    Comment = { fg = "#5a5859" },
    CursorLine = { bg = "#20272c" },
    TelescopeSelection = { link = "CursorLine" },
    Separator = { bg = "none" },
    TabLineFill = { bg = "none" },
    ColorColumn = { bg = "#151a1e", fg = "#729b79" },
    -- LSP
    LspReferenceText = { link = "Substitute" },
    -- LspReferenceText = { link = "Search" },
    -- LspReferenceText = { link = "CurSearch" },
    -- Cmp
    CmpDocumentationCustom = { bg = "#1d1c1d" },
    -- NeoTest
    NeotestAdapterName = { link = "PreProc" },
    NeotestDir = { link = "Directory" },
    NeotestFile = { link = "Type" },
    NeotestNamespace = { link = "Keyword" },
    -- Snacks
    SnacksPickerListCursorLine = { link = "CursorLine" },
    -- Satellite
    SatelliteBackground = { link = "ColorColumn" },
  },
  colors = { bg0 = "#14191f" },
}
