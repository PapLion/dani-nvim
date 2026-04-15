local group = vim.api.nvim_create_augroup("DaniNeovim", { clear = true })
local community = require("community")
local uv = vim.uv or vim.loop

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "Restore cursor position",
  callback = function(args)
    local line = vim.fn.line([['"]], args.buf)
    if line > 1 and line <= vim.fn.line("$", args.buf) then
      vim.api.nvim_win_set_cursor(0, { line, 0 })
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = group,
  desc = "Root to git repository",
  callback = function(args)
    local name = vim.api.nvim_buf_get_name(args.buf)
    if name == "" then
      return
    end
    local stat = uv.fs_stat(name)
    if not stat or stat.type ~= "file" then
      return
    end
    community.set_project_cwd(args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = {
    "help",
    "man",
    "qf",
    "checkhealth",
    "lspinfo",
    "alpha",
    "neo-tree",
    "snacks_dashboard",
    "Trouble",
  },
  desc = "Close helper windows with q",
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>quit<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Close window",
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "gitcommit", "markdown", "text" },
  desc = "Enable writing helpers",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = group,
  desc = "Start terminal in insert mode",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})
