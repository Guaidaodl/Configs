return {
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        keys = {
            { "<leader>sf",     "<cmd>1ToggleTerm direction=float<CR>",      desc = "Float Term1",      mode = { "n" } },
            { "<leader>sh",     "<cmd>1ToggleTerm direction=horizontal<CR>", desc = "Horizontal Term1", mode = { "n" } },
            { "<leader>sv",     "<cmd>1ToggleTerm direction=vertical<CR>",   desc = "Vertical Term1", mode = { "n" } },
            { "<leader>n2",     "<cmd>1ToggleTerm<CR>",                      desc = "Toggle Term1", mode = { "n" } },
            { "<D-2>",          "<cmd>1ToggleTerm<CR>", mode = { "n", "t" } },
            { "<leader>sF",     "<cmd>2ToggleTerm direction=Float<CR>",   desc = "Float Term2", mode = { "n" } },
            { "<A-f>",          "<cmd>2ToggleTerm direction=float<CR>", mode = { "n", "t" } },
        },
        opts = {
            size = function(term)
                if term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
                return 15
            end,
            float_opts = {
                border = "curved",
            },
        },
    },
}
