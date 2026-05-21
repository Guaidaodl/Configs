return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
                "lua", "vim", "vimdoc", "query",
                "python", "bash",
                "kotlin", "cmake",
                "markdown", "markdown_inline",
                "c", "cpp",
                "mermaid",
            })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                    vim.bo[args.buf].indentexpr =
                        "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
}
