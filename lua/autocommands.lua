-- [[ 配置自动命令 ]]
-- 参见 `:help lua-guide-autocommands`

-- 拉取（复制）文本时突出显示
-- 在正常模式下用 `yap` 试试
-- 参见 `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
