-- load options before lazy
-- this is needed to make sure options will be correctly applied
-- after installing missing plugins
require("config.options")

-- make sure to set `mapleader` before lazy so your mappings are correct
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
        -- load mappings
        require("config.mappings")
        -- load statusline
        require("config.statusline")
    end,
})

-- load commands and autocmds
require("config.commands")

-- load lazy.nvim
require("config.lazy")
