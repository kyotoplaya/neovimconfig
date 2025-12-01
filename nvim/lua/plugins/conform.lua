return {
  "stevearc/conform.nvim",
  event = "BufWritePre",

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },

      -- автоформатирование перед сохранением
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}

