return {
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("tree-sitter-manager").setup({
        -- 指定需要的 Parser
        ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "json", "markdown" },
      })

      -- 啟用 Neovim 原生 Tree-sitter 語法高亮
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vim-treesitter-start", { clear = true }),
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
} 
