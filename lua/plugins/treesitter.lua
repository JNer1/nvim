return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"javascript",
				"typescript",
				"astro",
				"rust",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
			},

			ignore_install = { "latex" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages

				disable = function(lang, buf)
					local disabled_languages = { "latex" } -- Add the languages you always want to disable
					if vim.tbl_contains(disabled_languages, lang) then
						return true -- Disable for these languages regardless of file size
					end

					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true -- Disable for large files
					end

					return false -- Otherwise, keep highlighting enabled
				end,
				additional_vim_regex_highlighting = false,
			},
		})

		vim.treesitter.language.register("markdown", "mdx")
	end,
}
