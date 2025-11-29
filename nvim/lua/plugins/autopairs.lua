return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,       -- интеграция с treesitter
      map_cr = true,         -- Enter вставляет новую строку и закрывает скобку
      enable_moveright = true,
      disable_filetype = { "TelescopePrompt" },
    })
  end,
}

