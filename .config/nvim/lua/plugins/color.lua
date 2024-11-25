return {
	{
		"ptdewey/darkearth-nvim",
		priority = 1000,
		config = function()
			--vim.cmd([[colorscheme darkearth]])
		end
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				transparent = true,
			})
			--require('bamboo').load()
		end,
	},

	-- Use colors from pywal
	{
		"oncomouse/lushwal.nvim",
		dependencies = {
			{ "rktjmp/lush.nvim" },
			{ "rktjmp/shipwright.nvim" },
		},
		config = function()
			vim.g.lushwal_configuration = {
				transparent_background = true,
				terminal_colors = true
			}
			vim.cmd([[LushwalCompile]])
			vim.cmd([[colorscheme lushwal]])
		end
	}
}
