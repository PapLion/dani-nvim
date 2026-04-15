local M = {}

function M.setup()
  local cmp = require("cmp")

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-e>"] = cmp.mapping.abort(),
    }),
    formatting = {
      format = function(entry, item)
        local labels = {
          nvim_lsp = "LSP",
          buffer = "BUF",
          path = "PATH",
        }
        item.menu = labels[entry.source.name] or entry.source.name
        return item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })

  require("conform").setup({
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 2000,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      html = { "prettierd" },
      css = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      sh = { "shfmt" },
      go = { "gofumpt", "goimports" },
      rust = { "rustfmt" },
    },
  })
end

return M

