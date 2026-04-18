vim.keymap.set('n', '<C-d>', '<C-d>zz')  -- keep cursor centered when jumping
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')        -- keep cursor centered when searching

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")  -- move selected line down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")  -- move selected line up

vim.keymap.set({'n', 'i', 'x'}, '<C-s>', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')  -- move to left split
vim.keymap.set('n', '<C-j>', '<C-w>j')  -- move to bottom split
vim.keymap.set('n', '<C-k>', '<C-w>k')  -- move to top split
vim.keymap.set('n', '<C-l>', '<C-w>l')  -- move to right split

vim.keymap.set({'n', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')

vim.keymap.set({"n", "v"}, "d", '"_d')
vim.keymap.set({"n", "v"}, "c", '"_c')

-- Alt+d and Alt+c to cut to system clipboard
vim.keymap.set({"n", "v"}, "<A-d>", '"+d')
vim.keymap.set({"n", "v"}, "<A-c>", '"+c')
