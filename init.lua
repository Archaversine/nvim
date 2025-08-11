
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

vim.opt.wrap = false;
vim.opt.number = true;
vim.opt.relativenumber = true;
vim.opt.tabstop = 4;
vim.opt.signcolumn = "yes"; -- always show sign column
vim.opt.shiftwidth = 4;
vim.opt.swapfile = false;
vim.opt.guicursor = ""; -- always use block cursor
vim.opt.expandtab = true;

vim.g.mapleader = " "

vim.g.clipboard = "xclip"

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>p', '"+p')

-- Tabs
vim.opt.showtabline = 1
vim.keymap.set('n', '<leader><tab>n', ':tabnew<CR>')
vim.keymap.set('n', '<leader><tab>d', ':tabclose<CR>')
vim.keymap.set('n', '<S-l>', ':tabnext<CR>')
vim.keymap.set('n', '<S-h>', ':tabprev<CR>')

vim.keymap.set('n', '<C-s>', ':w<CR>')

-- Autocomplete
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { silent = true })

-- Bootstrap lazy.nvim
-- I'm doing the single file setup because the documentation sucks
-- for the structured setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
	"vim-airline/vim-airline",
	"neovim/nvim-lspconfig",
	"nvim-tree/nvim-tree.lua",
	"echasnovski/mini.pick",
	"AstroNvim/astrotheme",
	{ 
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "haskell" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	"echasnovski/mini.pairs",
  },

  opts = {
    rocks = {
		enabled = false,
	},
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Color scheme
require('astrotheme').setup()
vim.cmd('colorscheme astrodark')

-- Parentheses
require('mini.pairs').setup()

-- Language Server Configurations
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                -- removes the 'undefined global "vim"' warning
                globals = { "vim" }
            }
        }
    }
})

-- Language Servers
vim.lsp.enable('hls')
vim.lsp.enable('lua_ls')

vim.diagnostic.enable = true
vim.diagnostic.config({
    --virtual_lines = true, -- looks nice but gets in the way a lot
    virtual_text = true,
})

vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end)
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end)

-- File picker
require "mini.pick".setup()
vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')

-- File tree
require("nvim-tree").setup({})
vim.keymap.set('n', '<C-f>', ':NvimTreeToggle<CR>')
