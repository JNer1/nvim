local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			lspconfig.lua_ls.setup(lua_opts)
		end,
		html = function()
			lspconfig.html.setup({
				filetypes = {
					"css",
					"eruby",
					"html",
					"htmldjango",
					"javascriptreact",
					"less",
					"pug",
					"sass",
					"scss",
					"typescriptreact",
				},
			})
		end,
	},
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "luasnip" },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})
