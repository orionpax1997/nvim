-- [[ 安装 `lazy.nvim` 插件管理器 ]]
-- 有关更多信息，请参阅 `:help lazy.nvim.txt` 或 https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ 配置并安装插件 ]]
-- 要检查插件的当前状态，请运行
--    :Lazy
--
-- 您可以在此菜单中按 `?` 寻求帮助。使用 `:q` 关闭窗口
--
-- 要更新插件，您可以运行
--    :Lazy update
--
-- 从 lua/plugins 目录中加载插件
require('lazy').setup { { import = 'plugins' } }

-- vim: ts=2 sts=2 sw=2 et
