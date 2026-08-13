-- 1. LSP 啟用時綁定通用快捷鍵 (按鍵映射僅在 LSP 成功連線後生效)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local map = vim.keymap.set

    -- 轉到定義 / 引用
    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "轉到定義" }))
    map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "查看引用" }))
    map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "顯示懸浮文檔" }))

    -- 代碼重構與動作
    map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "重命名變數" }))
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))

    -- 代碼格式化
    map("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "格式化代碼" }))
  end,
})

-- 2. 配置 gopls
vim.lsp.config["gopls"] = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true, -- 自動補全未 import 的包並自動導入
      usePlaceholders = true,    -- 補全函數時帶入參數佔位符
      analyses = {
        unusedparams = true,     -- 標示未使用的參數
      },
      staticcheck = true,        -- 啟用更嚴格的靜態檢查
    },
  },
}

-- 3. 啟用 gopls
vim.lsp.enable("gopls")
