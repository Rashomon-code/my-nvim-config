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
