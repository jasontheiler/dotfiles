local Job = require("plenary/job")
local utils = require("utils")

local M = {}

local ahead = 0
local behind = 0

local reset_ahead_behind = function()
  ahead = 0
  behind = 0
end

local feline_git_status_augroup = vim.api.nvim_create_augroup("feline_git_status", {})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = feline_git_status_augroup,
    callback = function()
      if _G.feline_git_status_timer then
        _G.feline_git_status_timer:stop()
      end

      local buf_name = vim.api.nvim_buf_get_name(0)

      if vim.fn.filereadable(buf_name) == 0 then
        reset_ahead_behind()
        return
      end

      _G.feline_git_status_timer = vim.loop.new_timer()
      _G.feline_git_status_timer:start(0, 5000, vim.schedule_wrap(function()
        Job:new({
            cwd = vim.fn.fnamemodify(buf_name, ":p:h"),
            command = "git",
            args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
            on_exit = function(job)
              local res = job:result()[1]

              if type(res) ~= "string" then
                reset_ahead_behind()
                return
              end

              ahead, behind = res:match("(%d+)%s+(%d+)")
              ahead = tonumber(ahead) or 0
              behind = tonumber(behind) or 0
            end
        }):start()
      end))
    end,
})

M.provider = function()
  if not vim.b.gitsigns_head then
    return ""
  end

  local s = utils.truncate(vim.b.gitsigns_head, 24)

  if ahead ~= 0 or behind ~= 0 then
    s = s .. " "

    if ahead ~= 0 then
      s = s .. "↑" .. ahead
    end

    if behind ~= 0 then
      s = s .. "↓" .. behind
    end
  end

  return s
end

return M
