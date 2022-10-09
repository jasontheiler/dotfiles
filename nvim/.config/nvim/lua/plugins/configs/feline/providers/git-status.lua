local Job = require("plenary/job")

local M = {}

local ahead = 0
local behind = 0

if _G.feline_git_status_timer then
  _G.feline_git_status_timer:stop()
else
  _G.feline_git_status_timer = vim.loop.new_timer()
end

_G.feline_git_status_timer:start(0, 5000, vim.schedule_wrap(function()
  Job:new({
    command = "git",
    args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
    on_exit = function(job)
      local res = job:result()[1]

      if type(res) ~= "string" then
        ahead = 0
        behind = 0
        return
      end

      ahead, behind = res:match("(%d+)%s+(%d+)")
      ahead = tonumber(ahead) or 0
      behind = tonumber(behind) or 0
    end
  }):start()
end))

M.provider = function()
  if not vim.b.gitsigns_head then
    return ""
  end

  local s = vim.b.gitsigns_head

  if ahead ~= 0 or behind ~= 0 then
    s = s .. " "

    if behind ~= 0 then
      s = s .. behind .. "↓"
    end

    if ahead ~= 0 then
      s = s .. ahead .. "↑"
    end
  end

  return s
end

return M
