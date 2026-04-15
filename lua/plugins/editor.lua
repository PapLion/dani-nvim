return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(require("polish").telescope(opts))
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "file_browser")
      pcall(telescope.load_extension, "project")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = function(_, opts)
      return require("polish").neo_tree(opts)
    end,
  },
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    opts = function(_, opts)
      return require("polish").which_key(opts)
    end,
  },
}
