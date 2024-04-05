-- 有用的插件，可以显示待处理的按键绑定。
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- 设置加载事件为 'VimEnter'
  config = function() -- 这是加载后运行的函数
    require('which-key').setup()

    -- 记录现有的 key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>p'] = { name = '[P]eek', _ = 'which_key_ignore' },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
