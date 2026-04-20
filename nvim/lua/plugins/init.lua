-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins.ui" },
    { import = "plugins.whichkey" },
    { import = "plugins.editor" },
    { import = "plugins.telescope" },
    { import = "plugins.tree" },
    { import = "plugins.terminal" },
    { import = "plugins.git" },
    { import = "plugins.completion" },
    { import = "plugins.lsp" },
    { import = "plugins.treesitter" },
    { import = "plugins.tasks" },
    { import = "plugins.markdown" },
}, {
    change_detection = { notify = false },
})
