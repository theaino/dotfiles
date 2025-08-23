require("deps")

local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

-- LSP & Completion
add('prabirshrestha/vim-lsp')
add('mattn/vim-lsp-settings')
add('prabirshrestha/asyncomplete.vim')
add('prabirshrestha/asyncomplete-lsp.vim')
vim.g.asyncomplete_auto_popup = 1

-- FZF
add({
  source = 'junegunn/fzf',
  hooks = { post_install = function() vim.fn['fzf#install']() end },
})
add('junegunn/fzf.vim')

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
add({ source = 'nordtheme/vim', name = 'nord' })
vim.cmd("silent! colorscheme nord")

-- Telescope & Harpoon
add('nvim-lua/plenary.nvim')
add({ source = 'ThePrimeagen/harpoon', checkout = 'harpoon2' })
add({
  source = 'nvim-telescope/telescope.nvim',
  checkout = '0.1.x',
})

-- Snacks & Yazi
add('folke/snacks.nvim')
add('mikavilpas/yazi.nvim')

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
later(function()
	require("nvim-treesitter.configs").setup({
		highlight = {
			enable = true,
    	disable = { "lua", "markdown" },
		}
	})
end)

-- Git
add('tpope/vim-fugitive')

add("joshuavial/aider.nvim")
later(function()
	require("aider").setup({
		auto_manage_context = false,
		default_bindings = false,
	})
end)

add("tidalcycles/vim-tidal")
