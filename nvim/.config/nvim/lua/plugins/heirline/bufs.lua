local utils = require("utils")

local M = {}
local bufs = {}

--- Gets all buffers.
---
--- @return number[]
M.get_all = function()
  return bufs
end

--- Gets the index of the specified buffer.
---
--- @param buf number The buffer handle.
--- @return number|nil
M.get_index = function(buf)
  for i, v in ipairs(bufs) do
    if v == buf then
      return i
    end
  end
  return nil
end

local set_keymaps = function(index, which_key_ignore)
  if index > 9 then
    return
  end

  utils.keymap("n", "<leader>" .. index, function()
    local buf = bufs[index]
    if buf ~= nil then
      vim.api.nvim_win_set_buf(0, buf)
    end
  end, which_key_ignore and "which_key_ignore" or "Buffer " .. index)
  utils.keymap("n", "<leader>b" .. index, function()
    local buf = vim.api.nvim_win_get_buf(0)
    local index_current = M.get_index(buf)
    if index <= #bufs then
      table.remove(bufs, index_current)
      table.insert(bufs, index, buf)
      vim.cmd.redrawtabline()
    end
  end, which_key_ignore and "which_key_ignore" or "Move current to index " .. index)
end

for i = 1, 9 do
  set_keymaps(i, true)
end

utils.keymap("n", "<leader>bw", ":bp<CR>", "Previous")

local augroup_heirline_bufs = vim.api.nvim_create_augroup("user_heirline_bufs", {})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = augroup_heirline_bufs,
  callback = function()
    vim.schedule(function()
      bufs = vim.tbl_filter(function(buf)
        local file_name = vim.api.nvim_buf_get_name(buf)
        local buflisted = vim.api.nvim_get_option_value("buflisted", { buf = buf })
        return file_name ~= "" and buflisted
      end, vim.api.nvim_list_bufs())
      for i = 1, #bufs do
        set_keymaps(i)
      end
    end)
  end,
})

vim.api.nvim_create_autocmd({ "BufAdd" }, {
  group = augroup_heirline_bufs,
  callback = function(event)
    local index = M.get_index(event.buf)
    if event.file ~= "" and index == nil then
      table.insert(bufs, event.buf)
      set_keymaps(#bufs)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufDelete" }, {
  group = augroup_heirline_bufs,
  callback = function(event)
    local index = M.get_index(event.buf)
    if index ~= nil then
      set_keymaps(#bufs, true)
      table.remove(bufs, index)
    end
  end,
})

return M
