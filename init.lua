-- Created by OrionPax on 2019/08/26
-- Last Modified: 2024/04/05
--
-- 设置 <space> 为 leader key
-- 请参阅 `:help mapleader`
--  NOTE: 必须在加载插件之前发生（否则将使用错误的 leader ）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ 选项 ]]
require 'options'

-- [[ 键盘映射 ]]
require 'keymaps'

-- [[ 自动命令 ]]
require 'autocommands'

-- [[ 插件管理 ]]
require 'lazy-bootstrap'

-- 下面的行称为 `modeline`。请参阅 `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
