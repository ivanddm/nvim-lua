-- "voldikss/vim-floaterm"

local function calcFloatSize()
	return {
		width = math.min(math.ceil(vim.fn.winwidth(0) * 0.9), 140),
		height = math.min(math.ceil(vim.fn.winheight(0) * 0.9), 35),
	}
end

local function recalcFloatermSize()
	vim.g.floaterm_width = calcFloatSize().width
	vim.g.floaterm_height = calcFloatSize().height
end

vim.api.nvim_create_augroup("floaterm", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
	pattern = { "*" },
	callback = recalcFloatermSize,
	group = "floaterm",
})

vim.g.floaterm_width = calcFloatSize().width
vim.g.floaterm_height = calcFloatSize().height

vim.api.nvim_set_keymap("n", ",l", ":Lf<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "-", ":Lf<cr>", { noremap = true, silent = true })
-- vim.g.lf_replace_netrw = 1 -- Open lf when vim opens a directory
