local M = {}

local modes = {
  ["n"] = { text = "NORMAL" },
  ["no"] = { text = "O-PENDING" },
  ["nov"] = { text = "O-PENDING" },
  ["noV"] = { text = "O-PENDING" },
  ["no\22"] = { text = "O-PENDING" },
  ["niI"] = { text = "NORMAL" },
  ["niR"] = { text = "NORMAL" },
  ["niV"] = { text = "NORMAL" },
  ["nt"] = { text = "NORMAL" },
  ["ntT"] = { text = "NORMAL" },
  ["v"] = { text = "VISUAL", hl = "FelineSLViModeVisual" },
  ["vs"] = { text = "VISUAL", hl = "FelineSLViModeVisual" },
  ["V"] = { text = "V-LINE", hl = "FelineSLViModeVisual" },
  ["Vs"] = { text = "V-LINE", hl = "FelineSLViModeVisual" },
  ["\22"] = { text = "V-BLOCK", hl = "FelineSLViModeVisual" },
  ["\22s"] = { text = "V-BLOCK", hl = "FelineSLViModeVisual" },
  ["s"] = { text = "SELECT", hl = "FelineSLViModeVisual" },
  ["S"] = { text = "S-LINE", hl = "FelineSLViModeVisual" },
  ["\19"] = { text = "S-BLOCK", hl = "FelineSLViModeVisual" },
  ["i"] = { text = "INSERT", hl = "FelineSLViModeInsert" },
  ["ic"] = { text = "INSERT", hl = "FelineSLViModeInsert" },
  ["ix"] = { text = "INSERT", hl = "FelineSLViModeInsert" },
  ["R"] = { text = "REPLACE", hl = "FelineSLViModeReplace" },
  ["Rc"] = { text = "REPLACE", hl = "FelineSLViModeReplace" },
  ["Rx"] = { text = "REPLACE", hl = "FelineSLViModeReplace" },
  ["Rv"] = { text = "V-REPLACE", hl = "FelineSLViModeReplace" },
  ["Rvc"] = { text = "V-REPLACE", hl = "FelineSLViModeReplace" },
  ["Rvx"] = { text = "V-REPLACE", hl = "FelineSLViModeReplace" },
  ["c"] = { text = "COMMAND", hl = "FelineSLViModeCommand" },
  ["cv"] = { text = "EX" },
  ["ce"] = { text = "EX" },
  ["r"] = { text = "REPLACE", hl = "FelineSLViModeReplace" },
  ["rm"] = { text = "MORE" },
  ["r?"] = { text = "CONFIRM" },
  ["!"] = { text = "SHELL", hl = "FelineSLViModeCommand" },
  ["t"] = { text = "TERMINAL", hl = "FelineSLViModeCommand" },
}

M.provider = function()
  return modes[vim.fn.mode()].text
end

M.hl = function()
  return modes[vim.fn.mode()].hl or "FelineSLViModeNormal"
end

M.sep_hl = function()
  return (modes[vim.fn.mode()].hl or "FelineSLViModeNormal") .. "ToSeg0"
end

return M
