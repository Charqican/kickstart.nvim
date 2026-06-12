-- =====================================================================
-- [[ CORE SETTINGS ]]
-- =====================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- General Options
vim.opt.clipboard = 'unnamedplus'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- =====================================================================
-- [[ AUTOCOMMANDS ]]
-- =====================================================================
-- Highlight copy text (Yank)
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- =====================================================================
-- [[ PLUGIN MANAGER (LAZY.NVIM) ]]
-- =====================================================================
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- =====================================================================
-- [[ PLUGINS SPEC ]]
-- =====================================================================
require('lazy').setup({
  -- [ BASE UTILITIES ]
  require 'kickstart.plugins.telescope', -- Telescope: File Fuzzy Finder
  require 'kickstart.plugins.which_key', -- Which-Key: Hotkey menu
  -- [ LSP, LINTERS & FORMATTERS ]
  require 'kickstart.plugins.lazydev', -- Lazydev: Lua env for neovim
  require 'kickstart.plugins.lspconfig', -- Lsp support for nvim, main config file
  require 'kickstart.plugins.conform', -- Conform: Auto-format
  require 'kickstart.plugins.blink', -- Blink.cmp: Fast Autocompletion
  -- [ INTERFACE & VISUAL EDITION ]
  require 'kickstart.plugins.todo_comments', -- add TODO highlights
  require 'kickstart.plugins.treesitter', -- Treesitter: smart syntaxis highlights
  require 'kickstart.plugins.mini', -- Mini: A collection of modular utilities
  -- [ IMPORT USER MODULES ]
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
-- uer plugins initializer
require 'custom.userdefined'
