return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    opts = function(_, opts)
      return require("polish").toggleterm(opts)
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      return require("polish").todo_comments(opts)
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TroubleFocus" },
    opts = function(_, opts)
      return require("polish").trouble(opts)
    end,
  },
}
