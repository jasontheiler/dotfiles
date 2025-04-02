local M = {}

local bufs = {}

--- Gets all buffers.
---
--- @return number[]
function M.get_all()
  return bufs
end

--- Gets the index of the specified buffer.
---
--- @param buf number The buffer handle.
--- @return number|nil
function M.get_index(buf)
  for i, v in ipairs(bufs) do
    if v == buf then
      return i
    end
  end
  return nil
end

local function set_keymaps(index, which_key_ignore)
  if index > 9 then
    return
  end

  vim.keymap.set("n", "<Leader>" .. index, function()
    local buf = bufs[index]
    if buf ~= nil then
      vim.api.nvim_win_set_buf(0, buf)
    end
  end, { desc = which_key_ignore and "which_key_ignore" or "Buffer " .. index })
  vim.keymap.set("n", "<Leader>b" .. index, function()
    local buf = vim.api.nvim_win_get_buf(0)
    local index_current = M.get_index(buf)
    if index <= #bufs then
      table.remove(bufs, index_current)
      table.insert(bufs, index, buf)
      vim.cmd.redrawtabline()
    end
  end, { desc = which_key_ignore and "which_key_ignore" or "Move current to index " .. index })
end

for i = 1, 9 do
  set_keymaps(i, true)
end

vim.keymap.set("n", "<Leader>bw", ":bp<CR>", { silent = true, desc = "Previous" })

local augroup_bufs = vim.api.nvim_create_augroup("user_bufs", {})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = augroup_bufs,
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
  group = augroup_bufs,
  callback = function(event)
    local index = M.get_index(event.buf)
    if event.file ~= "" and index == nil then
      table.insert(bufs, event.buf)
      set_keymaps(#bufs)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufDelete" }, {
  group = augroup_bufs,
  callback = function(event)
    local index = M.get_index(event.buf)
    if index ~= nil then
      set_keymaps(#bufs, true)
      table.remove(bufs, index)
    end
  end,
})

return M
