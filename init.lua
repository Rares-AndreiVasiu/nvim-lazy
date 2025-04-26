vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'ribru17/bamboo.nvim',
		
		lazy = false,
		
		priority = 1000,
		
		config = function()
			require('bamboo').setup {
				-- optional configuration here
			}
			require('bamboo').load()
		end,
	},
	
  {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	
	},

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdadte"
  }

}

local opts = {}

require("lazy").setup(plugins, opts)

vim.cmd.colorscheme "bamboo"


-- telescope configure
local builtin = require("telescope.builtin")

vim.g.mapleader = " "

vim.keymap.set('n', "<leader>pf", builtin.find_files, {})

vim.keymap.set('n', "<leader>ps", builtin.live_grep, {})


-- treesitter config

local tree_config = require("nvim-treesitter.configs")

tree_config.setup({
  ensure_installed = {"lua", "c", "rust", "verilog", "python"},

  highlight = { enable = true},

  indent = {enable = true},
})
