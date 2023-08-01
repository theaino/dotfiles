vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "e", function ()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_buf_set_lines(0, pos[1]-1, pos[1]-1, false, {""})
end)
vim.keymap.set("n", "<C-e>", function ()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, {""})
end)

vim.api.nvim_set_keymap("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-t>", ":FloatermToggle<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>nt", vim.cmd.FloatermNew)
vim.keymap.set("t", "<C-n>", vim.cmd.FloatermNext)
vim.keymap.set("t", "<C-p>", vim.cmd.FloatermPrev)

vim.api.nvim_set_keymap("n", "<leader>rr", ":EffiRun dev<CR>", {noremap = true, silent = true})
