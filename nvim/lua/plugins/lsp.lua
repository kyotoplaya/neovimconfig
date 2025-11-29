return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      -- Новый API без deprecated setup()
      vim.lsp.config.clangd = {
        default_config = {
          filetypes = { "c", "cpp" },
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
        }
      }

      -- Автостарт LSP для C/C++
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function()
          if #vim.lsp.get_clients({ name = "clangd" }) == 0 then
            vim.lsp.start({ name = "clangd" }) -- Mason гарантирует наличие бинарника
          end
        end,
      })
    end,
  },
}

