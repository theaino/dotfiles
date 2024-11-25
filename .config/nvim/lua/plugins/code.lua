return {
	{
		"neoclide/coc.nvim",
		branch = "release",
		lazy = false,
		keys = {
			--[[{
				"<C-y>",
				function()
					if vim.fn.pumvisible() == 1 then
						return vim.cmd("coc#pum#confirm()")
					end
				end,
				mode = "i"
			},]]--
			{ "<leader>cc", "<cmd>CocCommand<cr>", desc = "Code command" }
		},
	},
	{ "L3MON4D3/LuaSnip" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "ruby", "html", "go" },
				sync_install = false,
				highlight = { enable = true },
				indent = {
					enable = true,
					disable = { "go" }
				},
			})
		end
	},
	{ "terrortylor/nvim-comment" },
}

