return {
  {
    "github/copilot.vim",
    event = { "InsertEnter", "CmdUndefined" },
    init = function()
      vim.g.copilot_no_tab_map = false
    end,
  },
}

