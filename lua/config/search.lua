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

local function actions()
  return require("telescope.actions")
end

local function action_state()
  return require("telescope.actions.state")
end

function M.explorer()
  vim.cmd("Oil")
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
  builtin().find_files({
    prompt_title = "Directories",
    hidden = true,
    previewer = false,
    find_command = vim.list_extend({
      "fd",
      "--type",
      "d",
    }, fd_common),
    attach_mappings = function(prompt_bufnr)
      local telescope_actions = actions()
      local telescope_state = action_state()

      telescope_actions.select_default:replace(function()
        local entry = telescope_state.get_selected_entry()
        telescope_actions.close(prompt_bufnr)

        if entry and entry.path then
          vim.cmd("Oil " .. vim.fn.fnameescape(entry.path))
        end
      end)

      return true
    end,
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

return M
