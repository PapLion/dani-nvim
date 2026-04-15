local M = {}

local c = require("community").palette

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function section(fg, bg, bold)
  return { fg = fg, bg = bg, gui = bold and "bold" or "none" }
end

function M.apply()
  local p = c

  vim.o.background = "dark"
  vim.g.colors_name = "dani"

  hl("Normal", { fg = p.fg, bg = p.bg })
  hl("NormalNC", { fg = p.fg, bg = p.bg })
  hl("NormalFloat", { fg = p.fg, bg = p.surface })
  hl("FloatBorder", { fg = p.blue, bg = p.surface })
  hl("WinSeparator", { fg = p.border, bg = p.bg })
  hl("VertSplit", { fg = p.border, bg = p.bg })
  hl("EndOfBuffer", { fg = p.bg, bg = p.bg })
  hl("SignColumn", { bg = p.bg })
  hl("CursorLine", { bg = p.surface })
  hl("CursorLineNr", { fg = p.cyan, bg = p.bg, bold = true })
  hl("LineNr", { fg = p.muted, bg = p.bg })
  hl("Visual", { bg = p.selection })
  hl("Search", { fg = p.bg, bg = p.yellow })
  hl("IncSearch", { fg = p.bg, bg = p.cyan, bold = true })
  hl("Pmenu", { fg = p.fg, bg = p.surface })
  hl("PmenuSel", { fg = p.bg, bg = p.blue, bold = true })
  hl("PmenuSbar", { bg = p.surface_2 })
  hl("PmenuThumb", { bg = p.blue })
  hl("Comment", { fg = p.comment, italic = true })
  hl("Constant", { fg = p.yellow })
  hl("String", { fg = p.green })
  hl("Number", { fg = p.orange })
  hl("Function", { fg = p.cyan })
  hl("Keyword", { fg = p.blue })
  hl("Type", { fg = p.yellow })
  hl("Identifier", { fg = p.fg })
  hl("Statement", { fg = p.blue })
  hl("Special", { fg = p.cyan })
  hl("Boolean", { fg = p.orange })
  hl("Operator", { fg = p.muted })
  hl("Delimiter", { fg = p.muted })
  hl("DiagnosticError", { fg = p.red })
  hl("DiagnosticWarn", { fg = p.yellow })
  hl("DiagnosticInfo", { fg = p.blue })
  hl("DiagnosticHint", { fg = p.cyan })
  hl("DiagnosticSignError", { fg = p.red, bg = p.bg })
  hl("DiagnosticSignWarn", { fg = p.yellow, bg = p.bg })
  hl("DiagnosticSignInfo", { fg = p.blue, bg = p.bg })
  hl("DiagnosticSignHint", { fg = p.cyan, bg = p.bg })
  hl("DiagnosticVirtualTextError", { fg = p.red, bg = p.surface })
  hl("DiagnosticVirtualTextWarn", { fg = p.yellow, bg = p.surface })
  hl("DiagnosticVirtualTextInfo", { fg = p.blue, bg = p.surface })
  hl("DiagnosticVirtualTextHint", { fg = p.cyan, bg = p.surface })
  hl("LspInlayHint", { fg = p.muted, bg = p.surface })
  hl("Directory", { fg = p.blue, bold = true })
  hl("Title", { fg = p.cyan, bold = true })

  hl("TelescopeBorder", { fg = p.blue, bg = p.surface })
  hl("TelescopeNormal", { fg = p.fg, bg = p.surface })
  hl("TelescopePromptBorder", { fg = p.cyan, bg = p.surface })
  hl("TelescopePromptNormal", { fg = p.fg, bg = p.surface })
  hl("TelescopePromptPrefix", { fg = p.cyan, bg = p.surface, bold = true })
  hl("TelescopePromptTitle", { fg = p.bg, bg = p.cyan, bold = true })
  hl("TelescopeResultsBorder", { fg = p.blue, bg = p.surface })
  hl("TelescopeResultsTitle", { fg = p.bg, bg = p.blue, bold = true })
  hl("TelescopePreviewBorder", { fg = p.yellow, bg = p.surface })
  hl("TelescopePreviewTitle", { fg = p.bg, bg = p.yellow, bold = true })
  hl("TelescopeSelectionCaret", { fg = p.cyan, bg = p.surface_2, bold = true })
  hl("TelescopeSelection", { fg = p.fg, bg = p.surface_2 })
  hl("TelescopeMatching", { fg = p.yellow, bold = true })

  hl("WhichKey", { fg = p.fg })
  hl("WhichKeyBorder", { fg = p.blue, bg = p.surface })
  hl("WhichKeyGroup", { fg = p.cyan, bold = true })
  hl("WhichKeyDesc", { fg = p.fg })
  hl("WhichKeySeparator", { fg = p.muted })

  hl("AlphaHeader", { fg = p.cyan, bold = true })
  hl("AlphaButtons", { fg = p.fg })
  hl("AlphaFooter", { fg = p.muted })
  hl("AlphaShortcut", { fg = p.blue, bold = true })

  hl("BufferLineFill", { bg = p.bg })
  hl("BufferLineBackground", { fg = p.muted, bg = p.surface })
  hl("BufferLineBufferVisible", { fg = p.muted, bg = p.surface })
  hl("BufferLineBufferSelected", { fg = p.fg, bg = p.bg, bold = true })
  hl("BufferLineSeparator", { fg = p.border, bg = p.border })
  hl("BufferLineIndicatorSelected", { fg = p.cyan, bg = p.bg, bold = true })
  hl("BufferLineTab", { fg = p.muted, bg = p.surface })
  hl("BufferLineTabSelected", { fg = p.fg, bg = p.blue, bold = true })
  hl("BufferLineModified", { fg = p.yellow, bg = p.surface })
  hl("BufferLineModifiedSelected", { fg = p.yellow, bg = p.bg })

  hl("GitSignsAdd", { fg = p.green })
  hl("GitSignsChange", { fg = p.yellow })
  hl("GitSignsDelete", { fg = p.red })

  hl("NeoTreeNormal", { fg = p.fg, bg = p.surface })
  hl("NeoTreeNormalNC", { fg = p.fg, bg = p.surface })
  hl("NeoTreeFloatBorder", { fg = p.blue, bg = p.surface })
  hl("NeoTreeVertSplit", { fg = p.border, bg = p.surface })
  hl("NeoTreeDirectoryName", { fg = p.blue, bold = true })
  hl("NeoTreeDirectoryIcon", { fg = p.blue })
  hl("NeoTreeFileName", { fg = p.fg })
  hl("NeoTreeGitAdded", { fg = p.green })
  hl("NeoTreeGitModified", { fg = p.yellow })
  hl("NeoTreeGitDeleted", { fg = p.red })
  hl("NeoTreeGitUntracked", { fg = p.cyan })
  hl("NeoTreeIndentMarker", { fg = p.border })
  hl("NeoTreeSignColumn", { bg = p.surface })

  hl("TroubleNormal", { fg = p.fg, bg = p.surface })
  hl("TroubleText", { fg = p.fg })
  hl("TroubleCount", { fg = p.bg, bg = p.cyan, bold = true })
  hl("TroubleIndent", { fg = p.muted })
  hl("TroubleSource", { fg = p.blue })

  hl("SnacksDashboardHeader", { fg = p.cyan, bold = true })
  hl("SnacksDashboardDesc", { fg = p.fg })
  hl("SnacksDashboardKey", { fg = p.bg, bg = p.yellow, bold = true })
  hl("SnacksDashboardFooter", { fg = p.muted })
  hl("SnacksNotifierTitleInfo", { fg = p.cyan, bold = true })
  hl("SnacksNotifierTitleWarn", { fg = p.yellow, bold = true })
  hl("SnacksNotifierTitleError", { fg = p.red, bold = true })

  hl("StatusLine", { fg = p.fg, bg = p.surface })
  hl("StatusLineNC", { fg = p.muted, bg = p.bg })
end

function M.lualine(existing)
  local p = c
  local opts = {
    options = {
      theme = {
        normal = {
          a = section(p.bg, p.blue, true),
          b = section(p.fg, p.surface, false),
          c = section(p.fg, p.bg, false),
        },
        insert = {
          a = section(p.bg, p.green, true),
          b = section(p.fg, p.surface, false),
          c = section(p.fg, p.bg, false),
        },
        visual = {
          a = section(p.bg, p.yellow, true),
          b = section(p.fg, p.surface, false),
          c = section(p.fg, p.bg, false),
        },
        replace = {
          a = section(p.bg, p.red, true),
          b = section(p.fg, p.surface, false),
          c = section(p.fg, p.bg, false),
        },
        command = {
          a = section(p.bg, p.cyan, true),
          b = section(p.fg, p.surface, false),
          c = section(p.fg, p.bg, false),
        },
        inactive = {
          a = section(p.muted, p.bg, false),
          b = section(p.muted, p.bg, false),
          c = section(p.muted, p.bg, false),
        },
      },
      icons_enabled = false,
      globalstatus = true,
      section_separators = "",
      component_separators = "",
      disabled_filetypes = {
        statusline = { "alpha", "neo-tree", "snacks_dashboard", "help", "toggleterm" },
        winbar = {},
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "diagnostics", "filetype" },
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

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.bufferline(existing)
  local p = c
  local opts = {
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
      offsets = {
        {
          filetype = "neo-tree",
          text = " Explorer ",
          highlight = "Directory",
          text_align = "left",
        },
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

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.snacks(existing)
  local opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = table.concat({
          "DANI NVIM",
          "",
          "Text-first • fast • low overhead",
        }, "\n"),
        keys = {
          { key = "e", action = "<leader>e", desc = "Explorer" },
          { key = "f", action = "<leader>ff", desc = "Find files" },
          { key = "g", action = "<leader>fg", desc = "Live grep" },
          { key = "b", action = "<leader>fb", desc = "Buffers" },
          { key = "r", action = "<leader>fr", desc = "Recent files" },
          { key = "p", action = "<leader>fp", desc = "Projects" },
          { key = "s", action = "<leader>gs", desc = "LazyGit" },
          { key = "d", action = "<leader>xx", desc = "Diagnostics" },
          { key = "t", action = "<leader>tt", desc = "Terminal" },
          { key = "q", action = "<leader>Q", desc = "Quit" },
        },
      },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 2 },
        { section = "startup" },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    input = { enabled = true },
    picker = { enabled = false },
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.which_key(existing)
  local opts = {
    plugins = { spelling = false },
    win = { border = "single" },
    layout = { align = "center" },
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>t", group = "Terminal" },
      { "<leader>c", group = "Cheatsheet" },
    },
    icons = {
      group = "",
      separator = " - ",
      breadcrumb = ">",
      rules = false,
    },
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.telescope(existing)
  local opts = {
    defaults = {
      prompt_prefix = "Search: ",
      selection_caret = "> ",
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        width = 0.95,
        height = 0.85,
      },
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      winblend = 0,
      path_display = { "truncate" },
      previewer = false,
      file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        ".cache/",
        "dist/",
        "build/",
        "target/",
        ".venv/",
        "venv/",
      },
    },
    pickers = {
      buffers = { previewer = false },
      oldfiles = { previewer = false },
      help_tags = { previewer = false },
      keymaps = { previewer = false },
      current_buffer_fuzzy_find = { previewer = false },
    },
    extensions = {
      file_browser = {
        hijack_netrw = true,
        grouped = true,
        hidden = true,
        respect_gitignore = true,
        prompt_path = true,
        use_fd = true,
        git_status = true,
        dir_icon = "DIR",
      },
      project = {
        display_type = "minimal",
        base_dirs = {
          { path = vim.fn.expand("~/Code"), max_depth = 4 },
          { path = vim.fn.expand("~/.config"), max_depth = 2 },
        },
        ignore_missing_dirs = true,
        hidden_files = false,
        order_by = "recent",
        cd_scope = { "tab", "window" },
      },
    },
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.neo_tree(existing)
  local p = c
  local opts = {
    close_if_last_window = true,
    enable_git_status = vim.fn.executable("git") == 1,
    auto_clean_after_session_restore = true,
    popup_border_style = "single",
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_gitignored = false,
        hide_dotfiles = false,
        hide_by_name = { "node_modules", ".DS_Store", ".git" },
      },
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = vim.fn.has("win32") ~= 1,
    },
    source_selector = {
      statusline = false,
      winbar = true,
      content_layout = "center",
      sources = {
        { source = "filesystem", display_name = "Files" },
        { source = "buffers", display_name = "Buffers" },
        { source = "git_status", display_name = "Git" },
        { source = "diagnostics", display_name = "Diag" },
      },
    },
    default_component_configs = {
      indent = { padding = 0 },
      icon = {
        folder_closed = "DIR",
        folder_open = "DIR",
        folder_empty = "DIR",
        default = "FILE",
      },
      modified = { symbol = "*" },
      git_status = {
        symbols = {
          added = "+",
          deleted = "-",
          modified = "~",
          renamed = ">",
          untracked = "?",
          ignored = "i",
          unstaged = "!",
          staged = "=",
          conflict = "x",
        },
      },
    },
    window = {
      width = 34,
      mappings = {
        ["<space>"] = false,
        ["<cr>"] = "open",
        ["h"] = "parent_or_close",
        ["l"] = "child_or_open",
        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
      },
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node:has_children() then
          if not node:is_expanded() then
            state.commands.toggle_node(state)
          else
            local child = node:get_child_ids()[1]
            if child then
              require("neo-tree.ui.renderer").focus_node(state, child)
            end
          end
        else
          state.commands.open(state)
        end
      end,
    },
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.toggleterm(existing)
  local opts = {
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

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.todo_comments(existing)
  local opts = {
    signs = false,
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.trouble(existing)
  local opts = {
    focus = true,
    auto_close = false,
    auto_preview = false,
    use_diagnostic_signs = true,
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.gitsigns(existing)
  local opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
      untracked = { text = "?" },
    },
    signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
      untracked = { text = "?" },
    },
    current_line_blame = false,
    watch_gitdir = { follow_files = true },
    on_attach = function(bufnr)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end
      map("]g", function() require("gitsigns").nav_hunk("next") end, "Next hunk")
      map("[g", function() require("gitsigns").nav_hunk("prev") end, "Previous hunk")
      map("<leader>gb", function() require("gitsigns").toggle_current_line_blame() end, "Toggle blame")
      map("<leader>gp", function() require("gitsigns").preview_hunk() end, "Preview hunk")
      map("<leader>gr", function() require("gitsigns").reset_hunk() end, "Reset hunk")
      map("<leader>gS", function() require("gitsigns").stage_buffer() end, "Stage buffer")
      map("<leader>gu", function() require("gitsigns").undo_stage_hunk() end, "Undo stage")
    end,
  }

  return vim.tbl_deep_extend("force", existing or {}, opts)
end

function M.setup()
  M.apply()
  local group = vim.api.nvim_create_augroup("DaniPolish", { clear = true })

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = M.apply,
  })

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = M.apply,
  })
end

return M
