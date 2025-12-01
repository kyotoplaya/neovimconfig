return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- загружается сразу
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- варианты: latte, frappe, macchiato, mocha
      integrations = {
        cmp = true,
        lsp_saga = true,
        telescope = true,
        treesitter = true,
        -- и другие плагины
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
