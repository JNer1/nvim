local lsp = require("lsp-zero").preset({
    name = "minimal",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach(function(_client, _bufnr)
    lsp.buffer_autoformat()
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
