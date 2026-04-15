local community = require("community")

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
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  bashls = {},
  cssls = {},
  html = {},
  jsonls = {},
  yamlls = {},
  ts_ls = {},
  pyright = {},
  gopls = {},
  rust_analyzer = {},
  clangd = {},
  jdtls = {},
  kotlin_language_server = {},
}

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog", "MasonUpdate" },
    opts = {
      ui = {
        border = "single",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = {
          spacing = 2,
          prefix = community.icons.error,
        },
        signs = true,
        underline = true,
        severity_sort = true,
        float = {
          border = "single",
          source = "if_many",
        },
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

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      for name, config in pairs(servers) do
        vim.lsp.config(name, vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, config))
      end

      vim.lsp.enable(vim.tbl_keys(servers))

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true,
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "shfmt",
          "prettierd",
          "prettier",
          "gofumpt",
          "goimports",
          "shellcheck",
          "ruff",
          "luacheck",
          "markdownlint-cli2",
          "yamllint",
          "jsonlint",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 2000,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        python = { "ruff_format", "ruff_fix" },
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        go = { "gofumpt", "goimports" },
        rust = { "rustfmt" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile", "InsertLeave" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        lua = { "luacheck" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
        python = { "ruff" },
        yaml = { "yamllint" },
        markdown = { "markdownlint" },
        json = { "jsonlint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("DaniLint", { clear = true }),
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
