vim.lsp.config("clangd", {
    cmd = { "clangd" },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.lsp.start("clangd")
    end,
})

