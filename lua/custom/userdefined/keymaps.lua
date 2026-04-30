-- buffer navigation
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Línea debajo como o pero vuelve a modo normal
vim.keymap.set('n', '<leader>o', ':normal! o<Esc><CR>', { desc = 'Agregar línea debajo' })
-- Línea arriba como O pero vuelve a modo normal
vim.keymap.set('n', '<leader>O', ':normal! O<Esc><CR>', { desc = 'Agregar línea arriba' })

-- Entrar en modo normal con jk
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
-- Salir de la terminal sin esc esc
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Centrar cursor en scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centrado' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centrado' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Siguiente búsqueda centrado' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Anterior búsqueda centrado' })

-- Splits
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split [V]ertical' })
--vim.keymap.set('n', '<leader>h', '<C-w>s', opts)

-- Clipboard
--vim.keymap.set('n', 'p', '"_dP', { desc = 'Pegar sin perder yank' })

-- Guardar y salir
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Guardar archivo' })
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Cerrar ventana' })
vim.keymap.set('n', '<leader>T', '<cmd>Floaterminal<CR>', { desc = '[T]oggle [T]erminal' })

-- No sobrescribir clipboard al borrar
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')

-- Opcional (más agresivo, piénsalo bien)
-- vim.keymap.set('n', 'd', '"_d')
-- vim.keymap.set('v', 'd', '"_d')

-- Pegar sin perder lo copiado (modo visual)
vim.keymap.set('v', 'p', '"_dP')

-- Atajos tipo “editor moderno”
vim.keymap.set('n', '<C-c>', 'yy') -- copiar línea
vim.keymap.set('v', '<C-c>', 'y') -- copiar selección
vim.keymap.set('n', '<C-v>', 'p') -- pegar
vim.keymap.set('i', '<C-v>', '<C-r>+') -- pegar en insert

-- Mantener selección al indentar
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '<leader>sa', function()
  require('telescope.builtin').find_files {
    hidden = true,
    no_ignore = true,
  }
end)
