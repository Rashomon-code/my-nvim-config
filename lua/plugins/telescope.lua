return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Telescope", -- 輸入 :Telescope 或按快捷鍵時才加載，確保啟動速度
  keys = {
    -- 搜尋檔名 (Find Files)
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "搜尋專案檔案" },
    -- 全文搜尋關鍵字 (Live Grep)
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "全文檢索字串" },
    -- 搜尋目前開啟的 Buffer
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "搜尋已開啟的 Buffer" },
    -- 搜尋 Git 變更檔案
    { "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "搜尋 Git 追蹤檔案" },
  },
  opts = {
    defaults = {
      prompt_prefix = "> ", -- Nerd Font
      selection_caret = "> ",
      path_display = { "truncate" },
    },
  },
}
