local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})
	lsp.buffer_autoformat()
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})
