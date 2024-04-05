-- 自动补全
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- 片段引擎及其关联的 nvim-cmp 源
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- 片段中的正则表达式支持需要构建步骤。
        -- 许多 Windows 环境不支持此步骤。
        -- 删除以下条件以在 Windows 上重新启用。
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friend-snippets` 包含各种预制片段。
        -- 请参阅有关各个语言/框架/插件片段的自述文件：
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',

    -- 添加其他完成功能。
    -- 默认情况下，nvim-cmp 并不附带所有源。为了维护目的，它们被分成多个存储库。
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    -- 请参阅 `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- 要了解为什么选择这些映射，您需要阅读 `:help ins-completion`
      --
      -- 不，但是说真的。请阅读`:help ins-completion`，真的很好！
      mapping = cmp.mapping.preset.insert {
        -- 选择 [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- 选择 [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- 滚动文档窗口 [b]ack / [f]orward
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- 接受（[y]es）完成。
        -- 如果您的 LSP 支持，这将自动导入。
        -- 如果 LSP 发送了片段，这将扩展片段。
        ['<C-y>'] = cmp.mapping.confirm { select = true },

        -- 从 nvim-cmp 手动触发完成。
        -- 通常你不需要这个，因为只要 nvim-cmp 有可用的完成选项，它就会显示完成。
        ['<C-Space>'] = cmp.mapping.complete {},

        -- 将 <c-l> 视为移动到代码片段扩展的右侧。
        -- 所以如果你有一个像这样的片段：
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> 会将您移动到每个扩展位置的右侧。
        -- <c-h> 类似，只是向左移动。
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- 有关更高级的 Luasnip 键映射（例如选择选择节点、扩展），请参阅：
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
