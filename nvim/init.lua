-- setup denops.vim
local denopsSrc = "~/.cache/dpp/repos/github.com/vim-denops/denops.vim"
vim.opt.runtimepath:append(denopsSrc)

-- setup plugin manager (dpp.vim)
local dppBase = "~/.cache/dpp/"
local dppConfig = "~/.config/nvim/dpp.ts"
local dppSrc = "~/.cache/dpp/repos/github.com/Shougo/dpp.vim"
local dppInstaller = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
local dppToml = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
local dppGit = "~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"
vim.opt.runtimepath:append(dppSrc)
vim.opt.runtimepath:append(dppInstaller)
vim.opt.runtimepath:append(dppToml)
vim.opt.runtimepath:append(dppGit)

local dpp = require("dpp")
if dpp.load_state(dppBase) then
	vim.api.nvim_create_autocmd("User", {
		pattern = "DenopsReady",
		callback = function()
			vim.notify("dpp load_state() is failed")
			dpp.make_state(dppBase, dppConfig)
		end,
	})
end

vim.api.nvim_create_autocmd("User", {
	pattern = "Dpp:makeStatePost",
	callback = function()
		vim.notify("dpp make_state() is done")
	end,
})

vim.opt.number = true
vim.opt.swapfile = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = ""

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ff", "<Cmd>call ddu#start({})<CR>")
