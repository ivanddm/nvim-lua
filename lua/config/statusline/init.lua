local c = require("config.statusline.components")

local modes = {
    n = "RW",
    no = "RO",
    v = "**",
    V = "**",
    ["\022"] = "**",
    s = "S",
    S = "SL",
    ["\019"] = "SB",
    i = "**",
    ic = "**",
    R = "RA",
    Rv = "RV",
    c = "VX",
    cv = "VX",
    ce = "EX",
    r = "r",
    rm = "r",
    ["r?"] = "r",
    ["!"] = "!",
    t = "",
}

-- statusline highlight groups based on nvim-nyoom and oxocarbon
vim.api.nvim_set_hl(0, "StatusReplace", { fg = "#161616", bg = "#3ddbd9" })
vim.api.nvim_set_hl(0, "StatusInsert", { fg = "#161616", bg = "#ff7eb6" })
vim.api.nvim_set_hl(0, "StatusVisual", { fg = "#161616", bg = "#be95ff" })
vim.api.nvim_set_hl(0, "StatusTerminal", { fg = "#161616", bg = "#33b1ff" })
vim.api.nvim_set_hl(0, "StatusNormal", { fg = "#161616", bg = "#82cfff" })
vim.api.nvim_set_hl(0, "StatusCommand", { fg = "#161616", bg = "#42be65" })
vim.api.nvim_set_hl(0, "StatusLineDiagnosticWarn", { fg = "#be95ff", bold = true })
vim.api.nvim_set_hl(0, "StatusLineDiagnosticError", { fg = "#3ddbd9", bold = true })

function Status_line()
    local statusline = ""
    statusline = c.color() .. string.format(" %s ", modes[vim.api.nvim_get_mode().mode]):upper()
    statusline = statusline .. c.get_fileinfo()
    statusline = statusline .. c.get_git_status()
    statusline = statusline .. c.get_bufnr()
    statusline = statusline .. c.python_env()
    statusline = statusline .. "%="
    statusline = statusline .. c.get_lsp_diagnostic()
    statusline = statusline .. c.getWords()
    statusline = statusline .. c.get_filetype()
    -- statusline = statusline .. c.get_dir()
    statusline = statusline .. c.get_searchcount()

    return statusline
end

vim.o.statusline = "%!v:lua.Status_line()"