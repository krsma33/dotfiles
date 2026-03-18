return {
  transparent = true,
  contrast = "low",
  underlineStyle = "undercurl",
  overrides = {
    NormalFloat = { bg = "none" },
    -- FloatBorder = { fg = "#2a2a37", bg = "none" },
    -- FloatBorder = { link = "Info" },
    -- FloatBorder = { link = "Note" },
    FloatBorder = { link = "Directory" },
    Comment = { fg = "#5a5859" },
    CursorLine = { bg = "#20272c" },
    TelescopeSelection = { link = "CursorLine" },
    Separator = { fg = "#2a2a37", bg = "none" },
    -- Separator = { link = "FloatBorder" },
    SnacksIndent = { fg = "#2a2a37" },
    SnacksPickerTree = { link = "SnacksIndent" },
    LineNr = { fg = "#363646" },
    TabLineFill = { bg = "none" },
    olorColumn = { bg = "#151a1e", fg = "#729b79" },
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
    -- Diff
    DiffChange = { bg = "#0f131a" },
    SnacksDiffContextLineNr = { bg = "#0f131a", fg = "#363646" },
    DiffAdd = { bg = "#0f131a", fg = "#47b874" },
    DiffDelete = { bg = "#0f131a", fg = "#ff0066" },
  },
  colors = { bg0 = "#14191f" },
}
