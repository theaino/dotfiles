-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

reload("user.options")

reload("user.bindings")
reload("user.lsp")
reload("user.colorscheme")
reload("user.plugins")

reload("user.alpha")
reload("user.telescope")
reload("user.nvimtree")
reload("user.bufferline")
reload("user.indent_blankline")

vim.opt.relativenumber = true
vim.opt.number = true

lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

vim.g.clang_complete_macros = 1

vim.api.nvim_create_augroup("lvim_user", {})
lvim.autocommands = {
  -- {
  --   "BufAdd",
  --   {
  --     pattern = "*",
  --     group = "lvim_user",
  --     callback = function(args)
  --       local api = vim.api
  --       local bufnr = args.buf
  --       local bufname = api.nvim_buf_get_name(bufnr)
  --       local bufmodified = api.nvim_buf_get_option(bufnr, "modified")
  --       local buftype = api.nvim_buf_get_option(bufnr, "buftype")
  --       local ft = api.nvim_buf_get_option(bufnr, "ft")

  --       if ft == "" and bufname == "" and buftype == "" and not bufmodified then
  --         local normal_buffers = vim.tbl_filter(function(buf)
  --           return api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == ""
  --         end, api.nvim_list_bufs())

  --         if #normal_buffers == 1 then
  --           vim.schedule(function()
  --             vim.cmd("Alpha")
  --             vim.cmd("bd " .. bufnr)
  --           end)
  --         end
  --       end
  --     end,
  --   },
  -- },
  -- {
  --   "BufEnter",
  --   {
  --     pattern = "*",
  --     group = "lvim_user",
  --     callback = function(args)
  --       if #vim.api.nvim_list_wins() == 1 and args.file:match("NvimTree_") ~= nil then
  --         vim.cmd("quit")
  --       end
  --     end,
  --   },
  -- },
  {
    { "BufWinEnter", "BufRead", "BufNewFile" },
    {
      group = "lvim_user",
      pattern = "*",
      command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    },
  },
  {
    { "BufEnter", "BufWinEnter" },
    {
      group = "lvim_user",
      pattern = "*.glsl",
      command = "setlocal ts=4 sw=4",
    },
  },
  -- {
  --   "FileType",
  --   {
  --     group = "lvim_user",
  --     pattern = { "gitcommit", "markdown" },
  --     command = "setlocal wrap spell",
  --   },
  -- },
}
