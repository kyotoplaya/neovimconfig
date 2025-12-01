vim.g.mapleader = " "

-- Базовые
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>x', ':q!<CR>', { desc = 'Quit without saving' })


-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree float<CR>', { desc = 'Open Neotree float' })
vim.keymap.set('n', '<leader>n', ':Neotree left<CR>', { desc = 'Open Neotree right' })

