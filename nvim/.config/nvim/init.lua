if vim.fn.has("nvim-0.12") == 0 then
  error("The loaded configuration requires Neovim >= 0.12")
end

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = "a"
vim.opt.shortmess = "oOtTICF"
vim.opt.shadafile = "NONE"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.colorcolumn = { 80, 100, 120 }
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·" }
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.winborder = "rounded"
vim.opt.fillchars = { stl = "─", stlnc = "─" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.statusline = "%="
vim.opt.showtabline = 2
vim.opt.tabline = "%{%v:lua.custom_tabline()%}"
vim.opt.winbar = "%{%v:lua.custom_winbar()%}"

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { prefix = "▌" },
})

vim.filetype.add({
  pattern = {
    [".*[tT]iltfile"] = "starlark",
    ["ghostty/(themes/.+|config)"] = "config",
  },
})

--- @type number[]
local bufs = {}

--- Surrounds the specified text with flags for the specified buffer.
---
--- @param buf number The buffer handle.
--- @param text string The text to be surrounded with flags.
--- @return string
local function with_flags(buf, text)
  local readonly = vim.api.nvim_get_option_value("readonly", { buf = buf })
  local modifiable = vim.api.nvim_get_option_value("modifiable", { buf = buf })
  if readonly or not modifiable then
    text = " " .. text
  end
  if vim.api.nvim_get_option_value("modified", { buf = buf }) then
    text = text .. " ●"
  end
  return text
end

function _G.custom_tabline()
  local s = ""
  local buf_current = vim.api.nvim_win_get_buf(0)
  for i, buf in ipairs(bufs) do
    s = s .. "%" .. buf .. "@v:lua.custom_tabline_on_click@"
    if buf == buf_current then
      s = s .. "%#TabLineSel#"
    end
    local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
    s = s .. " " .. with_flags(buf, string.format("%d %s", i, file_name)) .. " %*%T"
  end
  return s
end

function _G.custom_tabline_on_click(buf)
  vim.api.nvim_win_set_buf(0, buf)
end

function _G.custom_winbar()
  local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
  if file_name == "" then
    return ""
  end
  local cursor = vim.api.nvim_win_get_cursor(0)
  return "%=" .. with_flags(0, string.format("%s:%d:%d", file_name, unpack(cursor)))
end

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/catppuccin/nvim",                 name = "catppuccin" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/tpope/vim-sleuth",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-mini/mini.notify",
  "https://github.com/nvim-telescope/telescope.nvim",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/stevearc/conform.nvim",
})

require("catppuccin").setup({
  flavour = "mocha",
  styles = {
    conditionals = {},
    miscs = {},
  },
  integrations = {
    native_lsp = {
      underlines = {
        errors = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
        hints = { "undercurl" },
      },
    },
  },
  color_overrides = {
    mocha = {            -- Ocean Foam
      green = "#73E9CD", -- terminal green, terminal bright green
    },
    -- mocha = {                -- Cocoa
    --   rosewater = "#DAA992", --
    --   flamingo = "#DAA992",  --
    --   pink = "#C386BB",      -- terminal magenta, terminal bright magenta
    --   mauve = "#C386BB",     --
    --   red = "#EA6962",       -- terminal red, terminal bright red
    --   maroon = "#D3869B",    --
    --   peach = "#DD7F4E",     --
    --   yellow = "#E8C677",    -- terminal yellow, terminal bright yellow
    --   green = "#A9B665",     -- terminal green, terminal bright green
    --   teal = "#89B482",      -- terminal cyan, terminal bright cyan
    --   sky = "#89B482",       --
    --   sapphire = "#89B482",  --
    --   blue = "#7DAEB3",      -- terminal blue, terminal bright blue
    --   lavender = "#BDAEC3",  --
    --   text = "#E4CEA8",      -- terminal white, terminal bright white, terminal foreground, terminal cursor
    --   subtext1 = "#DCC6A0",  --
    --   subtext0 = "#D4BE98",  --
    --   overlay2 = "#877360",  -- punctuation, brackets
    --   overlay1 = "#7D6C60",  --
    --   overlay0 = "#75615B",  -- comments
    --   surface2 = "#615556",  --
    --   surface1 = "#534747",  -- line numbers, selection, terminal black, terminal bright black
    --   surface0 = "#433737",  --
    --   base = "#211D1D",      -- terminal background
    --   mantle = "#191414",    --
    --   crust = "#110D0D",     --
    -- },
    -- mocha = {                -- Neo
    --   rosewater = "#FFCDCD", --
    --   flamingo = "#FFCDCD",  --
    --   pink = "#E3AAFF",      -- terminal magenta, terminal bright magenta
    --   mauve = "#E3AAFF",     --
    --   red = "#fF87BC",       -- terminal red, terminal bright red
    --   maroon = "#F394B8",    --
    --   peach = "#FFB7AB",     --
    --   yellow = "#F9E6C0",    -- terminal yellow, terminal bright yellow
    --   green = "#B3F6C0",     -- terminal green, terminal bright green
    --   teal = "#8CF8F7",      -- terminal cyan, terminal bright cyan
    --   sky = "#8CF8F7",       --
    --   sapphire = "#8CF8F7",  --
    --   blue = "#A6DBFF",      -- terminal blue, terminal bright blue
    --   lavender = "#C4BEFF",  --
    --   text = "#E0E2EA",      -- terminal white, terminal bright white, terminal foreground, terminal cursor
    --   subtext1 = "#B9BCC7",  --
    --   subtext0 = "#A5A8B5",  --
    --   overlay2 = "#9295A4",  -- punctuation, brackets
    --   overlay1 = "#7E8192",  --
    --   overlay0 = "#6B6D81",  -- comments
    --   surface2 = "#585A6F",  --
    --   surface1 = "#45475D",  -- line numbers, selection, terminal black, terminal bright black
    --   surface0 = "#32334B",  --
    --   base = "#14161B",      -- terminal background
    --   mantle = "#0C0E13",    --
    --   crust = "#04060B",     --
    -- },
  },
  highlight_overrides = {
    mocha = function(palette)
      return {
        BlinkCmpLabel = { link = "Pmenu" },
        BlinkCmpLabelDeprecated = { link = "NonText" },
        BlinkCmpLabelMatch = { fg = palette.blue },
        BlinkCmpMenuBorder = { link = "Pmenu" },
        BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
        BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
        CursorLineNrNormal = { fg = palette.blue, style = { "bold" } },
        CursorLineNrVisual = { fg = palette.pink, style = { "bold" } },
        CursorLineNrInsert = { fg = palette.green, style = { "bold" } },
        CursorLineNrReplace = { fg = palette.red, style = { "bold" } },
        CursorLineNrCommand = { fg = palette.peach, style = { "bold" } },
        DiagnosticSignDebug = { style = { "bold" } },
        DiagnosticSignError = { style = { "bold" } },
        DiagnosticSignInfo = { style = { "bold" } },
        DiagnosticSignWarn = { style = { "bold" } },
        FloatBorder = { fg = palette.text, bg = palette.none },
        FloatTitle = { link = "FloatBorder" },
        NonText = { fg = palette.surface1 },
        NormalFloat = { fg = palette.text, bg = palette.none },
        Pmenu = { link = "FloatBorder" },
        PmenuSbar = { bg = palette.text },
        PmenuSel = { fg = palette.text, bg = palette.surface1, style = { "bold" } },
        PmenuThumb = { link = "PmenuSbar" },
        StatusLine = { link = "VertSplit" },
        StatusLineNC = { link = "VertSplit" },
        TabLineFill = { fg = palette.surface1, bg = palette.base },
        TabLineSel = { fg = palette.text, style = { "bold" } },
        TelescopePromptPrefix = { fg = palette.green, style = { "bold" } },
        TelescopeSelection = { link = "PmenuSel" },
        TelescopeSelectionCaret = { fg = palette.blue, bg = palette.surface1, style = { "bold" } },
        VertSplit = { fg = palette.surface1, bg = palette.base },
        WinBar = { link = "TabLineSel" },
        WinBarNC = { link = "TabLineFill" },
        Yank = { bg = require("catppuccin.utils.colors").darken(palette.rosewater, 0.5, palette.base) },
      }
    end,
  },
})

vim.cmd.colorscheme("catppuccin")

require("nvim-autopairs").setup()

require("mini.notify").setup({
  window = {
    config = { row = 2 },
  },
})

require("telescope").setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    get_status_text = function(picker)
      local stat_processed = picker.stats.processed or 0
      local stat_filtered = picker.stats.filtered or 0
      return string.format(" %d/%d ", stat_processed - stat_filtered, stat_processed)
    end,
    preview = { filesize_limit = 0.1 },
    layout_strategy = "flex",
    layout_config = {
      flex = { flip_columns = 120 },
      horizontal = { preview_cutoff = 0 },
      vertical = {
        preview_height = 0.33,
        preview_cutoff = 0,
      },
    },
    file_ignore_patterns = { ".git/" },
    mappings = {
      i = { ["<Esc>"] = require("telescope.actions").close },
    },
  },
  pickers = {
    find_files = { hidden = true },
    oldfiles = { cwd_only = true },
    live_grep = {
      glob_pattern = { "!*[.-]lock*" },
      additional_args = function() return { "--hidden" } end,
    },
  },
})

require("blink.cmp").setup({
  completion = {
    ghost_text = { enabled = true },
    list = {
      selection = { auto_insert = false },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
    },
  },
  keymap = {
    ["<C-Space>"] = { "show", "hide" },
    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = {
      function(cmp)
        if not cmp.is_visible() then
          return false
        end
        cmp.insert_next()
        cmp.insert_prev()
        cmp.hide()
        return true
      end,
      "fallback",
    },
  },
  cmdline = {
    completion = {
      ghost_text = { enabled = true },
      menu = { auto_show = true },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
    keymap = {
      ["<C-Space>"] = { "show", "hide" },
      ["<CR>"] = { "accept_and_enter", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
    },
  },
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "buf_ls",
    "clangd",
    "cssls",
    "denols",
    "dockerls",
    "gopls",
    "html",
    "lua_ls",
    "marksman",
    "nil_ls",
    "pylsp",
    "rust_analyzer",
    "sqlls",
    "taplo",
    "templ",
    "vue_ls",
    "yamlls",
  },
  automatic_enable = true,
})

require("conform").setup({
  default_format_opts = {
    async = true,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    css = { "prettier" },
    fish = { "fish_indent" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    rust = { "dioxus", "rustfmt" },
    scss = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    yaml = { "prettier" },
  },
})

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"

  bufs = vim.tbl_filter(function(buf)
    local file_name = vim.api.nvim_buf_get_name(buf)
    local buflisted = vim.api.nvim_get_option_value("buflisted", { buf = buf })
    return file_name ~= "" and buflisted
  end, vim.api.nvim_list_bufs())
end)

vim.api.nvim_create_autocmd("BufAdd", {
  callback = function(args)
    if args.file ~= "" then
      table.insert(bufs, args.buf)
    end
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    for i, buf in ipairs(bufs) do
      if buf == args.buf then
        table.remove(bufs, i)
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = require("nvim-treesitter").get_available(),
  callback = function(args)
    require("nvim-treesitter").install(vim.bo[args.buf].filetype):await(function()
      vim.treesitter.start(args.buf)
      vim.bo[args.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end)
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank({ higroup = "Yank", timeout = 250 })
  end,
})

local modes_by_group = {
  Visual = { "v", "V", "Vs", "\22", "\22s", "s", "S", "\19" },
  Insert = { "i", "ic", "ix" },
  Replace = { "r", "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" },
  Command = { "c", "cr", "cv", "cvr" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave", "ModeChanged" }, {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    local hl_name_suffix = "Normal"
    for group, modes in pairs(modes_by_group) do
      if vim.tbl_contains(modes, mode) then
        hl_name_suffix = group
        break
      end
    end
    vim.api.nvim_set_hl(0, "CursorLineNr", { link = "CursorLineNr" .. hl_name_suffix })
  end,
})

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_get_name(buf) == "" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})

vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.diagnostic.is_enabled({ bufnr = 0 }) then
    vim.diagnostic.enable(false, { bufnr = 0 })
    vim.notify("Disabled diagnostics", vim.log.levels.INFO)
  else
    vim.diagnostic.enable(true, { bufnr = 0 })
    vim.notify("Enabled diagnostics", vim.log.levels.INFO)
  end
end, {})

-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd
vim.lsp.config("clangd", { filetypes = { "c", "cpp", "objc", "objcpp", "cuda" } })

-- See:
--   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#denols
--   - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
vim.lsp.config("denols", {
  root_dir = function(_, cb)
    local cwd = vim.fn.getcwd()
    for _, suffix in ipairs({ "/deno.json", "/deno.jsonc" }) do
      if vim.uv.fs_stat(cwd .. suffix) then
        cb(cwd)
      end
    end
  end,
})

-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html
vim.lsp.config("html", { filetypes = { "html" } })

-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})

-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#rust_analyzer
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { features = "all" },
      check = { command = "clippy" },
    },
  },
})

-- See:
--   - https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
--   - https://github.com/vuejs/language-tools#hybrid-mode-configuration-requires-vuelanguage-server-version-200
--   - https://docs.deno.com/runtime/getting_started/setup_your_environment/#neovim-0.6%2B-using-the-built-in-language-server
vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server/"),
        languages = { "vue" },
      },
    },
  },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  root_dir = function(_, cb)
    local cwd = vim.fn.getcwd()
    for _, suffix in ipairs({ "/package.json", "/tsconfig.json" }) do
      if vim.uv.fs_stat(cwd .. suffix) then
        cb(cwd)
      end
    end
  end,
  single_file_support = false,
})

-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#yamlls
vim.lsp.config("yamlls", {
  settings = {
    yaml = { keyOrdering = false },
  },
})

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Leader>p", "\"_dP", { desc = "Paste (without yank)" })

vim.keymap.set("n", "<Leader>n", ":e ${HOME}/notes.md<CR>", { silent = true, desc = "Notes" })

for i = 1, 9 do
  vim.keymap.set("n", "<Leader>" .. i, function()
    local buf = bufs[i]
    if buf ~= nil then
      vim.api.nvim_win_set_buf(0, buf)
    end
  end, { desc = "Buffer " .. i })
  vim.keymap.set("n", "<Leader>b" .. i, function()
    local buf_current = vim.api.nvim_win_get_buf(0)
    for j, buf in ipairs(bufs) do
      if buf == buf_current then
        table.remove(bufs, j)
        table.insert(bufs, math.min(i, #bufs + 1), buf_current)
        vim.cmd.redrawtabline()
      end
    end
  end, { desc = "Move current buffer to index " .. i })
end
vim.keymap.set("n", "<Leader>bx", function()
  local file_name = vim.api.nvim_buf_get_name(0)
  local modified = vim.api.nvim_get_option_value("modified", { buf = 0 })
  if file_name == "" or not modified then
    vim.cmd.bdelete({ bang = true })
    return
  end
  local choice = vim.fn.confirm("Buffer has unwritten changes…", "&Write\n&Don't write")
  if choice == 0 then
    return
  end
  if choice == 1 then
    vim.cmd.write()
  end
  vim.cmd.bdelete({ bang = true })
end, { desc = "Close current buffer" })

vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Diagnostics" })

vim.keymap.set("n", "[g", require("gitsigns").prev_hunk, { desc = "Previous Git hunk" })
vim.keymap.set("n", "]g", require("gitsigns").next_hunk, { desc = "Next Git hunk" })
vim.keymap.set("n", "<Leader>gb", require("gitsigns").blame_line, { desc = "Git Blame" })
vim.keymap.set("n", "<Leader>gp", require("gitsigns").preview_hunk, { desc = "Preview Git hunk" })
vim.keymap.set("n", "<Leader>gu", require("gitsigns").reset_hunk, { desc = "Undo Git hunk" })

vim.keymap.set("n", "<Leader>f", require("conform").format, { desc = "Format" })

local function keymap_picker(lhs, picker, keymap_opts, picker_opts)
  local default_picker_opts = {
    prompt_title = (keymap_opts or {}).desc,
    results_title = "Results",
    preview_title = "Preview",
  }
  picker_opts = vim.tbl_extend("force", default_picker_opts, picker_opts or {})
  vim.keymap.set("n", lhs, function() picker(picker_opts) end, keymap_opts)
end

keymap_picker("<Leader>sh", require("telescope.builtin").help_tags, { desc = "Help" })
keymap_picker("<Leader>sk", require("telescope.builtin").keymaps, { desc = "Keymaps" })
keymap_picker("<Leader>sf", require("telescope.builtin").find_files, { desc = "Files" })
keymap_picker("<Leader>sa", require("telescope.builtin").find_files, { desc = "All files" }, { no_ignore = true })
keymap_picker("<Leader>sp", require("telescope.builtin").oldfiles, { desc = "Previous files" })
keymap_picker("<Leader>sb", require("telescope.builtin").buffers, { desc = "Buffers" })
keymap_picker("<Leader>s/", require("telescope.builtin").live_grep, { desc = "Search" })
keymap_picker("<Leader>sd", require("telescope.builtin").diagnostics, { desc = "Diagnostics" })

keymap_picker("<Leader>gc", require("telescope.builtin").git_bcommits, { desc = "Buffer commits" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    keymap_picker("grd", require("telescope.builtin").lsp_definitions, {
      buffer = args.buf,
      desc = "Definitions",
    })
    keymap_picker("grr", require("telescope.builtin").lsp_references, {
      buffer = args.buf,
      desc = "References",
    })
    keymap_picker("gri", require("telescope.builtin").lsp_implementations, {
      buffer = args.buf,
      desc = "Implementations",
    })
    keymap_picker("grt", require("telescope.builtin").lsp_type_definitions, {
      buffer = args.buf,
      desc = "Type definitions",
    })
    keymap_picker("gO", require("telescope.builtin").lsp_document_symbols, {
      buffer = args.buf,
      desc = "Document symbols",
    })
  end,
})
