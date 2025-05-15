return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				astro = { "prettier" },
				mdx = { "prettier" },
				tex = { "latexindent" },
			},
			format_after_save = {
				lsp_fallback = true,
			},
		})
	end,
}
