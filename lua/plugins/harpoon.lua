return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	commit = "e76cb03",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-h>", function()
			harpoon.ui:toggle_quick_menu(
				harpoon:list(),
				{ border = "rounded", title_pos = "center", ui_width_ratio = 0.45 }
			)
		end)

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(3)
		end)
	end,
}
