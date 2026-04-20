local function edit_buf_in_new_tab()
    local buf = vim.fn.bufnr("%")
    vim.cmd("tabe")
    vim.cmd("buffer " .. buf)
end

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")

            local function bind_tool_panel_keymap(num, cmd, desc)
                vim.keymap.set("n", "<D-" .. num .. ">", cmd, { desc = desc })
                wk.add({ { "<leader>n" .. num, cmd, desc = desc } })
            end

            wk.setup({})

            bind_tool_panel_keymap(1, "<cmd>NvimTreeToggle<CR>", "tree")

            wk.add({
                -- Groups (for bindings declared in other plugin files)
                { "<leader>g", group = "git" },
                { "<leader>j", group = "jump" },
                { "<leader>l", group = "lsp" },

                -- Paste / clipboard
                { "<leader>p", '"0p',   desc = "paste 0",  mode = "n" },
                { "<leader>x", ":q<CR>",desc = "close",    mode = "n" },
                { "<leader>x", '"+d',   desc = "cut",      mode = "v" },
                { "<leader>c", '"+y',   desc = "copy",     mode = "v" },
                { "<leader>v", '"+p',   desc = "paste",    mode = "n" },

                -- Preferences
                { "<leader>P",  group = "preferences" },
                { "<leader>Pi", "<cmd>Lazy install<CR>",     desc = "install plugins" },
                { "<leader>Pc", "<cmd>Lazy clean<CR>",       desc = "clean plugins" },
                { "<leader>Pu", "<cmd>Lazy update<CR>",      desc = "update plugins" },

                -- File
                { "<leader>f",  group = "file" },
                { "<leader>fq", "<cmd>q<CR>",  desc = "quit" },
                { "<leader>fn", "<cmd>new<CR>", desc = "new" },
                { "<leader>fs", "<cmd>w<CR>",  desc = "save" },
                { "<leader>fS", ":w ",         desc = "save as" },

                -- Buffer
                { "<leader>b",  group = "buffer" },
                { "<leader>bp", "<cmd>bp<CR>", desc = "previous" },
                { "<leader>bn", "<cmd>bn<CR>", desc = "next" },
                { "<leader>bd", "<cmd>bd<CR>", desc = "delete" },
                { "<leader>bk", "<cmd>bd<CR>", desc = "kill" },

                -- Edit
                { "<leader>e",  group = "edit" },
                { "<leader>ey", '"+yy',               desc = "copy line" },
                { "<leader>ep", '"+p',                desc = "paste" },
                { "<leader>er", ":%s///gc<Left><Left><Left><Left>", desc = "replace" },

                -- Window
                { "<leader>w",  group = "window" },
                { "<leader>w1", "<cmd>1 wincmd w<CR>", desc = "window 1" },
                { "<leader>w2", "<cmd>2 wincmd w<CR>", desc = "window 2" },
                { "<leader>w3", "<cmd>3 wincmd w<CR>", desc = "window 3" },
                { "<leader>w4", "<cmd>4 wincmd w<CR>", desc = "window 4" },
                { "<leader>w5", "<cmd>5 wincmd w<CR>", desc = "window 5" },
                { "<leader>wq", "<cmd>q<CR>",    desc = "quit" },
                { "<leader>ws", "<C-w>s",        desc = "split" },
                { "<leader>wv", "<C-w>v",        desc = "vsplit" },
                { "<leader>wo", "<C-w><C-w>",    desc = "other" },
                { "<leader>wm", "<C-w>o",        desc = "maximize" },
                { "<leader>wh", "<C-w>h",        desc = "go left" },
                { "<leader>wj", "<C-w>j",        desc = "go down" },
                { "<leader>wk", "<C-w>k",        desc = "go up" },
                { "<leader>wl", "<C-w>l",        desc = "go right" },
                { "<leader>w=", "<C-w>=",        desc = "equal" },

                -- Quickfix
                { "<leader>q",  group = "quickfix" },
                { "<leader>qc", "<cmd>ccl<CR>",   desc = "close" },
                { "<leader>qo", "<cmd>copen<CR>", desc = "open" },
                { "<leader>qn", "<cmd>cn<CR>",    desc = "next" },
                { "<leader>qp", "<cmd>cp<CR>",    desc = "previous" },
                { "<leader>ql", "<cmd>cl<CR>",    desc = "list" },

                -- Tab
                { "<leader>t",  group = "tab" },
                { "<leader>t1", "1gt",                desc = "tab 1" },
                { "<leader>t2", "2gt",                desc = "tab 2" },
                { "<leader>t3", "3gt",                desc = "tab 3" },
                { "<leader>t4", "4gt",                desc = "tab 4" },
                { "<leader>t5", "5gt",                desc = "tab 5" },
                { "<leader>t6", "6gt",                desc = "tab 6" },
                { "<leader>t7", "7gt",                desc = "tab 7" },
                { "<leader>tn", "<cmd>tabnew<CR>",    desc = "new" },
                { "<leader>tl", "<cmd>tabnext<CR>",   desc = "next" },
                { "<leader>th", "<cmd>tabprevious<CR>",desc = "previous" },
                { "<leader>to", "<cmd>tabonly<CR>",   desc = "only" },
                { "<leader>td", "<cmd>tabclose<CR>",  desc = "delete" },
                { "<leader>te", edit_buf_in_new_tab,  desc = "edit in new tab" },

                -- Macro
                { "<leader>m",  group = "macro" },
                { "<leader>mm", "@@",  desc = "repeat" },
                { "<leader>ma", "@a",  desc = "@a" },
                { "<leader>mb", "@b",  desc = "@b" },
                { "<leader>mc", "@c",  desc = "@c" },
                { "<leader>md", "@d",  desc = "@d" },
                { "<leader>m1", "@1",  desc = "@1" },
                { "<leader>m2", "@2",  desc = "@2" },
                { "<leader>m3", "@3",  desc = "@3" },
                { "<leader>m4", "@4",  desc = "@4" },
                { "<leader>m5", "@5",  desc = "@5" },

                -- Tool Panel
                { "<leader>n", group = "num" },
            })
        end,
    },
}
