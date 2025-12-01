return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",

    opts = {
      -- Языки, которые будут автоматически устанавливаться
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
        "json",
        "vim",
        "vimdoc",
        "bash",
        "markdown",
        "markdown_inline",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
}

