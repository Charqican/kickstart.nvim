-- buffer navigation
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')

-- Línea debajo como o pero vuelve a modo normal
vim.keymap.set('n', '<leader>o', ':normal! o<Esc><CR>', { desc = 'Agregar línea debajo y volver a normal' })

-- Línea arriba como O pero vuelve a modo normal
vim.keymap.set('n', '<leader>O', ':normal! O<Esc><CR>', { desc = 'Agregar línea arriba y volver a normal' })
-- Entrar en modo normal con jk
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
-- Salir de la temrinal sin esc esc
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>t', '<cmd>terminal<CR>')
-- cambiar de buffers
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)

vim.keymap.set('n', 'N', 'Nzzzv', opts)
-- ##############

vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
--vim.keymap.set('n', 'p', '"_dP') -- keep last yanked
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>') -- ctr + s para guardar.

vim.keymap.set('n', '<C-q>', '<cmd> q <CR>') -- ctr + s para guardar.
