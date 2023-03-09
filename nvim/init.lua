local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- require 'plugins'
require 'settings'      -- defaults

vim.g.run_nostream_default = 1

local utils = require('utils')

-- colorscheme
vim.cmd 'set background=light'
vim.cmd 'colorscheme intellij'

require'lspconfig'.clangd.setup{}
