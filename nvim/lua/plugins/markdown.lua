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
        build = "cd app && npx --yes yarn install",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
        keys = {
            { "<leader>fp", "<cmd>MarkdownPreviewToggle<CR>", ft = "markdown", desc = "markdown preview" },
        },
        init = function()
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_theme = "dark"
        end,
    },
}
