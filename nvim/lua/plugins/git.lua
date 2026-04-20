return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gb", "<cmd>Git blame<CR>",  desc = "blame" },
            { "<leader>gc", "<cmd>Git commit<CR>", desc = "commit" },
            { "<leader>gd", "<cmd>Git diff<CR>",   desc = "diff" },
            { "<leader>gs", "<cmd>tab Git<CR>",    desc = "status" },
        },
    },
}
