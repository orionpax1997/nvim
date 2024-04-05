-- 将 git 相关标志添加到装订线中，以及用于管理更改的实用程序
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
