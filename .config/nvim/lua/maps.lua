vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
  local default_opts = { noremap = true, silent = true }
  opts = vim.tbl_extend("force", default_opts, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end


-- Autocomplete
map('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['asyncomplete#close_popup']() .. "\n"
  else
    return "\n"
  end
end, { expr = true })

-- Navigation
map("n", "<leader>/", ":Telescope live_grep<cr>")

map("n", "<leader>c", ":Yazi<cr>")
map("n", "<leader>w", ":Yazi cwd<cr>")

map("n", "<leader>f", ":Files<cr>")

-- Haroon
local harpoon = require("harpoon")
harpoon:setup()

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<A-1>", function() harpoon:list():select(1) end)
map("n", "<A-2>", function() harpoon:list():select(2) end)
map("n", "<A-3>", function() harpoon:list():select(3) end)
map("n", "<A-4>", function() harpoon:list():select(4) end)

-- Copy to real clipboard
map("n", "<leader>y", '"+y')
map("n", "<leader>p", '"+p')
map("v", "<leader>y", '"+y')
map("v", "<leader>p", '"+p')

map("n", "<leader>o", ":LspCodeAction<cr>")

-- Open rails i18n files
map("n", "<leader>ld", ":edit config/locales/de.yml<cr>")
map("n", "<leader>le", ":edit config/locales/en.yml<cr>")

-- Exit terminal mode
map("t", "<C-e>", "<C-\\><C-n>")

-- Aider
map("n", "<leader>h", function()
	if string.find(vim.api.nvim_get_mode().mode, "t") then
		vim.cmd("close")
	else
		require("aider").AiderOpen("--model openai/deepseek-coder-v2-lite --no-auto-commits --no-show-model-warnings", "vsplit")
		vim.cmd("vert wincmd L")
		vim.cmd("vert res 65")
	end
end)
