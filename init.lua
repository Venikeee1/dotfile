vim.cmd("set number relativenumber")
vim.cmd("set scrolloff=5")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set autoindent noexpandtab tabstop=2 shiftwidth=2")
vim.cmd("set cursorline")
vim.cmd("set signcolumn=yes:1")
vim.cmd("set termguicolors")

-- highlight yank
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

-- spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- remove tilda sign
vim.opt.fillchars:append({ eob = " " })

vim.diagnostic.config({ severity_sort = true })
-- Undercurl for diagnostics
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])

vim.keymap.set({ "n", "i" }, "<C-s>", function()
	vim.cmd(":w")
end, {})

vim.keymap.set({ "n", "v" }, "b[", function()
	vim.cmd(":bn")
end, {})

vim.keymap.set({ "n", "v" }, "b]", function()
	vim.cmd(":bp")
end, {})

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

-- map :W to :w
vim.cmd([[command! -nargs=0 W w]])

-- paste from "" buffer
vim.keymap.set("n", "<leader>p", '"0p', {})

-- Diagnostic
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

vim.g.mapleader = " "

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

require("lazy").setup("plugins")

vim.cmd.colorscheme("solarized-osaka")
