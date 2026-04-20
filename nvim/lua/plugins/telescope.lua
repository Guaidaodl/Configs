return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>jb", "<cmd>Telescope buffers<CR>",              desc = "buffer" },
            { "<leader>jf", "<cmd>Telescope find_files<CR>",           desc = "files" },
            { "<leader>jh", "<cmd>Telescope command_history<CR>",      desc = "cmd history" },
            { "<leader>jj", "<cmd>Telescope jumplist<CR>",             desc = "jump list" },
            { "<leader>jt", "<cmd>Telescope lsp_document_symbols<CR>", desc = "buf symbols" },
            { "<leader>jT", "<cmd>Telescope lsp_workspace_symbols<CR>",desc = "workspace symbols" },
            { "<leader>jr", "<cmd>Telescope live_grep<CR>",            desc = "grep" },
            { "<C-g>",      "<cmd>Telescope lsp_references<CR>",       desc = "LSP references" },
            -- Neovide Mac shortcuts
            { "<D-e>",      "<cmd>Telescope buffers<CR>",              desc = "buffers" },
            { "<D-o>",      "<cmd>Telescope find_files<CR>",           desc = "find files" },
            { "<D-g>",      "<cmd>Telescope lsp_document_symbols<CR>", desc = "symbols" },
        },
        opts = {
            pickers = {
                find_files = { previewer = false, theme = "dropdown" },
                buffers    = { 
                    previewer = false, 
                    theme = "dropdown",
                    sort_lastused = true,
                },
            },
        },
    },
}
