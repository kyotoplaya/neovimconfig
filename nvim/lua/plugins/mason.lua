return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = { "clangd" }, -- Mason гарантирует установку clangd
      })
      -- Мы не вызываем lspconfig.setup(), просто ставим сервер
      -- Настройка LSP через новый API будет в lsp.lua
    end,
  },
}

