-- go to file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- space does nothing in normal/visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- vim splits
vim.keymap.set({'n','i','t'}, '<C-j>', '<C-w>j')
vim.keymap.set({'n','i','t'}, '<C-k>', '<C-w>k')
vim.keymap.set({'n','i','t'}, '<C-h>', '<C-w>h')
vim.keymap.set({'n','i','t'}, '<C-l>', '<C-w>l')


-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

