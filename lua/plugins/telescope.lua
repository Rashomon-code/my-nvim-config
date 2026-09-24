return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- 用於顯示圖標
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  cmd = "Telescope", -- 確保啟動極速
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
      prompt_prefix = "❯ ",
      selection_caret = "❯ ",
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top", -- 讓輸入框在頂部，更符合現代習慣
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- 自動載入 fzf 加速擴充功能
    pcall(telescope.load_extension, "fzf")
  end,
}
