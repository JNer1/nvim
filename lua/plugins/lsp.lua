return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
		},
		config = function()
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
		end,
	},
}
