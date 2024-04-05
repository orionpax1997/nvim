-- 翻译
-- NOTE: 弹出窗中 `g?` 查看操作帮助
return {
  'potamides/pantran.nvim',
  config = function()
    local pantran = require 'pantran'
    pantran.setup {
      default_engine = 'google',
      engines = {
        google = {
          fallback = {
            default_source = 'auto',
            default_target = 'zh',
          },
        },
      },
    }

    vim.keymap.set('x', '<leader>t', pantran.motion_translate, { noremap = true, silent = true, expr = true, desc = '[T]ranslate' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
