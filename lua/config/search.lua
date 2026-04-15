local M = {}

local fd_common = {
  "fd",
  "--hidden",
  "--follow",
  "--exclude",
  ".git",
  "--exclude",
  "node_modules",
  "--exclude",
  ".cache",
  "--exclude",
  "dist",
  "--exclude",
  "build",
  "--exclude",
  "target",
  "--exclude",
  ".venv",
  "--exclude",
  "venv",
}

local function builtin()
  return require("telescope.builtin")
end

local function git_root()
  local git = vim.fs.find(".git", { path = vim.loop.cwd(), upward = true })[1]
  if not git then
    vim.notify("Not inside a git repository", vim.log.levels.WARN, { title = "Git search" })
    return nil
  end

  return vim.fn.fnamemodify(git, ":h")
end

function M.explorer()
  local path = vim.fn.expand("%:p:h")
  if path == "" or path == vim.fn.expand("%:p") then
    path = vim.loop.cwd()
  end

  require("telescope").extensions.file_browser.file_browser({
    path = path,
    cwd_to_path = true,
    hidden = true,
    grouped = true,
    select_buffer = true,
    prompt_path = true,
  })
end

function M.files()
  builtin().find_files({
    prompt_title = "Files",
    hidden = true,
    previewer = false,
    find_command = vim.list_extend({
      "fd",
      "--type",
      "f",
    }, fd_common),
  })
end

function M.dirs()
  local cwd = vim.loop.cwd()
  require("telescope").extensions.file_browser.folder_browser({
    cwd = cwd,
    cwd_to_path = true,
    hidden = true,
    grouped = true,
    prompt_path = true,
  })
end

function M.grep()
  builtin().live_grep({
    prompt_title = "Text",
    previewer = false,
  })
end

function M.buffers()
  builtin().buffers({
    prompt_title = "Buffers",
    previewer = false,
  })
end

function M.recent()
  builtin().oldfiles({
    prompt_title = "Recent Files",
    previewer = false,
  })
end

function M.help()
  builtin().help_tags({
    prompt_title = "Help",
    previewer = false,
  })
end

function M.keymaps()
  builtin().keymaps({
    prompt_title = "Keymaps",
    previewer = false,
  })
end

function M.buffer_search()
  builtin().current_buffer_fuzzy_find({
    prompt_title = "Current Buffer",
    previewer = false,
  })
end

function M.git_files()
  local cwd = git_root()
  if not cwd then
    return
  end

  builtin().git_files({
    prompt_title = "Git Files",
    cwd = cwd,
    previewer = false,
  })
end

function M.git_status()
  local cwd = git_root()
  if not cwd then
    return
  end

  builtin().git_status({
    prompt_title = "Git Status",
    cwd = cwd,
    previewer = false,
  })
end

function M.git_branches()
  local cwd = git_root()
  if not cwd then
    return
  end

  builtin().git_branches({
    prompt_title = "Git Branches",
    cwd = cwd,
    previewer = false,
  })
end

function M.diffview_open()
  if not git_root() then
    return
  end

  vim.cmd("DiffviewOpen")
end

function M.toggle_blame()
  if not git_root() then
    return
  end

  require("gitsigns").toggle_current_line_blame()
end

return M
