-- 突出显示、编辑和导航代码
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
    -- 自动安装未安装的语言
    auto_install = true,
    highlight = {
      enable = true,
      -- 某些语言依赖于 vim 的正则表达式突出显示系统（例如 Ruby）来实现缩进规则。
      -- 如果您遇到奇怪的缩进问题，请将语言添加到additional_vim_regex_highlighting 和禁用缩进语言列表中。
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    -- [[ 配置 Treesitter ]] 请参阅 `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- 还有其他 nvim-treesitter 模块可用于与 nvim-treesitter 交互。
    -- 您应该去探索一些，看看您感兴趣的是什么：
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}

-- vim: ts=2 sts=2 sw=2 et
