-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
-- See the kickstart.nvim README for more information

return {
	-- My plugins
	{ dir = "~/.config/nvim/benjuhmin/plugins/test.nvim" },

	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},
	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',                            opts = {} },
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},


	{
		'nvim-lualine/lualine.nvim',
	},

	{
		-- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
		}
	},
	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim',         opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},


	-- OIL: File System with neovim keybinds
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- TREE SITTER
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
	},

	-- AUTO CLOSE TAGS
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},

	-- CODE RUNNER
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require('code_runner').setup({
				filetype = {
					go = {
						"cd $dir &&",
						"go run .",
					},
					python = "python3 -u",
					typescript = "deno run",
					rust = {
						"cd $dir &&",
						"rustc $fileName &&",
						"$dir/$fileNameWithoutExt"
					},
				},
			})
		end
	},

	-- TERMINAL
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require('toggleterm').setup()
		end
	},

	-- EXPLORER
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

	{
		"brenton-leighton/multiple-cursors.nvim",
		version = "*", -- Use the latest tagged version
		opts = {}, -- This causes the plugin setup function to be called
		keys = {
			{ "<leader>cd", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "[C]ursor [D]own" },
			{ "<C-j>",      "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "[C]ursor [D]own" },
			{ "<C-k>",      "<Cmd>MultipleCursorsAddUp<CR>",   mode = { "n", "x" }, desc = "[C]ursor [U]p}" },
			{ "<leader>cu", "<Cmd>MultipleCursorsAddUp<CR>",   mode = { "n", "x" }, desc = "[C]ursor [U]p" },
		}
	},

	-- COLORSCHEME
	{
		"rebelot/kanagawa.nvim",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'kanagawa'
		-- end,
	},

	{
		-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'onedark'
		-- end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'catppuccin-frappe'
		-- 	require("catppuccin").setup({
		-- 		integrations = {
		-- 			cmp = true,
		-- 			telescope = false,
		-- 		}
		-- 	})
		-- end,
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"EdenEast/nightfox.nvim",
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme 'nordfox'
		-- end,
	},
	{
		'projekt0n/github-nvim-theme',
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('github-theme').setup({
				-- ...
			})

			vim.cmd('colorscheme github_dark')
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
		},
	},

}
