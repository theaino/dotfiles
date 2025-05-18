let g:mapleader=" "

call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
	let g:asyncomplete_auto_popup = 1
	inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
	nnoremap <leader>f :Files<cr>

Plug 'SirVer/ultisnips'
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips"]

Plug 'lervag/vimtex'
	let g:tex_flavor="latex"
	let g:vimtex_view_method="zathura"
	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal="abdmg"

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }

Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
	nnoremap <leader>/ :Telescope live_grep<cr>

Plug 'folke/snacks.nvim'
Plug 'mikavilpas/yazi.nvim'
	nnoremap <leader>c :Yazi<cr>
	nnoremap <leader>w :Yazi cwd<cr>

Plug 'mattn/emmet-vim'
	let g:user_emmet_leader_key=","
	let g:user_emmet_install_global = 0
	autocmd FileType html,css,eruby EmmetInstall

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

set number relativenumber

set tabstop=2
set shiftwidth=2

silent! colorscheme dracula


lua << EOF
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
EOF

nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>p "+p

nnoremap <leader>o :LspCodeAction<cr>

nnoremap <leader>ld :edit config/locales/de.yml<cr>
nnoremap <leader>le :edit config/locales/en.yml<cr>


runtime go.vim

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
