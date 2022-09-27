require("plugins")
require("plugins/lualine")

local cmd = vim.cmd
local opt = vim.opt
local wo = vim.wo

opt.history = 1000
opt.number = true
opt.relativenumber = true

wo.fillchars = "eob: "
