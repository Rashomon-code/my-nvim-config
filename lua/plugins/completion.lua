return {
  'saghen/blink.cmp',
  -- 選擇發行版本，免去手動編譯 Rust 模組的麻煩
  version = '*',

  opts = {
    -- 按鍵對映設定 ('default' | 'super-tab' | 'enter')
    -- 'default': Tab / Shift-Tab 選項，Enter 確認
    -- 'super-tab': 類似 VS Code 的經典 Super-Tab 行為
    keymap = {
        preset = 'none',

        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
      -- 自動匹配你當前 colorscheme 的高亮組，或設定為 'mono' / 'nerd_font_mono'
        nerd_font_variant = 'none'
    },

    -- 補全來源設定
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- 實驗性功能：開啟補全選單的實時預覽（如 LSP 函式簽名/程式碼段）
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true }, -- 類似 GitHub Copilot 的灰色預覽文字
    },
  },
  
  -- 如果使用可選的補全圖示/字型，可在此處設定依賴
  opts_extend = { "sources.default" }
}
