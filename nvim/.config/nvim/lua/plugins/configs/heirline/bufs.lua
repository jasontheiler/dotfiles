local utils = require("utils")

local M = {}
local bufs = {}

M.get_all = function()
  return bufs
end

M.get_index = function(buf)
  for i, v in ipairs(bufs) do
    if v == buf then
      return i
    end
  end
  return nil
end

local augroup_heirline_bufs = vim.api.nvim_create_augroup("heirline_bufs", {})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = augroup_heirline_bufs,
  callback = function()
    vim.schedule(function()
      bufs = vim.tbl_filter(function(buf)
        local name = vim.api.nvim_buf_get_name(buf)
        local is_listed = vim.api.nvim_get_option_value("buflisted", { buf = buf })
        return name ~= "" and is_listed
      end, vim.api.nvim_list_bufs())
    end)
  end,
})

vim.api.nvim_create_autocmd({ "BufAdd" }, {
  group = augroup_heirline_bufs,
  callback = function(data)
    if data.file ~= "" and M.get_index(data.buf) == nil then
      table.insert(bufs, data.buf)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufDelete" }, {
  group = augroup_heirline_bufs,
  callback = function(data)
    local index = M.get_index(data.buf)
    if index ~= nil then
      table.remove(bufs, index)
    end
  end,
})

for i = 1, 9 do
  utils.keymap("n", "<leader>" .. i, function()
    local buf = bufs[i]
    if buf ~= nil then
      vim.api.nvim_win_set_buf(0, buf)
    end
  end, "Buffer " .. i)
  utils.keymap("n", "<leader>b" .. i, function()
    local buf = vim.api.nvim_win_get_buf(0)
    local index = M.get_index(buf)
    table.remove(bufs, index)
    table.insert(bufs, i, buf)
    vim.cmd.redrawtabline()
  end, "Current buffer to " .. i)
end

return M
