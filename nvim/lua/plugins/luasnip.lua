return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require("luasnip")

    -- Загружаем VSCode-стиль сниппеты (friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Загружаем наши собственные сниппеты из lua/snippets/
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets",
    })

    -- Чтобы сниппеты обновлялись без перезапуска
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })
  end,
}

