return {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		init = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
				desc = "Start Neo-tree with directory",
				once = true,
				callback = function()
					if package.loaded["neo-tree"] then
						return
					else
						local stats = vim.uv.fs_stat(vim.fn.argv(0))
						if stats and stats.type == "directory" then
							require("neo-tree")
						end
					end
				end,
			})
		end,
		opts = {},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" }
		}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		}
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			extensions = { "neo-tree", "lazy" },
		}
	},
	{
		"fedepujol/move.nvim",
		opts = {},
		keys = {
			{ "<A-j>", ":MoveLine(1)<CR>", mode = { "n" } },
			{ "<A-k>", ":MoveLine(-1)<CR>", mode = { "n" } },
			{ "<A-j>", ":MoveBlock(1)<CR>", mode = { "v" } },
			{ "<A-k>", ":MoveBlock(-1)<CR>", mode = { "v" } },
			{ "<A-j>", "<C-\\><C-N>:MoveLine(1)<CR>i", mode = { "i" } },
			{ "<A-k>", "<C-\\><C-N>:MoveLine(-1)<CR>i", mode = { "i" } },
		}
	},
	--[[{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},]]--
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.8",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
			{ "<leader>ft",  "<cmd>Telescope colorscheme<cr>", desc = "Find theme" },

			{ "<leader>ca", "<cmd>Telescope coc file_code_actions<cr>", desc = "File code actions" },
			{ "<leader>cl", "<cmd>Telescope coc line_code_actions<cr>", desc = "Line code actions" },
			
			{ "gd", "<cmd>Telescope coc definitions<cr>", desc = "Goto definition" },
			{ "gr", "<cmd>Telescope coc references<cr>", desc = "Goto references" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"fannheyward/telescope-coc.nvim"
		},
		config = function ()
			require("telescope").load_extension("coc")
		end,
		opts = {
			pickers = {
				colorscheme = {
					enable_preview = true
				}
			}
		},
	},
	{
		"akinsho/toggleterm.nvim", version = "*",
		opts = {},
		keys = {
			{ "<leader>th", "<cmd>ToggleTerm<cr>", desc = "Toggle horizontal terminal" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle vertical terminal" },
			{ "<leader>tt", "<cmd>ToggleTerm direction=tab<cr>", desc = "Toggle tabbed terminal" },
		}
	},
	{ "farmergreg/vim-lastplace" },
	{
		"folke/persistence.nvim",
		opts = {},
		keys = {
			{ "<leader>pl", function() require("persistence").load() end, desc = "Load session" },
			{ "<leader>ps", function() require("persistence").select() end, desc = "Select session" },
			{ "<leader>pq", function() require("persistence").stop() end, desc = "Exit session" },
		}
	},
	{
		"ThePrimeagen/harpoon", branch = "harpoon2",
		dependenciers = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = {
			{ "<leader>h", function() require("harpoon"):list():add() end, desc = "Harpoon current file" },
			{ "<C-m>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
			{ "<A-a>", function() require("harpoon"):list():select(1) end },
			{ "<A-s>", function() require("harpoon"):list():select(2) end },
			{ "<A-d>", function() require("harpoon"):list():select(3) end },
			{ "<A-f>", function() require("harpoon"):list():select(4) end },
		}
	},
	{
		"MunifTanjim/nui.nvim"
	},
	{
		"lommix/godot.nvim"
	}
}
