return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup()

    -- 靜態/自動宣告需要安裝的語言 Parser
    ts.install({
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "go",
      "gomod",
      "gowork",
      "gotmpl",
      "json",
      "yaml",
      "markdown",
      "bash",
    })

    -- 透過 Neovim 原生 FileType 自動命令啟用語法高亮與縮進
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
      callback = function()
        -- 啟動 Neovim 原生 Treesitter 高亮
        pcall(vim.treesitter.start)
        -- 啟用 Treesitter 縮進引擎
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
