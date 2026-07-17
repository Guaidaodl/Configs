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
            vim.filetype.add({
                extension = {
                    jinja = "jinja",
                    jinja2 = "jinja",
                    j2 = "jinja",
                },
            })

            vim.diagnostic.config({
                virtual_text = {
                    spacing = 2,
                    source = "if_many",
                    prefix = "●",
                },
            })

            -- 为所有 LSP 注入 cmp capabilities
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            local function get_python_path(root_dir)
                local candidates = {
                    root_dir .. "/.venv/bin/python",
                    root_dir .. "/venv/bin/python",
                }

                for _, path in ipairs(candidates) do
                    if vim.fn.executable(path) == 1 then
                        return path
                    end
                end

                local python3 = vim.fn.exepath("python3")
                if python3 ~= "" then
                    return python3
                end

                return "python3"
            end

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
            vim.lsp.config("pyright", {
                before_init = function(_, config)
                    local root_dir = config.root_dir or vim.fn.getcwd()

                    config.settings = config.settings or {}
                    config.settings.python = config.settings.python or {}
                    config.settings.python.pythonPath = get_python_path(root_dir)
                end,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })
            vim.lsp.enable("pyright")
            vim.lsp.enable("jsonls")
            vim.lsp.enable("taplo")
            vim.lsp.enable("jinja_lsp")

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
                    if vim.g.neovide then
                        map("<D-LeftMouse>", vim.lsp.buf.definition, "definition")
                    end
                end,
            })
        end,
    },
}
