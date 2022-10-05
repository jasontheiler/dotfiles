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
  ["i"] = { text = "INSERT", hl = "FelineSLViModePink" },
  ["ic"] = { text = "INSERT", hl = "FelineSLViModePink" },
  ["ix"] = { text = "INSERT", hl = "FelineSLViModePink" },
  ["R"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["Rc"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["Rx"] = { text = "REPLACE", hl = "FelineSLViModeRed" },
  ["Rv"] = { text = "V-REPLACE", hl = "FelineSLViModeRed" },
  ["Rvc"] = { text = "V-REPLACE", hl = "FelineSLViModeRed" },
  ["Rvx"] = { text = "V-REPLACE", hl = "FelineSLViModeRed" },
  ["c"] = { text = "COMMAND", hl = "FelineSLViModeYellow" },
  ["cv"] = { text = "EX" },
  ["ce"] = { text = "EX" },
  ["r"] = { text = "REPLACE" },
  ["rm"] = { text = "MORE", hl = "FelineSLViModeBlue" },
  ["r?"] = { text = "CONFIRM" },
  ["!"] = { text = "SHELL", hl = "FelineSLViModeGreen" },
  ["t"] = { text = "TERMINAL", hl = "FelineSLViModeGreen" },
}

M.provider = function()
  return modes[vim.fn.mode()].text
end

M.hl = function()
  return modes[vim.fn.mode()].hl or "FelineSLViModeCyan"
end

M.sep_hl = function()
  return (modes[vim.fn.mode()].hl or "FelineSLViModeCyan") .. "ToSeg0"
end

return M
