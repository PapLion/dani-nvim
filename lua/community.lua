local M = {}

local uv = vim.uv or vim.loop

local function clamp(value)
  return math.max(0, math.min(255, math.floor(value + 0.5)))
end

local function hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format("#%02X%02X%02X", clamp(r), clamp(g), clamp(b))
end

function M.mix(hex_a, hex_b, ratio)
  local ar, ag, ab = hex_to_rgb(hex_a)
  local br, bg, bb = hex_to_rgb(hex_b)
  local inv = 1 - ratio
  return rgb_to_hex(ar * inv + br * ratio, ag * inv + bg * ratio, ab * inv + bb * ratio)
end

function M.shade(hex, amount)
  if amount >= 0 then
    return M.mix(hex, "#FFFFFF", amount)
  end
  return M.mix(hex, "#000000", math.abs(amount))
end

local base = {
  bg = "#282C34",
  bg_alt = "#1A1F27",
  fg = "#EBEBE6",
  muted = "#888888",
  blue = "#4076B1",
  cyan = "#38B5B5",
  red = "#FF3B30",
  yellow = "#E5C07B",
  green = "#50A14F",
}

M.palette = {
  bg = base.bg,
  bg_alt = base.bg_alt,
  surface = M.mix(base.bg, base.bg_alt, 0.55),
  surface_2 = M.mix(base.bg_alt, base.fg, 0.06),
  surface_3 = M.mix(base.bg_alt, base.fg, 0.12),
  fg = base.fg,
  muted = base.muted,
  border = M.mix(base.bg_alt, base.fg, 0.14),
  blue = base.blue,
  cyan = base.cyan,
  red = base.red,
  yellow = base.yellow,
  green = base.green,
  orange = M.mix(base.red, base.yellow, 0.5),
  purple = M.mix(base.blue, base.red, 0.45),
  magenta = M.mix(base.red, base.cyan, 0.35),
  teal = M.mix(base.cyan, base.green, 0.5),
  lime = M.mix(base.green, base.yellow, 0.35),
  sky = M.mix(base.blue, base.cyan, 0.5),
  rose = M.mix(base.red, base.fg, 0.22),
  selection = M.mix(base.bg_alt, base.blue, 0.35),
  cursor = M.mix(base.bg_alt, base.fg, 0.2),
  comment = M.mix(base.muted, base.bg, 0.5),
}

M.icons = {
  file = "FILE",
  folder = "DIR",
  branch = "BR",
  search = "FIND",
  project = "PROJ",
  git = "GIT",
  error = "E",
  warn = "W",
  info = "I",
  hint = "H",
  add = "+",
  change = "~",
  delete = "-",
}

function M.git_root(path)
  path = path or uv.cwd()
  if path == "" then
    return nil
  end
  local git = vim.fs.find(".git", { path = path, upward = true })[1]
  if not git then
    return nil
  end
  return vim.fn.fnamemodify(git, ":h")
end

function M.project_root(bufnr)
  bufnr = bufnr or 0
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then
    return M.git_root(uv.cwd()) or uv.cwd()
  end
  local dir = vim.fs.dirname(name)
  return M.git_root(dir) or dir
end

function M.set_project_cwd(bufnr)
  local root = M.project_root(bufnr)
  if root ~= "" and root ~= vim.fn.getcwd() then
    vim.cmd.cd(vim.fn.fnameescape(root))
  end
end

local function telescope()
  return require("telescope.builtin")
end

function M.find_files()
  telescope().find_files({
    cwd = M.project_root(),
    hidden = true,
    previewer = false,
  })
end

function M.live_grep()
  telescope().live_grep({
    cwd = M.project_root(),
    previewer = false,
  })
end

function M.buffers()
  telescope().buffers({ previewer = false })
end

function M.recent()
  telescope().oldfiles({ previewer = false })
end

function M.project_switcher()
  require("telescope").extensions.project.project({ display_type = "minimal" })
end

function M.help_tags()
  telescope().help_tags({ previewer = false })
end

function M.keymaps()
  telescope().keymaps({ previewer = false })
end

function M.toggle_tree()
  vim.cmd("Neotree toggle")
end

function M.focus_tree()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd("p")
  else
    vim.cmd("Neotree focus")
  end
end

function M.git_status()
  local root = M.git_root()
  if not root then
    vim.notify("Not inside a git repository", vim.log.levels.WARN, { title = "Git search" })
    return
  end
  telescope().git_status({ cwd = root, previewer = false })
end

function M.git_files()
  local root = M.git_root()
  if not root then
    vim.notify("Not inside a git repository", vim.log.levels.WARN, { title = "Git search" })
    return
  end
  telescope().git_files({ cwd = root, previewer = false })
end

function M.git_branches()
  local root = M.git_root()
  if not root then
    vim.notify("Not inside a git repository", vim.log.levels.WARN, { title = "Git search" })
    return
  end
  telescope().git_branches({ cwd = root, previewer = false })
end

function M.lazygit()
  vim.cmd("LazyGit")
end

function M.diffview_open()
  if not M.git_root() then
    vim.notify("Not inside a git repository", vim.log.levels.WARN, { title = "Git search" })
    return
  end
  vim.cmd("DiffviewOpen")
end

function M.diffview_close()
  vim.cmd("DiffviewClose")
end

function M.toggle_blame()
  if not M.git_root() then
    vim.notify("Not inside a git repository", vim.log.levels.WARN, { title = "Git search" })
    return
  end
  require("gitsigns").toggle_current_line_blame()
end

function M.find_todos()
  require("todo-comments").jump_next()
end

return M
