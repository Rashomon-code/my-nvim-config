return {
  "echasnovski/mini.files",
  version = "*",
  keys = {
    {
      "<leader>e",
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        -- 若當前緩衝區有檔案路徑，開在當前檔案位置；否則開在工作目錄
        if bufname ~= "" then
          require("mini.files").open(bufname)
        else
          require("mini.files").open(vim.uv.cwd())
        end
      end,
      desc = "開啟檔案樹",
    },
  },
  opts = {
    windows = {
      preview = true,     -- 右側自動顯示預覽視窗
      width_preview = 40, -- 預覽視窗寬度
    },
    options = {
      use_as_default_explorer = true, -- 替代 Neovim 預設的 netrw
    },
  },
}
