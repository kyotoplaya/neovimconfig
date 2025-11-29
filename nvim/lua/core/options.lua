-- lua/core/options.lua

-- === Общие настройки ===
vim.opt.number = true            -- включаем номера строк
vim.opt.wrap = false             -- отключаем перенос строк
vim.opt.ignorecase = true        -- поиск без учета регистра
vim.opt.smartcase = true         -- если есть заглавные, чувствительность к регистру
vim.opt.signcolumn = "yes"       -- колонка для знаков (LSP, Git)

-- === Автоотступы ===
vim.opt.expandtab = true         -- пробелы вместо табов
vim.opt.shiftwidth = 4           -- ширина отступа для >> и autoindent
vim.opt.tabstop = 4              -- ширина таба
vim.opt.softtabstop = 4          -- Tab на уровне пробелов
vim.opt.autoindent = true        -- копировать отступ с предыдущей строки

-- === Умные отступы для C-подобных языков ===
vim.opt.cindent = true

-- Правила смещения для блоков, параметров, продолжений строк
vim.opt.cinoptions = ":0,p0,t0,g0"

-- Клавиши, при которых выполняется автоотступ
vim.opt.cinkeys = vim.opt.cinkeys + {"0{", "0}", "0#", "0)"}

-- === Прочее ===
vim.opt.swapfile = false          -- отключаем swap
vim.opt.backup = false            -- отключаем бэкапы
vim.opt.undofile = true           -- включаем persistent undo
vim.opt.updatetime = 300          -- время обновления для CursorHold и LSP
vim.opt.timeoutlen = 500          -- таймаут для mapped sequences
vim.opt.clipboard = "unnamedplus" -- использовать системный буфер

