local M = {}

M.colors = {
  bg = "#282C34",
  bg_alt = "#1A1F27",
  panel = "#20262E",
  panel_strong = "#2B3440",
  fg = "#EBEBE6",
  muted = "#888888",
  blue = "#4076B1",
  cyan = "#38B5B5",
  red = "#FF3B30",
  yellow = "#E5C07B",
  green = "#50A14F",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.apply()
  local c = M.colors

  hl("Normal", { fg = c.fg, bg = c.bg })
  hl("NormalNC", { fg = c.fg, bg = c.bg })
  hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
  hl("FloatBorder", { fg = c.blue, bg = c.bg_alt })
  hl("WinSeparator", { fg = c.bg_alt, bg = c.bg })
  hl("VertSplit", { fg = c.bg_alt, bg = c.bg })
  hl("SignColumn", { bg = c.bg })
  hl("EndOfBuffer", { fg = c.bg, bg = c.bg })
  hl("CursorLine", { bg = c.bg_alt })
  hl("CursorLineNr", { fg = c.blue, bg = c.bg, bold = true })
  hl("LineNr", { fg = c.muted, bg = c.bg })
  hl("Visual", { bg = c.panel })
  hl("Search", { fg = c.bg, bg = c.yellow })
  hl("IncSearch", { fg = c.bg, bg = c.cyan, bold = true })
  hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
  hl("PmenuSel", { fg = c.bg, bg = c.blue, bold = true })
  hl("PmenuSbar", { bg = c.panel })
  hl("PmenuThumb", { bg = c.blue })
  hl("Comment", { fg = c.muted, italic = true })
  hl("Constant", { fg = c.yellow })
  hl("String", { fg = c.green })
  hl("Function", { fg = c.cyan })
  hl("Keyword", { fg = c.blue })
  hl("Type", { fg = c.yellow })
  hl("Identifier", { fg = c.fg })
  hl("Statement", { fg = c.blue })
  hl("Special", { fg = c.cyan })
  hl("DiagnosticError", { fg = c.red })
  hl("DiagnosticWarn", { fg = c.yellow })
  hl("DiagnosticInfo", { fg = c.blue })
  hl("DiagnosticHint", { fg = c.cyan })
  hl("DiagnosticSignError", { fg = c.red })
  hl("DiagnosticSignWarn", { fg = c.yellow })
  hl("DiagnosticSignInfo", { fg = c.blue })
  hl("DiagnosticSignHint", { fg = c.cyan })
  hl("DiagnosticVirtualTextError", { fg = c.red, bg = c.bg_alt })
  hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.bg_alt })
  hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = c.bg_alt })
  hl("DiagnosticVirtualTextHint", { fg = c.cyan, bg = c.bg_alt })
  hl("LspInlayHint", { fg = c.muted, bg = c.bg_alt })

  hl("TelescopeBorder", { fg = c.blue, bg = c.bg_alt })
  hl("TelescopeNormal", { fg = c.fg, bg = c.bg_alt })
  hl("TelescopePromptBorder", { fg = c.cyan, bg = c.bg_alt })
  hl("TelescopePromptNormal", { fg = c.fg, bg = c.bg_alt })
  hl("TelescopePromptPrefix", { fg = c.cyan, bg = c.bg_alt, bold = true })
  hl("TelescopeSelection", { fg = c.fg, bg = c.panel })
  hl("TelescopeMatching", { fg = c.yellow, bold = true })

  hl("BufferLineFill", { bg = c.bg })
  hl("BufferLineBackground", { fg = c.muted, bg = c.bg_alt })
  hl("BufferLineBufferVisible", { fg = c.muted, bg = c.bg_alt })
  hl("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
  hl("BufferLineSeparator", { fg = c.bg_alt, bg = c.bg_alt })
  hl("BufferLineIndicatorSelected", { fg = c.blue, bg = c.bg, bold = true })
  hl("BufferLineTab", { fg = c.muted, bg = c.bg_alt })
  hl("BufferLineTabSelected", { fg = c.fg, bg = c.blue, bold = true })

  hl("NvimTreeNormal", { fg = c.fg, bg = c.bg_alt })
  hl("NvimTreeEndOfBuffer", { fg = c.bg_alt, bg = c.bg_alt })
  hl("NvimTreeRootFolder", { fg = c.cyan, bold = true })
  hl("NvimTreeFolderName", { fg = c.fg })
  hl("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
  hl("NvimTreeIndentMarker", { fg = c.muted })
  hl("NvimTreeSymlink", { fg = c.yellow })

  hl("GitSignsAdd", { fg = c.green })
  hl("GitSignsChange", { fg = c.yellow })
  hl("GitSignsDelete", { fg = c.red })

  hl("StatusLine", { fg = c.fg, bg = c.bg_alt })
  hl("StatusLineNC", { fg = c.muted, bg = c.bg })
end

local function section(fg, bg, bold)
  return { fg = fg, bg = bg, gui = bold and "bold" or "none" }
end

function M.lualine_theme()
  local c = M.colors
  return {
    normal = {
      a = section(c.bg, c.blue, true),
      b = section(c.fg, c.bg_alt, false),
      c = section(c.fg, c.bg, false),
    },
    insert = {
      a = section(c.bg, c.cyan, true),
      b = section(c.fg, c.bg_alt, false),
      c = section(c.fg, c.bg, false),
    },
    visual = {
      a = section(c.bg, c.yellow, true),
      b = section(c.fg, c.bg_alt, false),
      c = section(c.fg, c.bg, false),
    },
    replace = {
      a = section(c.bg, c.red, true),
      b = section(c.fg, c.bg_alt, false),
      c = section(c.fg, c.bg, false),
    },
    command = {
      a = section(c.bg, c.green, true),
      b = section(c.fg, c.bg_alt, false),
      c = section(c.fg, c.bg, false),
    },
    inactive = {
      a = section(c.muted, c.bg, false),
      b = section(c.muted, c.bg, false),
      c = section(c.muted, c.bg, false),
    },
  }
end

return M

