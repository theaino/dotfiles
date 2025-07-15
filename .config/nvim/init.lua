vim.cmd("runtime go.vim")
require("plug")
require("maps")


vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.cmd("highlight! link NormalFloat Normal")
vim.cmd("highlight! link FloatBorder Normal")

vim.cmd("set nospell")

-- Autoread
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
