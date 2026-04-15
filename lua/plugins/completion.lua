return {
  {
    "saghen/blink.cmp",
    version = "^1",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = function(_, opts)
      local base = {
        enabled = function()
          return vim.bo.buftype ~= "prompt"
        end,
        fuzzy = { implementation = "prefer_rust" },
        keymap = {
          preset = "default",
          ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<CR>"] = { "accept", "fallback" },
          ["<C-e>"] = { "hide", "fallback" },
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<C-n>"] = { "select_next", "show" },
          ["<C-p>"] = { "select_prev", "show" },
          ["<Tab>"] = {
            "select_next",
            "snippet_forward",
            "fallback",
          },
          ["<S-Tab>"] = {
            "select_prev",
            "snippet_backward",
            "fallback",
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        completion = {
          list = { selection = { preselect = false, auto_insert = true } },
          menu = {
            auto_show = function(ctx)
              return ctx.mode ~= "cmdline"
            end,
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            draw = {
              treesitter = { "lsp" },
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            window = {
              winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            },
          },
          accept = {
            auto_brackets = {
              enabled = true,
            },
          },
        },
        cmdline = {
          keymap = {
            ["<End>"] = { "hide", "fallback" },
          },
          completion = {
            ghost_text = { enabled = false },
          },
        },
        signature = {
          window = {
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      }

      if vim.g.icons_enabled == false then
        base.appearance = {
          kind_icons = {
            Text = "T",
            Method = "M",
            Function = "F",
            Constructor = "C",
            Field = "F",
            Variable = "V",
            Property = "P",
            Class = "C",
            Interface = "I",
            Struct = "S",
            Module = "M",
            Unit = "U",
            Value = "V",
            Enum = "E",
            EnumMember = "E",
            Keyword = "K",
            Constant = "C",
            Snippet = "S",
            Color = "C",
            File = "F",
            Reference = "R",
            Folder = "D",
            Event = "E",
            Operator = "O",
            TypeParameter = "T",
          },
        }
      end

      return vim.tbl_deep_extend("force", opts or {}, base)
    end,
  },
}
