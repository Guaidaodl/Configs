return {
    { "godlygeek/tabular" },
    {
        "preservim/vim-markdown",
        ft = "markdown",
        init = function()
            vim.g.vim_markdown_folding_disabled = 1
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
