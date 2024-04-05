-- 状态栏
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'palenight',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
