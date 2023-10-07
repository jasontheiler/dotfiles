local whitelist = {
  "lua_ls",
  "null-ls",
  "rust_analyzer",
}

return function(lsp)
  print(lsp.name)
  return vim.tbl_contains(whitelist, lsp.name)
end
