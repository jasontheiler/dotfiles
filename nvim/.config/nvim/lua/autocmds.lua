local default_augroup = vim.api.nvim_create_augroup("default", {})

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
