if vim.loader then
  vim.loader.enable()
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.icons_enabled = false

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.lazy")
