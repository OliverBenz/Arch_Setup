vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.expandtab   = false
vim.opt.shiftwidth  = 4
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true
vim.opt.wrap        = true
vim.opt.cursorline  = true

vim.opt.termguicolors = true
vim.opt.signcolumn    = "yes"
vim.opt.scrolloff     = 5
vim.opt.mouse         = "a"

vim.opt.undofile   = true  -- Save undo history
vim.opt.ignorecase = true  -- Case insensitive search
vim.opt.smartcase  = true  -- Case insensitive search
vim.opt.signcolumn = 'yes'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = 'split'

-- Directory where we store lazyvim (package manager) data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If lazyvim data not exist yet, then pull
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath) -- Add at beginning of run-time-paths (load package manager first)

require("lazy").setup({
	-- Filetree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {"nvim-tree/nvim-web-devicons"},
		opts = {
			sort     = { sorter = "case_sensitive" },
			view     = { width = 30 },
			renderer = { group_empty = true },
			filters  = { dotfiles = true },
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)

			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					local api = require("nvim-tree.api")
					local currWin = vim.api.nvim_get_current_win()

					api.tree.open()

					vim.schedule(function()
						if vim.api.nvim_win_is_valid(currWin) then
							vim.api.nvim_set_current_win(currWin)
						end
					end)
				end,
			})
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
						vim.cmd("quit")
					end
				end,
			})
		end,
	},
	-- Fuzzy file finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- Base for language interpretation? 
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "c", "cpp", "latex" },
		},
	},
	-- Colorscheme kind like VSCode
	{
		"tomasiser/vim-code-dark",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("codedark")
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	-- Autocomplete Window
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	-- Latex stuff
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_compiler_latexmk_engines = {
				_ = "-lualatex"
			}
			vim.g.vimtex_view_method = "zathura"
		end,
	},
	-- Auto Pair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})

			local ok,cmp = pcall(require, "cmp")
			if ok then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
})

-- Keymaps
-- Fuzzy finding files with space + f + f
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find files"})

-- Autocomplete keybinds
local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = {
		{ name = "nvim_lsp" },
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP
vim.lsp.config("clangd", {
	capabilities = capabilities
})
vim.lsp.enable("clangd")

vim.lsp.config("texlab", {
	capabilities = capabilities
})
vim.lsp.enable("texlab")

