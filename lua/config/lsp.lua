local M = {}

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  pyright = {},
  bashls = {},
  jsonls = {},
  yamlls = {},
  html = {},
  cssls = {},
  ts_ls = {},
  clangd = {},
  gopls = {},
  rust_analyzer = {},
  jdtls = {},
  kotlin_language_server = {},
}

function M.setup()
  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
  })

  require("mason-tool-installer").setup({
    ensure_installed = {
      "stylua",
      "black",
      "isort",
      "shfmt",
      "prettierd",
      "prettier",
      "gofumpt",
      "goimports",
      "shellcheck",
    },
    auto_update = false,
    run_on_start = true,
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.diagnostic.config({
    virtual_text = {
      spacing = 2,
      prefix = "●",
    },
    signs = true,
    underline = true,
    severity_sort = true,
    float = {
      border = "single",
      source = "if_many",
    },
  })

  vim.lsp.config("*", {
    capabilities = capabilities,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("DaniLsp", { clear = true }),
    callback = function(event)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {
          buffer = event.buf,
          silent = true,
          desc = desc,
        })
      end

      map("K", vim.lsp.buf.hover, "Hover")
      map("gd", vim.lsp.buf.definition, "Definition")
      map("gD", vim.lsp.buf.declaration, "Declaration")
      map("gi", vim.lsp.buf.implementation, "Implementation")
      map("gr", vim.lsp.buf.references, "References")
      map("<leader>rn", vim.lsp.buf.rename, "Rename")
      map("<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
      map("<leader>lq", vim.diagnostic.setloclist, "Diagnostics list")
    end,
  })

  for name, config in pairs(servers) do
    vim.lsp.config(name, vim.tbl_deep_extend("force", {}, config, {
      capabilities = capabilities,
    }))
  end

  vim.lsp.enable(vim.tbl_keys(servers))
end

return M
