require('lualine').setup {
  -- See `:help lualine.txt`
  options = {
    icons_enabled = true,
    theme = 'palenight',
    component_separators = '|',
    section_separators = '',
  },


  -- +-------------------------------------------------+
  -- | A | B | C                             X | Y | Z |
  -- +-------------------------------------------------+

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { '', 'buffers' },
    lualine_x = { '' },
    lualine_y = { '' },
    lualine_z = { 'filename' }
  },
}
