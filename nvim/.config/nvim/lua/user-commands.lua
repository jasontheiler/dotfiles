vim.api.nvim_create_user_command("Update", function()
  local is_lazy_installed, lazy = pcall(require, "lazy")
  if is_lazy_installed then
    lazy.sync()
  end

  local is_treesitter_installed = pcall(require, "nvim-treesitter")
  if is_treesitter_installed then
    vim.api.nvim_command("TSUpdate")
  end

  local is_mason_installed, mason_registry = pcall(require, "mason-registry")
  -- See: https://github.com/RubixDev/mason-update-all/blob/main/lua/mason-update-all/init.lua
  if is_mason_installed then
    local packages = mason_registry.get_installed_packages()
    local has_new_versions = false
    local running_updates = 0

    for _, package in pairs(packages) do
      package:check_new_version(function(is_new_version_available, version)
        if is_new_version_available then
          has_new_versions = true
          running_updates = running_updates + 1

          vim.notify(string.format(
            "Updating Mason package `%s` from v%s to v%s",
            package.name,
            version.current_version,
            version.latest_version
          ), vim.log.levels.INFO)

          package:install():on("close", function()
            vim.notify(string.format(
              "Updated Mason package `%s` from v%s to v%s",
              package.name,
              version.current_version,
              version.latest_version
            ), vim.log.levels.INFO)

            running_updates = running_updates - 1

            if running_updates == 0 then
              vim.notify("All Mason packages are up-to-date!", vim.log.levels.INFO)
            end
          end)
        end
      end)
    end

    if not has_new_versions then
      vim.notify("All Mason packages are up-to-date!", vim.log.levels.INFO)
    end
  end
end, {})

vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    vim.notify("Disabled diagnostics", vim.log.levels.INFO)
  else
    vim.diagnostic.enable()
    vim.notify("Enabled diagnostics", vim.log.levels.INFO)
  end
end, {})
