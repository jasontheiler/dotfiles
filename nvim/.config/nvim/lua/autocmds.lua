local default_augroup = vim.api.nvim_create_augroup("default", {})

vim.api.nvim_create_autocmd({ "BufEnter", "ModeChanged" }, {
  group = default_augroup,
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local mode_hl_suffixes = {
      ["v"] = "Visual",
      ["V"] = "Visual",
      ["Vs"] = "Visual",
      ["\22"] = "Visual",
      ["\22s"] = "Visual",
      ["s"] = "Visual",
      ["S"] = "Visual",
      ["\19"] = "Visual",
      ["i"] = "Insert",
      ["ic"] = "Insert",
      ["ix"] = "Insert",
      ["r"] = "Replace",
      ["R"] = "Replace",
      ["Rc"] = "Replace",
      ["Rx"] = "Replace",
      ["Rv"] = "Replace",
      ["Rvc"] = "Replace",
      ["Rvx"] = "Replace",
    }
    local hl_exists, hl = pcall(
      vim.api.nvim_get_hl_by_name,
      "CursorLineNr" .. (mode_hl_suffixes[mode] or "Normal"),
      true
    )
    if hl_exists then
      vim.api.nvim_set_hl(0, "CursorLineNr", hl)
    end
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  group = default_augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 250 })
  end,
})

-- vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
--   group = default_augroup,
--   callback = function(data)
--     if _G.cmdline_auto_clear_timer then
--       _G.cmdline_auto_clear_timer:stop()
--     end
--
--     if data.event == "CmdlineLeave" then
--       _G.cmdline_auto_clear_timer = vim.defer_fn(function()
--         vim.api.nvim_echo({ { "" } }, false, {})
--       end, 3000)
--     end
--   end,
-- })
