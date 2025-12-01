return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          },
        },
      },
    })

    -- включаем FZF ускорение
    pcall(telescope.load_extension, "fzf")

    -- Горячие клавиши
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Поиск файлов" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Поиск текста" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Поиск буферов" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Поиск по справке" })
  end,
}

