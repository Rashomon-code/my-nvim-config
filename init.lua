-- 1. 載入基礎設定
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")

-- 2. 自動安裝 lazy.nvim (若未安裝)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 3. 初始化 lazy.nvim 並載入 lua/plugins/ 目錄下的插件配置
require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false, -- 自動檢測配置更新時不彈窗打擾
  },
})
