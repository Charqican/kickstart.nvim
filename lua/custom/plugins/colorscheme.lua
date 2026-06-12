-- return {
--   {
--     'folke/tokyonight.nvim',
--     lazy = false,
--     priority = 1000,
--     opts = {
--       transparent = true, -- deja que Neovim pinte el bg
--       on_colors = function(colors)
--         colors.fg = '#E4E7F6'
--       end,
--     },
--     config = function(_, opts)
--       require('tokyonight').setup(opts)
--       vim.cmd.colorscheme 'tokyonight'
--     end,
--   },
-- }
return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none', -- equivalente a quitar sidebars
            },
          },
        },
        palette = {
          fujiWhite = '#E4E7F6', -- equivalente a tu on_colors fg
        },
      },
      overrides = function(colors)
        return {
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
        }
      end,
    },
    theme = 'dragon',
    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
