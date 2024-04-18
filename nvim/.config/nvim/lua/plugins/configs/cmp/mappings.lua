local M = {}

M.icons = {
  Class = "",
  Color = "",
  Constant = "",
  Constructor = "󰡱",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "󰡱",
  Interface = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "󰌗",
  Operator = "",
  Property = "",
  Reference = "",
  Snippet = "",
  Struct = "",
  Table = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "󰎠",
  Variable = "",
}

M.source_icons = {
  calc = {
    Text = "󰃬",
  },
}

M.source_labels = {
  calc = {
    Text = "Calculation",
  },
}

M.filetype_icons = {}

M.filetype_labels = {
  rust = {
    Interface = "Trait",
  },
}

return M
