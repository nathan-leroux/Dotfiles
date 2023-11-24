-- leader
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- indentation options
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- search options
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- text render options
vim.o.encoding = "utf-8"
vim.o.wrap = true
vim.o.linebreak = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.breakindent = true

-- split options
vim.o.splitbelow = true
vim.o.splitright = true

-- user interface options
vim.o.ruler = true
vim.o.signcolumn = 'yes'
vim.o.number = true
vim.o.relativenumber = true

-- misc. options
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.updatetime = 50
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
