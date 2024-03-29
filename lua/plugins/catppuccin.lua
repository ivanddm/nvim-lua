return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  build = ":CatppuccinCompile",
  opts = function()
    -- local flavour = "macchiato"
    local flavour = "mocha"
    local cp = require("catppuccin.palettes").get_palette(flavour)
    return {
      -- transparent_background = true,
      styles = {
        functions = { "italic" },
        keywords = { "italic" },
        conditionals = {},
      },
      integrations = {
        native_lsp = {
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
      custom_highlights = {
        TSParameter = { fg = cp.maroon, style = {} },
        ["@parameter"] = { fg = cp.maroon, style = {} },
        TSInclude = { fg = cp.mauve, style = {} },
        ["@include"] = { fg = cp.mauve, style = {} },
        ["@namespace"] = { fg = cp.blue, style = {} },
        TSNamespace = { fg = cp.blue, style = {} },
        -- StatusLine = { bg = cp.mantle },
        NeoTreeNormal = { bg = cp.mantle },
        NeoTreeNormalNC = { bg = cp.mantle },
        NotifyBackground = { bg = "#000000" },
        IblScope = { fg = cp.mauve },
        TreesitterContext = { bg = cp.base },
        TreesitterContextLineNumber = { bg = cp.base },
        TreesitterContextBottom = { style = { "underline" }, sp = cp.mauve },
        TelescopeNormal = { bg = cp.mantle },
        TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
        TelescopeSelection = { bg = cp.surface0 },
        TelescopeResultsBorder = { fg = cp.mantle, bg = cp.mantle },
        TelescopePreviewTitle = { fg = cp.mantle, bg = cp.green },
        TelescopePreviewBorder = { fg = cp.mantle, bg = cp.mantle },
        TelescopePromptNormal = { bg = cp.surface0 },
        TelescopePromptTitle = { fg = cp.mantle, bg = cp.red },
        TelescopePromptPrefix = { fg = cp.red, bg = cp.surface0 },
        TelescopePromptBorder = { fg = cp.surface0, bg = cp.surface0 },
      },
    }
  end,
}

-- mocha = {
--   rosewater = "#f5e0dc",
--   flamingo = "#f2cdcd",
--   pink = "#f5c2e7",
--   mauve = "#cba6f7",
--   red = "#f38ba8",
--   maroon = "#eba0ac",
--   peach = "#fab387",
--   yellow = "#f9e2af",
--   green = "#a6e3a1",
--   teal = "#94e2d5",
--   sky = "#89dceb",
--   sapphire = "#74c7ec",
--   blue = "#89b4fa",
--   lavender = "#b4befe",
--   text = "#cdd6f4",
--   subtext1 = "#bac2de",
--   subtext0 = "#a6adc8",
--   overlay2 = "#9399b2",
--   overlay1 = "#7f849c",
--   overlay0 = "#6c7086",
--   surface2 = "#585b70",
--   surface1 = "#45475a",
--   surface0 = "#313244",
--   base = "#1e1e2e",
--   mantle = "#181825",
--   crust = "#11111b",
-- }
