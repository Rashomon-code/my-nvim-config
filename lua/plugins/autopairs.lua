return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- 切換到插入模式時才載入，提升啟動速度
    opts = {
      fast_wrap = {}, -- 支援 Alt+e 等快速包裹選區功能
    },
  },
}
