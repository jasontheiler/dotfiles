-- See: https://github.com/rebelot/heirline.nvim
return {
  "rebelot/heirline.nvim",
  config = function()
    local heirline = require("heirline")
    local heirline_conditions = require("heirline.conditions")
    local heirline_utils = require("heirline.utils")
    local bufs = require("plugins.heirline.bufs")

    vim.opt.showtabline = 2

    local bufline_buf = {
      init = function(self)
        self.file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.bufnr), ":t")
      end,
      { provider = " " },
      {
        condition = function(self)
          local readonly = vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
          local modifiable = vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
          return readonly or not modifiable
        end,
        provider = " ",
      },
      { provider = function(self) return bufs.get_index(self.bufnr) .. " " .. self.file_name end },
      {
        condition = function(self)
          return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
        end,
        provider = " ●",
      },
      { provider = " " },
      hl = function(self)
        if self.is_active then
          return "HeirlineBuflineBuf"
        else
          return "HeirlineBuflineBufInactive"
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
        bufs.get_all,
        false
      ),
      { provider = "%=" },
      hl = "HeirlineBufline",
    }

    local winbar = {
      condition = function(self)
        self.file_name = vim.api.nvim_buf_get_name(0)
        return self.file_name ~= ""
      end,
      init = function(self)
        self.file_name = vim.fn.fnamemodify(self.file_name, ":.")
      end,
      { provider = "%=" },
      {
        condition = function()
          local readonly = vim.api.nvim_get_option_value("readonly", { buf = 0 })
          local modifiable = vim.api.nvim_get_option_value("modifiable", { buf = 0 })
          return readonly or not modifiable
        end,
        provider = " ",
      },
      { provider = function(self) return self.file_name end },
      {
        condition = function() return vim.api.nvim_get_option_value("modified", { buf = 0 }) end,
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
  end,
}
