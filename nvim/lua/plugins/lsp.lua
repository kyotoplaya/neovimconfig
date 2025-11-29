return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    -- Настройка clangd через новый API
    vim.lsp.config.clangd = {
      default_config = {
        cmd = { "clangd" }, -- Mason может подставить путь
        filetypes = { "c", "cpp" },
        -- root_dir без lspconfig.util
        root_dir = function(fname)
          local Path = vim.loop.fs_realpath(fname) or fname
          local dir = vim.fn.fnamemodify(Path, ":p:h")
          while dir ~= "/" do
            if vim.fn.filereadable(dir .. "/compile_commands.json") == 1
              or vim.fn.isdirectory(dir .. "/.git") == 1
            then
              return dir
            end
            dir = vim.fn.fnamemodify(dir, ":h")
          end
          return vim.loop.cwd()
        end,
        capabilities = capabilities,
      }
    }

    -- Включаем LSP
    vim.lsp.enable("clangd")

    -- После подключения LSP активируем CMP для буфера
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local cmp = require("cmp")
        cmp.setup.buffer({})
      end,
    })
  end,
}

