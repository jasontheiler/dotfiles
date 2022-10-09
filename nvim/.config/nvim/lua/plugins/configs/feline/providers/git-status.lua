local M = {}

M.provider = function()
  if not vim.b.gitsigns_head then
    return ""
  end

  -- local lines = vim.fn.systemlist("git status --porcelain=2 --branch")

  local ahead = 0
  local behind = 0

  -- for _, line in pairs(lines) do
  --   if line:find("branch.ab") then
  --     ahead, behind = line:match("%+(%d+)%s+%-(%d+)")
  --     ahead = tonumber(ahead) or 0
  --     behind = tonumber(behind) or 0
  --   end
  -- end

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
