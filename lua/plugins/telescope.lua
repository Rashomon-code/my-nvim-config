return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- 提供漂亮的文件类型图标
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  cmd = "Telescope", -- 确保启动极速
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
        prompt_position = "top", -- 让输入框在顶部，更符合现代习惯
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- 自动加载 fzf 加速扩展
    pcall(telescope.load_extension, "fzf")
  end,
}
