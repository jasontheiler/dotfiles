vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.diagnostic.is_enabled({ bufnr = 0 }) then
    vim.diagnostic.enable(false, { bufnr = 0 })
    vim.notify("Disabled diagnostics", vim.log.levels.INFO)
  else
    vim.diagnostic.enable(true, { bufnr = 0 })
    vim.notify("Enabled diagnostics", vim.log.levels.INFO)
  end
end, {})
