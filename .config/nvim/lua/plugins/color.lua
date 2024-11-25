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
			require('bamboo').load()
		end,
	}
}
