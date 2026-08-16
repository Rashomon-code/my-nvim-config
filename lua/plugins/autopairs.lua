return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    
    autopairs.setup({
      check_ts = true, -- Treesitter 語法檢查，避免在字串或註釋中錯誤補全
      ts_config = {
        lua = { "string" },
        go = { "string", "comment" },
      },
    })
  end,
}
