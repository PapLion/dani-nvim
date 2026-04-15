local map = vim.keymap.set
local opts = { silent = true }

map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file", silent = true })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file", silent = true })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit window", silent = true })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all", silent = true })
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer", silent = true })
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer", silent = true })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files", silent = true })
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files", silent = true })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files", silent = true })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep", silent = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers", silent = true })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags", silent = true })
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search buffer", silent = true })
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal", silent = true })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer", silent = true })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search in file", silent = true })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search", silent = true })
map("n", "<leader>?", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps", silent = true })
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { desc = "Format buffer", silent = true })

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

