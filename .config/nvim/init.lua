local vim = vim

require("deps")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local Plug = vim.fn['plug#']

vim.call("plug#begin")

Plug('prabirshrestha/vim-lsp')
Plug('mattn/vim-lsp-settings')
Plug('prabirshrestha/asyncomplete-lsp.vim')
Plug('prabirshrestha/asyncomplete.vim')
vim.g.asyncomplete_auto_popup = 1
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['asyncomplete#close_popup']() .. "\n"
  else
    return "\n"
  end
end, { expr = true, noremap = true })

Plug('junegunn/fzf', { ['do'] = function() vim.cmd("fzf#install()") end })
Plug('junegunn/fzf.vim')
vim.keymap.set("n", "<leader>f", ":Files<cr>", { noremap = true, silent = true })

Plug('SirVer/ultisnips')
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsSnippetDirectories = { os.getenv("HOME") .. "/.config/nvim/UltiSnips" }

Plug('lervag/vimtex')
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_mode = 0
vim.o.conceallevel = 1
vim.g.tex_conceal = "abdmg"

Plug('dracula/vim', { as = 'dracula' })

Plug('nvim-lua/plenary.nvim')
Plug('ThePrimeagen/harpoon', { branch = 'harpoon2' })

Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<cr>", { noremap = true, silent = true })

Plug('folke/snacks.nvim')
Plug('mikavilpas/yazi.nvim')
vim.keymap.set("n", "<leader>c", ":Yazi<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":Yazi cwd<cr>", { noremap = true, silent = true })

Plug('mattn/emmet-vim')
vim.g.user_emmet_leader_key = ","
vim.g.user_emmet_install_global = 0
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "eruby" },
  callback = function()
    vim.cmd("EmmetInstall")
  end,
})

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

Plug('tpope/vim-fugitive')


Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-lua/plenary.nvim')
Plug('MunifTanjim/nui.nvim')
--Plug('MeanderingProgrammer/render-markdown.nvim')

Plug('hrsh7th/nvim-cmp')
Plug('echasnovski/mini.icons')
Plug('HakonHarnes/img-clip.nvim')
Plug('zbirenbaum/copilot.lua')
Plug('stevearc/dressing.nvim')
Plug('folke/snacks.nvim')

Plug('yetone/avante.nvim', { branch = 'main', ['do'] = 'make' })

Plug('vim-pandoc/vim-pandoc')

vim.call("plug#end")

require('avante').setup({
	provider = "venice_qwen",
  providers = {
    venice_qwen = {
      endpoint = "https://api.venice.ai/api/v1",
      model = "qwen-2.5-qwq-32b",
      api_key_name = "VENICE_TOKEN",
      parse_curl_args = function(opts, code_opts)
        return {
          url = opts.endpoint,
          headers = {
            ["Accept"] = "application/json",
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
          },
          body = {
            model = opts.model,
            messages = {
              { role = "system", content = code_opts.system_prompt },
              { role = "user", content = require("avante.providers.openai").get_user_message(code_opts) },
            },
            temperature = 0,
            max_tokens = 4096,
            stream = true,
          },
        }
      end,
      parse_response_data = function(data_stream, event_state, opts)
        require("avante.providers").openai.parse_response(data_stream, event_state, opts)
      end,
    },
  },
})

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
