local heirline = require("heirline")
local heirline_conditions = require("heirline/conditions")
local heirline_utils = require("heirline/utils")
local utils = require("utils")

-- vim.opt.showtabline = 2

local augroup_heirline = vim.api.nvim_create_augroup("heirline", {})
local bufs = {}

local function get_buf_index(buf)
  for i, val in ipairs(bufs) do
    if val == buf then
      return i
    end
  end
  return nil
end

vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "UIEnter", "VimEnter" }, {
  group = augroup_heirline,
  callback = function()
    vim.schedule(function()
      local bufs_new = vim.tbl_filter(function(buf)
        return vim.api.nvim_get_option_value("buflisted", { buf = buf })
      end, vim.api.nvim_list_bufs())

      for _, val in ipairs(bufs_new) do
        if not vim.tbl_contains(bufs, val) then
          table.insert(bufs, val)
        end
      end

      for i, val in ipairs(bufs) do
        if not vim.tbl_contains(bufs_new, val) then
          table.remove(bufs, i)
        end
      end
    end)
  end,
})

for i = 1, 9 do
  utils.keymap("n", "<leader>" .. i, function()
    local buf = bufs[i]
    if buf ~= nil then
      vim.api.nvim_win_set_buf(0, buf)
    end
  end, "which_key_ignore")
  utils.keymap("n", "<leader>b" .. i, function()
    local buf = vim.api.nvim_win_get_buf(0)
    local index = get_buf_index(buf)
    table.remove(bufs, index)
    table.insert(bufs, i, buf)
  end, "which_key_ignore")
end

local bufline = {
  heirline_utils.make_buflist(
    {
      condition = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
        return self.filename ~= ""
      end,
      provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":t")
        return " " .. get_buf_index(self.bufnr) .. " " .. filename .. " "
      end,
    },
    {},
    {},
    function() return bufs end,
    false
  )
}

local winbar = {
  condition = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    return self.filename ~= ""
  end,
  init = function(self)
    self.filename = vim.fn.fnamemodify(self.filename, ":.")
  end,
  { provider = "%=" },
  {
    condition = function()
      return vim.bo.readonly or not vim.bo.modifiable
    end,
    provider = " ",
  },
  {
    provider = function(self)
      if self.filename:find("^/") then
        return self.filename
      else
        return "./" .. self.filename
      end
    end,
  },
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = " ●",
  },
  hl = function()
    if heirline_conditions.is_active() then
      return "HeirlineWinbar"
    else
      return "HeirlineWinbarInactive"
    end
  end,
}

-- See: https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md
heirline.setup({
  -- tabline = bufline,
  winbar = winbar,
  opts = {
    disable_winbar_cb = function(args)
      return heirline_conditions.buffer_matches({
        buftype = { "help", "nofile", "prompt", "quickfix" }
      }, args.buf)
    end,
  },
})
