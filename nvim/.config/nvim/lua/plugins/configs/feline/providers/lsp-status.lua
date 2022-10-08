local lsp_status = require("lsp-status")

local M = {}

lsp_status.register_progress()

M.provider = function()
  local client_statuses = {}

  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    table.insert(client_statuses, client.name)
    client_statuses[client.name] = {}
  end

  for _, msg in pairs(lsp_status.messages()) do
    if msg.progress then
      local client_status = msg.title

      if msg.message then
        client_status = client_status .. ": " .. msg.message
      end

      table.insert(client_statuses[msg.name], client_status)
    else
      table.insert(client_statuses[msg.name], msg.content)
    end
  end

  local s = ""

  for i, client_name in ipairs(client_statuses) do
    s = s .. client_name

    if #(client_statuses[client_name]) >= 1 then
      s = s .. " (" .. table.concat(client_statuses[client_name], "; ") .. ")"
    end

    if i < #client_statuses then
      s = s .. "  "
    end
  end

  return s
end

return M
