return {
  {
    "folke/snacks.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      return require("polish").snacks(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      return require("polish").lualine(opts)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      return require("polish").bufferline(opts)
    end,
  },
}
