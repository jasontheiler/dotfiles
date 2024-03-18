local heirline = require("heirline")
local heirline_conditions = require("heirline/conditions")
local heirline_utils = require("heirline/utils")
local bufs = require("plugins/configs/heirline/bufs")

vim.opt.showtabline = 2

local bufline_buf = {
  init = function(self)
    self.filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.bufnr), ":t")
  end,
  { provider = " " },
  {
    condition = function(self)
      local is_readonly = vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
      local is_modifiable = vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
      return is_readonly or not is_modifiable
    end,
    provider = " ",
  },
  { provider = function(self) return bufs.get_index(self.bufnr) .. " " .. self.filename end },
  {
    condition = function(self)
      return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
    end,
    provider = " ●",
  },
  { provider = " " },
  hl = function(self)
    if self.is_active then
      return "HeirlineBufline"
    else
      return "HeirlineBuflineInactive"
    end
  end,
  on_click = {
    name = "user_heirline_bufline_buf_click",
    minwid = function(self) return self.bufnr end,
    callback = function(_, buf, _, button)
      if button == "l" then
        vim.api.nvim_win_set_buf(0, buf)
      end
    end,
  },
}

local bufline = {
  heirline_utils.make_buflist(
    bufline_buf,
    { provider = " <- " },
    { provider = " -> " },
    function() return bufs.get_all() end,
    false
  ),
}

local winbar = {
  condition = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    return self.filename ~= ""
  end,
  init = function(self) self.filename = vim.fn.fnamemodify(self.filename, ":.") end,
  { provider = "%=" },
  {
    condition = function() return vim.bo.readonly or not vim.bo.modifiable end,
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
    condition = function() return vim.bo.modified end,
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
  tabline = bufline,
  winbar = winbar,
  opts = {
    disable_winbar_cb = function(args)
      return heirline_conditions.buffer_matches({
        buftype = { "help", "nofile", "prompt", "quickfix" }
      }, args.buf)
    end,
  },
})
