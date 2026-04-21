return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
        keys = {
            { "<F2>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
            { "<leader>fe", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal current file" },
        },
        opts = {},
        config = function(_, opts)
            local function git_op(cmd, node)
                if not node or node.name == ".." then return end
                vim.fn.system(cmd .. " " .. vim.fn.shellescape(node.absolute_path))
                require("nvim-tree.api").tree.reload()
            end

            opts.on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                api.config.mappings.default_on_attach(bufnr)

                local o = { buffer = bufnr, noremap = true, silent = true, nowait = true }
                vim.keymap.set("n", "ga", function()
                    git_op("git add", api.tree.get_node_under_cursor())
                end, vim.tbl_extend("force", o, { desc = "git add" }))
                vim.keymap.set("n", "gr", function()
                    git_op("git restore", api.tree.get_node_under_cursor())
                end, vim.tbl_extend("force", o, { desc = "git restore" }))
                vim.keymap.set("n", "gu", function()
                    git_op("git restore --staged", api.tree.get_node_under_cursor())
                end, vim.tbl_extend("force", o, { desc = "git unstage" }))
            end

            require("nvim-tree").setup(opts)
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function(data)
                    if vim.fn.isdirectory(data.file) == 1 then
                        vim.cmd.cd(data.file)
                        require("nvim-tree.api").tree.open()
                    end
                end,
            })
        end,
    },
}
