return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "lua", "vim", "vimdoc",
                    "python", "bash",
                    "kotlin", "cmake",
                    "markdown", "markdown_inline",
                    "c", "cpp",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
}
