return {
  "saghen/blink.cmp",
  -- 自動下載 Rust 編譯好的預編譯二進位檔
  version = "*",

  event = "InsertEnter", -- 當進入插入模式時才加載，確保啟動極速

  opts = {
    -- 快捷鍵配置
    keymap = {
      preset = "default",
      -- <C-space> 觸發手動補全
      -- <Tab> / <S-Tab> 選項上下切換與確認
      -- <CR> (Enter) 確定選擇
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },

    -- 外觀設定
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "none", --Nerd Font
    },

    -- 補全來源（LSP, 緩衝區文字, 檔案路徑, Snippets）
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- 懸浮彈窗風格
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        border = "rounded",
      },
    },
  },
}
