return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- 打開檔案時載入
  opts = {
    -- 左側邊欄顯示圖示符號
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "" }, -- Nerd Font
      topdelete    = { text = "" },
      changedelete = { text = "▎" },
      untracked    = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- 快捷鍵：在變更區塊 (Hunk) 之間跳轉
      map("n", "]h", function()
        if vim.wo.diff then return "]h" end
        vim.schedule(function() gs.nav_hunk("next") end)
        return "<Ignore>"
      end, { expr = true, desc = "跳轉至下一個 Git 變更區塊" })

      map("n", "[h", function()
        if vim.wo.diff then return "[h" end
        vim.schedule(function() gs.nav_hunk("prev") end)
        return "<Ignore>"
      end, { expr = true, desc = "跳轉至上一個 Git 變更區塊" })

      -- 快捷鍵：預覽與重置變更
      map("n", "<leader>hp", gs.preview_hunk, { desc = "預覽當前行變更 (Hunk Preview)" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "重置/撤銷當前行變更" })
      map("n", "<leader>hd", gs.diffthis, { desc = "對比當前檔案 Diff" })
      map("n", "<leader>hb", gs.blame_line, { desc = "查看 Git Blame" })
      map("n", "<leader>ht", gs.toggle_signs, { desc = "切換 Git 標記" })
    end,
  },
}
