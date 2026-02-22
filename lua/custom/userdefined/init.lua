requiere 'custom.userdefined.keymaps'
requiere 'custom.userdefined.terminal'
requiere 'custom.userdefined.options'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.linebreak = true
    vim.opt_local.wrap = true -- normalmente se usa junto a linebreak
    vim.opt_local.breakindent = true
  end,
})
