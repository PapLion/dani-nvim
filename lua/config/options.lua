local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.backup = false
opt.writebackup = false
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.expandtab = true
opt.fillchars = { eob = " " }
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "split"
opt.incsearch = true
opt.laststatus = 3
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.pumblend = 0
opt.relativenumber = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append("c")
opt.showmode = false
opt.showtabline = 2
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 200
opt.winborder = "single"
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.colorcolumn = "100"
opt.shortmess:append("sI")
