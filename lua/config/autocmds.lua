local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 複製高亮
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
  end,
})

-- 開啟檔案時，自動恢復到上次離開時的游標位置
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Go 保存時整理 import + 格式化
autocmd("BufWritePre", {
  group = augroup("GoFormatOnSave", { clear = true }),
  pattern = "*.go",
  callback = function()
	local clients = vim.lsp.get_clients({ bufnr = 0, name = "gopls" })
	local client = clients[1] or vim.lsp.get_clients({ bufnr = 0 })[1]
    local encoding = client and client.offset_encoding or "utf-16"
	
    local params = vim.lsp.util.make_range_params(nil, encoding)
    params.context = {
      only = { "source.organizeImports" },
    }

    local result = vim.lsp.buf_request_sync(
      0,
      "textDocument/codeAction",
      params,
      1000
    )

    for _, res in pairs(result or {}) do
      for _, action in ipairs(res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, encoding)
        elseif action.command then
          vim.lsp.buf.execute_command(action.command)
        end
      end
    end

    vim.lsp.buf.format({
      async = false,
      filter = function(client)
        return client.name == "gopls"
      end,
    })
  end,
})

-- 針對 Go 檔案啟用原生 Tree-sitter 高亮、縮排與折疊
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gowork" },
  callback = function(args)
    local buf = args.buf
    local lang = "go"

    -- 檢查 go.so 解析器是否存在
    local has_parser = pcall(vim.treesitter.get_parser, buf, lang)
    if not has_parser then
      return
    end

    -- 啟動原生 Tree-sitter 高亮
    vim.treesitter.start(buf, lang)

    -- 啟用原生智慧縮排
    vim.bo[buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"

    -- 啟用原生代碼折疊（預設不展開折疊，按 zR/zA 操作）
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldenable = false
  end,
})
