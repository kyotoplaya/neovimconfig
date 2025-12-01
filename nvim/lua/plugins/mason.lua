return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")

    -- Настройка Mason
    mason.setup({
      PATH = "prepend",        -- автоматически добавляем пути LSP в PATH
      log_level = vim.log.levels.INFO,
    })

    -- Автоустановка LSP серверов
    mason_lsp.setup({
      ensure_installed = {
        "clangd",   -- C/C++
        "lua_ls",   -- Lua
        "pyright",  -- Python
      },
      automatic_installation = true,
    })

    -- Обработчики для всех LSP серверов
    mason_lsp.setup_handlers({
      function(server_name)
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end
    })
  end
}

