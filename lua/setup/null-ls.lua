-- "jose-elias-alvarez/null-ls.nvim"

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.prettier.with({
			extra_args = { "--single-quote", "--jsx-single-quote" },
			disabled_filetypes = { "markdown" },
		}),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.flake8,
		-- diagnostics.vale,
		-- diagnostics.golangci_lint,
		-- For revive, there is a ~/revive.toml config file to exclude linting rules
		diagnostics.revive,
		formatting.goimports,
		-- sqlfluff: extra config option set in ~/.sqlfluff
		-- formatting.sql_formatter.with({ extra_args = { "--keywordCase", "upper" } }),
		formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" },
		}),
		formatting.beautysh.with({
			extra_args = { "--indent-size", "2" },
		}),
	},
})
