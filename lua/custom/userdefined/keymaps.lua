-- =====================================================================
-- [[ NAVEGACIÓN Y BÁSICOS ]]
-- =====================================================================
-- Limpiar highlights de búsqueda al presionar <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Salir de modo insertar/terminal rápido
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Guardar y salir
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Guardar archivo' })
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Cerrar ventana' })

-- Centrar cursor al navegar/scrollear
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centrado' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centrado' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Siguiente búsqueda centrado' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Anterior búsqueda centrado' })

-- =====================================================================
-- [[ VENTANAS Y BUFFERS ]]
-- =====================================================================
-- Moverse entre ventanas (Splits)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to upper window' })

-- Crear Splits
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split [V]ertical' })

-- Navegación de Buffers
vim.keymap.set('n', '<leader>j', '<cmd>bnext<CR>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<leader>k', '<cmd>bprevious<CR>', { desc = 'Prev buffer', silent = true })
vim.keymap.set('n', '<leader>x', '<cmd>bdelete!<CR>', { desc = 'Delete buffer', silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'New buffer', silent = true })

-- Toggle de utilidades
vim.keymap.set('n', '<leader>T', '<cmd>Floaterminal<CR>', { desc = '[T]oggle [T]erminal' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- =====================================================================
-- [[ EDICIÓN Y CLIPBOARD ]]
-- =====================================================================
-- Agregar líneas sin entrar a insert mode
vim.keymap.set('n', '<leader>o', ':normal! o<Esc><CR>', { desc = 'Agregar línea debajo' })
vim.keymap.set('n', '<leader>O', ':normal! O<Esc><CR>', { desc = 'Agregar línea arriba' })

-- Comportamiento de borrado seguro (No sobrescribir clipboard)
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')
vim.keymap.set('v', 'p', '"_dP', { desc = 'Pegar sin perder yank en modo visual' })

-- Atajos tipo "editor moderno"
vim.keymap.set('n', '<C-c>', 'yy', { desc = 'Copiar línea' })
vim.keymap.set('v', '<C-c>', 'y', { desc = 'Copiar selección' })
vim.keymap.set('n', '<C-v>', 'p', { desc = 'Pegar' })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Pegar en insert mode' })

-- Mantener selección visual al indentar
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- =====================================================================
-- [[ TELESCOPE (CUSTOM) ]]
-- =====================================================================
vim.keymap.set('n', '<leader>sa', function()
  require('telescope.builtin').find_files { hidden = true, no_ignore = true }
end, { desc = '[S]earch [A]ll (hidden & ignored)' })

vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files { hidden = true }
end, { desc = '[F]ind [F]iles (with hidden)' })
