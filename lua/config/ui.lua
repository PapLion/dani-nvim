local M = {}
local c = require("config.palette").colors

function M.which_key()
  return {}
end

function M.telescope()
  require("telescope").setup({
    defaults = {
      prompt_prefix = "Search: ",
      selection_caret = "> ",
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      winblend = 0,
      path_display = { "truncate" },
      file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        ".cache/",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  })
end

function M.nvim_tree()
  return {
    view = {
      width = 34,
      side = "left",
    },
    renderer = {
      group_empty = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    hijack_netrw = true,
    git = {
      enable = true,
      ignore = false,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
      },
    },
  }
end

function M.bufferline()
  return {
    options = {
      mode = "buffers",
      separator_style = "thin",
      numbers = "none",
      show_buffer_close_icons = false,
      show_close_icon = false,
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      hover = {
        enabled = true,
        delay = 150,
        reveal = { "close" },
      },
      diagnostics_indicator = function(_, _, diag)
        local symbols = {
          error = "E",
          warning = "W",
          info = "I",
          hint = "H",
        }
        local out = {}
        for name, count in pairs(diag) do
          if symbols[name] and count > 0 then
            table.insert(out, symbols[name] .. count)
          end
        end
        return table.concat(out, " ")
      end,
    },
  }
end

function M.lualine()
  return {
    options = {
      theme = require("config.palette").lualine_theme(),
      icons_enabled = false,
      globalstatus = true,
      section_separators = "",
      component_separators = "",
      disabled_filetypes = {
        statusline = { "alpha", "NvimTree", "help" },
        winbar = {},
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "branch", icon = nil }, "diff" },
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_lsp" },
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  }
end

function M.alpha()
  local dashboard = require("alpha.themes.dashboard")

  dashboard.section.header.val = {
    "DANI NVIM",
    "",
    "Text-first • VSCode-friendly • Low overhead",
  }

  dashboard.section.buttons.val = {
    dashboard.button("e", "New file", "<cmd>ene<cr>"),
    dashboard.button("f", "Find file", "<cmd>Telescope find_files<cr>"),
    dashboard.button("r", "Recent file", "<cmd>Telescope oldfiles<cr>"),
    dashboard.button("g", "Search text", "<cmd>Telescope live_grep<cr>"),
    dashboard.button("q", "Quit", "<cmd>qa<cr>"),
  }

  dashboard.section.footer.val = "Tab accepts Copilot • Space shows commands"

  return dashboard
end

function M.toggleterm()
  return {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "single",
    },
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
  }
end

function M.todo_comments()
  return {
    signs = false,
  }
end

return M
