local M = {}

M.lsp_opts = {
    signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    },

    diagnostics = {
        virtual_text = { spacing = 4, prefix = "●" },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    },

    servers = {
        jsonls = require("plugins.lsp.settings.jsonls"),
        lua_ls = require("plugins.lsp.settings.lua_ls"),
        pyright = require("plugins.lsp.settings.pyright"),
        sqlls = require("plugins.lsp.settings.sqls"),
        cssls = require("plugins.lsp.settings.cssls"),
        solargraph = require("plugins.lsp.settings.solargraph"),
        tailwindcss = require("plugins.lsp.settings.tailwindcss"),
    },

    setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,

        -- rust_analyzer
        rust_analyzer = function()
            local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
            local codelldb_adapter = {
                type = "server",
                port = "${port}",
                executable = {
                    command = mason_path .. "bin/codelldb",
                    args = { "--port", "${port}" },
                },
            }

            require("rust-tools").setup({
                tools = {
                    inlay_hints = {
                        show_parameter_hints = true,
                        parameter_hints_prefix = "<- ",
                        other_hints_prefix = "=> ",
                    },
                    on_initialized = function()
                        vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "CursorHold", "InsertLeave" }, {
                            pattern = { "*.rs" },
                            callback = function()
                                local _, _ = pcall(vim.lsp.codelens.refresh)
                            end,
                        })
                    end,
                },
                dap = {
                    adapter = codelldb_adapter,
                },
                server = {
                    on_attach = function(client, bufnr)
                        require("plugins.lsp.handlers").on_attach(client, bufnr)
                        local rt = require("rust-tools")
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                    end,

                    capabilities = require("cmp_nvim_lsp").default_capabilities(
                        vim.lsp.protocol.make_client_capabilities()
                    ),
                    settings = {
                        ["rust-analyzer"] = {
                            lens = {
                                enable = true,
                            },
                            checkOnSave = {
                                enable = true,
                                command = "clippy",
                            },
                        },
                    },
                },
            })
            return true
        end,

        -- jdtls
        jdtls = function()
            return true
        end,
    },
}

function M.lsp_config(opts)
    for _, sign in ipairs(opts.signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
    vim.diagnostic.config(opts.diagnostics)

    -- Comment out if using noice.nvim
    -- -- hover, signatureHelp, and Lsp floating window border
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --     border = "rounded",
    -- })
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    --     border = "rounded",
    -- })

    require("lspconfig.ui.windows").default_options.border = "rounded"

    local servers = opts.servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    capabilities.workspace = {
        didChangeWatchedFiles = {
            dynamicRegistration = true,
        },
    }

    local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
            on_attach = require("plugins.lsp.handlers").on_attach,
            capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
            if opts.setup[server](server, server_opts) then
                return
            end
        elseif opts.setup["*"] then
            if opts.setup["*"](server, server_opts) then
                return
            end
        end
        require("lspconfig")[server].setup(server_opts)
    end

    -- temp fix for lspconfig rename
    -- https://github.com/neovim/nvim-lspconfig/pull/2439
    local mappings = require("mason-lspconfig.mappings.server")
    if not mappings.lspconfig_to_package.lua_ls then
        mappings.lspconfig_to_package.lua_ls = "lua-language-server"
        mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
    end

    local mlsp = require("mason-lspconfig")
    local available = mlsp.get_available_servers()

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
        if server_opts then
            server_opts = server_opts == true and {} or server_opts
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(available, server) then
                setup(server)
            else
                ensure_installed[#ensure_installed + 1] = server
            end
        end
    end

    require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup_handlers({ setup })

    -- Convert JSON filetype to JSON with comments (jsonc)
    vim.cmd([[
                    augroup jsonFtdetect
                    autocmd!
                    autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
                    augroup END
                    ]])

    require("lspconfig").sourcekit.setup({
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = capabilities,
        filetypes = { "swift" },
    })
end

return M