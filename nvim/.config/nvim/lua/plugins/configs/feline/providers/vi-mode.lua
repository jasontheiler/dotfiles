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
  ["v"] = { text = "VISUAL", hl = "FelineSLViModeMagenta" },
  ["vs"] = { text = "VISUAL", hl = "FelineSLViModeMagenta" },
  ["V"] = { text = "V-LINE", hl = "FelineSLViModeMagenta" },
  ["Vs"] = { text = "V-LINE", hl = "FelineSLViModeMagenta" },
  ["\22"] = { text = "V-BLOCK", hl = "FelineSLViModeMagenta" },
  ["\22s"] = { text = "V-BLOCK", hl = "FelineSLViModeMagenta" },
  ["s"] = { text = "SELECT", hl = "FelineSLViModeMagenta" },
  ["S"] = { text = "S-LINE", hl = "FelineSLViModeMagenta" },
  ["\19"] = { text = "S-BLOCK", hl = "FelineSLViModeMagenta" },
  ["i"] = { text = "INSERT", hl = "FelineSLViModeGreen" },
  ["ic"] = { text = "INSERT", hl = "FelineSLViModeGreen" },
  ["ix"] = { text = "INSERT", hl = "FelineSLViModeGreen" },
  ["R"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["Rc"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["Rx"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["Rv"] = { text = "V-REPLACE", hl = "FelineSLViModeRed" },
  ["Rvc"] = { text = "V-REPLACE", hl = "FelineSLViModeRed" },
  ["Rvx"] = { text = "V-REPLACE", hl = "FelineSLViModeRed" },
  ["c"] = { text = "COMMAND", hl = "FelineSLViModeCyan" },
  ["cv"] = { text = "EX" },
  ["ce"] = { text = "EX" },
  ["r"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["rm"] = { text = "MORE", hl = "FelineSLViModeBlue" },
  ["r?"] = { text = "CONFIRM" },
  ["!"] = { text = "SHELL", hl = "FelineSLViModeGreen" },
  ["t"] = { text = "TERMINAL", hl = "FelineSLViModeGreen" },
}

M.provider = function()
  return modes[vim.fn.mode()].text
end

M.hl = function()
  return modes[vim.fn.mode()].hl or "FelineSLViModeYellow"
end

M.sep_hl = function()
  return (modes[vim.fn.mode()].hl or "FelineSLViModeYellow") .. "ToSeg0"
end

return M
