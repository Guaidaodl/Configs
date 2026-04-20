local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufNewFile" }, { pattern = "Podfile",     command = "set filetype=ruby" })
autocmd({ "BufRead", "BufNewFile" }, { pattern = "JenkinsFile", command = "set filetype=groovy" })

-- Disable syntax highlighting for files larger than 10MB
autocmd("BufWinEnter", {
    callback = function()
        if vim.fn.line2byte(vim.fn.line("$") + 1) > 10000000 then
            vim.cmd("syntax clear")
        end
    end,
})
