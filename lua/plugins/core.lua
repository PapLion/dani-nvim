return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
    opts = require("config.ui").which_key(),
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
    opts = require("config.ui").todo_comments(),
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup({})
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleFocus" },
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
    opts = {
      focus = true,
      auto_close = false,
      auto_preview = false,
      use_diagnostic_signs = true,
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function(_, opts)
      require("persistence").setup(opts)
    end,
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize", "help" },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    config = function(_, opts)
      require("toggleterm").setup(opts)
    end,
    opts = require("config.ui").toggleterm(),
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.ui").telescope()
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local dashboard = require("config.ui").alpha()
      require("alpha").setup(dashboard.opts)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
    opts = require("config.ui").bufferline(),
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
    opts = require("config.ui").lualine(),
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Git blame", "GBrowse" },
  },
}
