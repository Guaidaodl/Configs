return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            { "<leader>lp", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "document diagnostics" },
            { "<leader>lP", "<cmd>Trouble diagnostics toggle<CR>",              desc = "workspace diagnostics" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            -- Inject cmp capabilities into all LSP servers
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                    },
                },
            })
            vim.lsp.enable("lua_ls")

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local buf = args.buf
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
                    end
                    map("<leader>ld", vim.lsp.buf.definition,                              "definition")
                    map("<leader>lD", vim.lsp.buf.declaration,                             "declaration")
                    map("<leader>lh", vim.lsp.buf.hover,                                   "hover")
                    map("<leader>lr", vim.lsp.buf.rename,                                  "rename")
                    map("<leader>lR", vim.lsp.buf.references,                              "references")
                    map("<leader>ls", vim.lsp.buf.signature_help,                          "signature")
                    map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "format")
                    map("<F2>",       vim.lsp.buf.rename,                                  "rename")
                end,
            })
        end,
    },
}
