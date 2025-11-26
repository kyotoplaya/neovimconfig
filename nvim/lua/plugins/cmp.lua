local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- Если не используешь luasnip, можешь оставить пустым или подключить свой сниппет-движок
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Tab подтверждает выбранный элемент автокомплита
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            fallback()
        end, { 'i', 's' }),

        -- Навигация стрелками
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
    }),
})

-- Конфиг для gitcommit
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }
    }, {
        { name = 'buffer' }
    })
})

-- Конфиг для поиска /? в командной строке
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

-- Конфиг для командной строки ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})

-- LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('tsserver', {
    capabilities = capabilities,
})
vim.lsp.enable('tsserver')

