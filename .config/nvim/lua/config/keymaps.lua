local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "Find" },
	{ "<leader>fh", function()
		toggle_telescope(require("harpoon"):list())
	end, desc = "Find harpoon" },

	{ "<leader>g", group = "Git" },
	{ "<leader>t", group = "Terminal" },
	{ "<leader>p", group = "Sessions" },

	{ "<leader>b", group = "Buffer" },
	{ "<leader>bd", "<cmd>bd<cr>", desc = "Delete buffer" },
	{ "<leader>q", "<cmd>q<cr>", desc = "Quit buffer" },
	{ "<leader>w", "<cmd>w<cr>", desc = "Save buffer" },

	{ "<leader>a", group = "All" },
	{ "<leader>aw", "<cmd>wa<cr>", desc = "Save all" },
	{ "<leader>aq", "<cmd>qa<cr>", desc = "Quit all" },

	{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy" },

	{ "<C-h>", "<C-\\><C-n><C-w>h", desc = "Switch window" },
	{ "<C-j>", "<C-\\><C-n><C-w>j", desc = "Switch window" },
	{ "<C-k>", "<C-\\><C-n><C-w>k", desc = "Switch window" },
	{ "<C-l>", "<C-\\><C-n><C-w>l", desc = "Switch window" },
	{ "<A-n>", "<C-\\><C-n><C-w>w", desc = "Switch window" },
	{ "<A-p>", "<C-\\><C-n><C-w>w", desc = "Switch window" },

	{ "<C-s>n", "<C-\\><C-n>", mode = "t" },

	{ "<C-Right>", "5<C-w>>", desc = "Increase width" },
	{ "<C-Left>", "5<C-w><", desc = "Decrease width" },

	{ "<C-Up>", "5<C-w>+", desc = "Increase height" },
	{ "<C-Down>", "5<C-w>-", desc = "Decrease height" },
})


