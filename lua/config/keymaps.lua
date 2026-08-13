local map = vim.keymap.set

-- 設置 Leader 鍵為 Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 快速儲存與退出
map("n", "<leader>w", "<cmd>w<CR>", { desc = "儲存檔案" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "退出" })

-- 取消搜尋高亮
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "清除搜尋高亮" })

-- 視窗切換 (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "切換至左視窗" })
map("n", "<C-j>", "<C-w>j", { desc = "切換至下視窗" })
map("n", "<C-k>", "<C-w>k", { desc = "切換至上視窗" })
map("n", "<C-l>", "<C-w>l", { desc = "切換至右視窗" })
