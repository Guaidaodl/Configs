return {
    {
        "skywind3000/asyncrun.vim",
        dependencies = { "skywind3000/asynctasks.vim" },
        init = function()
            vim.g.asyncrun_open = 10
        end,
        keys = {
            { "<F10>", "<cmd>call asyncrun#quickfix_toggle(6)<CR>", desc = "toggle quickfix" },
        },
    },
}
