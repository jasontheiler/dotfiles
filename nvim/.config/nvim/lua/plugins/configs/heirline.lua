local heirline = require("heirline")
local heirline_conditions = require("heirline/conditions")

-- See: https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md
heirline.setup({
  statusline = {},
  winbar = {
    { provider = "%=" },
    {
      provider = function()
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
        if filename == "" then
          return filename
        end

        local s = ""

        if vim.bo.readonly or not vim.bo.modifiable then
          s = " "
        end

        if not filename:find("^/") then
          s = s .. "./"
        end
        s = s .. filename

        if vim.bo.modified then
          s = s .. " ●"
        end

        return s
      end,
      hl = function()
        if heirline_conditions.is_active() then
          return "HeirlineWinbar"
        else
          return "HeirlineWinbarInactive"
        end
      end,
    }
  },
})
