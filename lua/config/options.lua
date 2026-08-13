local opt = vim.opt

-- 排版與外觀
opt.number = true             -- 顯示行號
opt.relativenumber = true     -- 顯示相對行號
opt.termguicolors = true      -- 開啟 24-bit RGB 真彩色
opt.signcolumn = "yes"        -- 始終顯示左側標籤欄（避免後續 LSP 報錯圖示擠壓）
opt.cursorline = true         -- 高亮當前行

-- 縮進（Go 規範預設習慣：Tab 寬度為 4）
opt.tabstop = 4               -- 1 個 Tab 等於 4 個空格
opt.shiftwidth = 4            -- 自動縮進寬度
opt.expandtab = false         -- 保留真實 Tab（Go 官方規章；若寫其他語言可由 ftplugin 覆蓋）
opt.smartindent = true        -- 智慧型自動縮進

-- 搜尋與剪貼簿
opt.ignorecase = true         -- 搜尋忽略大小寫
opt.smartcase = true          -- 若輸入包含大寫字母則精確匹配
opt.clipboard = "unnamedplus" -- 與 Linux 系統剪貼簿同步 ( 目前使用 xclip)
opt.updatetime = 250          -- 降低光標停頓觸發時間（利於 LSP 診斷顯示）
opt.scrolloff = 8             -- 上下捲動時保留 8 行邊界
