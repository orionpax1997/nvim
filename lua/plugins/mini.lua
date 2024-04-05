-- Mini 全家桶
return {
  'echasnovski/mini.nvim',
  config = function()
    -- 扩展和创建 a/i textobjects
    -- 例如:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- 常见 Neovim 动作显示动画
    require('mini.animate').setup()

    -- 注释
    -- NOTE: `gc` 注释选中范围或者 `gcc` 注释当前行 `dgc` 删除注释
    require('mini.comment').setup()

    -- 可视化显示缩进范围
    require('mini.indentscope').setup()

    -- 小地图
    local map = require 'mini.map'

    map.setup {
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.gitsigns(),
        map.gen_integration.diagnostic(),
      },
      symbols = {
        encode = map.gen_encode_symbols.dot '4x2',
      },
    }

    vim.keymap.set('n', '<Leader>m', map.toggle, { desc = '[M]ap' })

    vim.cmd [[autocmd User MiniStarterOpened
    \ lua vim.keymap.set(
    \   'n',
    \   '<CR>',
    \   '<Cmd>lua MiniStarter.eval_current_item(); MiniMap.open()<CR>',
    \   { buffer = true }
    \ )]]

    -- 自动配对
    require('mini.pairs').setup()

    -- 启动界面
    require('mini.starter').setup()

    -- 更好的环绕
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
  end,
}

-- vim: ts=2 sts=2 sw=2 et
