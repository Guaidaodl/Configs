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
            { "<leader>gp", "<cmd>Git pull --rebase<CR>", desc = "pull --rebase" },
        },
        config = function()
            local hint_lines = {
                "Fugitive Keybindings",
                "───────────────────────────────",
                "s / u      Stage / Unstage file",
                "=          Toggle inline diff",
                "cc / ca    Commit / Amend",
                "X          Discard changes",
                "dd / dv    Diff split / vsplit",
                "o          Open file",
                "P          Push",
                "g?         Full help",
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "fugitive",
                callback = function(ev)
                    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                        if vim.w[win].fugitive_hint then
                            return
                        end
                    end
                    vim.cmd("topleft 35vnew")
                    local hint_buf = vim.api.nvim_get_current_buf()
                    local hint_win = vim.api.nvim_get_current_win()

                    vim.api.nvim_buf_set_lines(hint_buf, 0, -1, false, hint_lines)

                    vim.api.nvim_buf_add_highlight(hint_buf, -1, "Title", 0, 0, -1)
                    vim.api.nvim_buf_add_highlight(hint_buf, -1, "Comment", 1, 0, -1)
                    for i = 2, #hint_lines - 1 do
                        local line = hint_lines[i + 1]
                        local sep_start = line:find("%s%s+%S")
                        if sep_start then
                            vim.api.nvim_buf_add_highlight(hint_buf, -1, "Special", i, 0, sep_start - 1)
                            vim.api.nvim_buf_add_highlight(hint_buf, -1, "Comment", i, sep_start - 1, -1)
                        end
                    end

                    vim.bo[hint_buf].modifiable = false
                    vim.bo[hint_buf].buftype = "nofile"
                    vim.bo[hint_buf].bufhidden = "wipe"
                    vim.bo[hint_buf].swapfile = false
                    vim.wo[hint_win].number = false
                    vim.wo[hint_win].relativenumber = false
                    vim.wo[hint_win].signcolumn = "no"
                    vim.wo[hint_win].cursorline = false
                    vim.w[hint_win].fugitive_hint = true

                    vim.api.nvim_set_current_win(vim.fn.bufwinid(ev.buf))

                    vim.api.nvim_create_autocmd({ "BufWinLeave", "BufDelete" }, {
                        buffer = ev.buf,
                        once = true,
                        callback = function()
                            if vim.api.nvim_win_is_valid(hint_win) then
                                vim.api.nvim_win_close(hint_win, true)
                            end
                        end,
                    })
                end,
            })
        end,
    },
}
