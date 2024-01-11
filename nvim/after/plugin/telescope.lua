local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find Files"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "Find Git files"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc= "Find Buffers"})
vim.keymap.set('n', '<leader>fs', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {desc = "find string"})

