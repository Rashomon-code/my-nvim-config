-- 設置 Leader 鍵為 Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 載入基礎設定
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")
require("config.lazy")
