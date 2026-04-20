local map = vim.keymap.set

-- Insert mode
map("i", "<C-k>", "<Esc>d$a")
map("i", "<C-[>", "<Esc>")

-- Command mode (Emacs-style)
map("c", "<C-A>", "<Home>")
map("c", "<C-F>", "<Right>")
map("c", "<C-B>", "<Left>")
map("c", "<C-E>", "<End>")

-- Normal mode
map("n", "<C-k>", "d$")
map("n", "H", "^")
map("n", "L", "$")
map("n", "<leader>h", "za", { desc = "toggle fold" })

-- Visual mode
map("v", "H", "^")
map("v", "L", "$")
map("v", "<leader>y", '"+y')

-- Buffer navigation
map("n", "<C-h>", "<cmd>bp<CR>")
map("n", "<C-l>", "<cmd>bn<CR>")

-- Window navigation (Alt + hjkl)
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- Terminal: toggle float terminal
map({ "n", "t" }, "<A-f>", "<cmd>ToggleTerm<CR>")

-- Terminal: exit terminal mode + window navigation
map("t", "<C-[>", "<C-\\><C-N>")
map("t", "<A-h>", "<C-\\><C-N><C-w>h")
map("t", "<A-j>", "<C-\\><C-N><C-w>j")
map("t", "<A-k>", "<C-\\><C-N><C-w>k")
map("t", "<A-l>", "<C-\\><C-N><C-w>l")

-- Neovide Mac shortcuts
if vim.g.neovide then
    map("n", "<D-a>", "ggVG")
    map("n", "<D-v>", '"+p')
    map("i", "<D-v>", '<Esc>"+p')
    map("n", "<D-c>", '"+yy')
    map("v", "<D-c>", '"+y')
    map("v", "<D-x>", '"+x')
end
