local vim = vim

require("deps")

vim.g.mapleader = " "
vim.g.maplocalleader = " "


local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

-- LSP & Completion
add('prabirshrestha/vim-lsp')
add('mattn/vim-lsp-settings')
add('prabirshrestha/asyncomplete.vim')
add('prabirshrestha/asyncomplete-lsp.vim')
vim.g.asyncomplete_auto_popup = 1
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['asyncomplete#close_popup']() .. "\n"
  else
    return "\n"
  end
end, { expr = true, noremap = true })

-- FZF
add({
  source = 'junegunn/fzf',
  hooks = { post_install = function() vim.fn['fzf#install']() end },
})
add('junegunn/fzf.vim')
vim.keymap.set("n", "<leader>f", ":Files<cr>", { noremap = true, silent = true })

-- Snippets
add('SirVer/ultisnips')
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsSnippetDirectories = { os.getenv("HOME") .. "/.config/nvim/UltiSnips" }

-- LaTeX
add('lervag/vimtex')
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0
vim.o.conceallevel = 1
vim.g.tex_conceal = "abdmg"

-- Colorscheme
add({ source = 'dracula/vim', alias = 'dracula' })

-- Telescope & Harpoon
add('nvim-lua/plenary.nvim')
add({ source = 'ThePrimeagen/harpoon', checkout = 'harpoon2' })
add({
  source = 'nvim-telescope/telescope.nvim',
  checkout = '0.1.x',
})
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<cr>", { noremap = true, silent = true })

-- Snacks & Yazi
add('folke/snacks.nvim')
add('mikavilpas/yazi.nvim')
vim.keymap.set("n", "<leader>c", ":Yazi<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":Yazi cwd<cr>", { noremap = true, silent = true })

-- Emmet
add('mattn/emmet-vim')
vim.g.user_emmet_leader_key = ","
vim.g.user_emmet_install_global = 0
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "eruby" },
  callback = function()
    vim.cmd("EmmetInstall")
  end,
})

-- Treesitter
add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main',
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'vimdoc' },
  highlight = { enable = true },
})

-- Git
add('tpope/vim-fugitive')

add({
  source = 'yetone/avante.nvim',
  monitor = 'main',
  depends = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.icons'
  },
  hooks = { post_checkout = function() vim.cmd('make') end }
})
--- optional
add({ source = 'hrsh7th/nvim-cmp' })
add({ source = 'zbirenbaum/copilot.lua' })
add({ source = 'HakonHarnes/img-clip.nvim' })
add({ source = 'MeanderingProgrammer/render-markdown.nvim' })

later(function() require('render-markdown').setup({}) end)
later(function()
  require('img-clip').setup({}) -- config img-clip
  require("copilot").setup({}) -- setup copilot to your liking
	require('avante').setup({
		provider = "venice",
		providers = {
			venice = require("venice"),
		},
	})
end)


vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.cmd("silent! colorscheme dracula")


local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)


vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

vim.keymap.set("n", "<leader>o", ":LspCodeAction<cr>")

vim.keymap.set("n", "<leader>ld", ":edit config/locales/de.yml<cr>")
vim.keymap.set("n", "<leader>le", ":edit config/locales/en.yml<cr>")

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd("runtime go.vim")

vim.cmd("set nospell")
