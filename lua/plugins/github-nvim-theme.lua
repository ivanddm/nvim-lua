return {
  "projekt0n/github-nvim-theme",
  lazy = true,
  config = function()
    require("github-theme").setup({
      options = {
        hide_end_of_buffer = false,
        darken = {
          floats = false,
          sidebars = {
            enabled = true,
            list = { "qf", "netrw", "neotree" }, -- default is {}
          },
        },
      },
      groups = {
        github_light = {
          StatusLine = { bg = "#F1F3F5" },
          -- StatusLine = { bg = "NONE", style = "underline" },
          Comment = { fg = "#6A737D" },
          Delimiter = { fg = "#24292F" }, -- for punctuation ',' '.', etc
          LineNr = { fg = "#BFC0C1" },
          CursorLine = { bg = "#F6F8FA" },
          EndOfBuffer = { fg = "#EDEFF1" },
          NeoTreeWinSeparator = { fg = "#FFFFFF" },
          NeoTreeCursorLine = { bg = "#EDEFF1" },
          TreesitterContext = { bg = "#FFFFFF" },
          TreesitterContextBottom = { underline = true, sp = "#24292F" },
          TelescopeNormal = { bg = "#F3F5F7" },
          TelescopeBorder = { fg = "#F3F5F7", bg = "#F3F5F7" },
          TelescopeSelection = { bg = "#EDEFF1" },
          TelescopeResultsBorder = { fg = "#F3F5F7", bg = "#F3F5F7" },
          TelescopePreviewTitle = { fg = "#F3F5F7", bg = "#18654B" },
          TelescopePreviewBorder = { fg = "#F3F5F7", bg = "#F3F5F7" },
          TelescopePromptNormal = { bg = "#EDEFF1" },
          TelescopePromptTitle = { fg = "#F3F5F7", bg = "#DE2C2E" },
          TelescopePromptPrefix = { fg = "#DE2C2E", bg = "#EDEFF1" },
          TelescopePromptBorder = { fg = "#EDEFF1", bg = "#EDEFF1" },
        },
      },
    })
  end,
}
-- -- if changing background to something else such as #FAFAFA
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#EFF0F2" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#E7EAF0" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#F3F4F6" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#F3F4F6" })
-- vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#E2E5EA" })
-- vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#F3F4F6" })
-- vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#F3F4F6", bg = "#F3F4F6" })
