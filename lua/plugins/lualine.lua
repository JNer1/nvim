return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				disabled_filetypes = {
					"packer",
					"NvimTree",
				},
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
			},
		})
	end,
}
