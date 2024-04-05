-- [[ 设置选项 ]]
-- 请参阅 `:help vim.opt`
--  NOTE: 您可以根据需要更改这些选项！
-- 更多选项可以查看 `:help option-list`

-- 使用默认行号
vim.opt.number = true
-- 您还可以使用相对行号，以帮助跳转。
-- 自己尝试一下，看看你是否喜欢它！
-- vim.opt.relativenumber = true

-- 启用鼠标模式，例如可用于调整分割大小！
vim.opt.mouse = 'a'

-- 不显示模式，因为它已经在状态行中
vim.opt.showmode = false

-- 在操作系统和 Neovim 之间同步剪贴板。
-- 如果您希望操作系统剪贴板保持独立，请删除此选项。
-- 请参阅 `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- 启用断行缩进
vim.opt.breakindent = true

-- 保存撤消历史记录
vim.opt.undofile = true

-- 搜索时不区分大小写除非 \C 或搜索项中的一个或多个大写字母
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 默认情况下绘制标号列
vim.opt.signcolumn = 'yes'

-- 根据光标位置自动更新高亮 tag 的间隔时间
vim.opt.updatetime = 250

-- 减少映射序列等待时间
-- 更快地显示 which-key 弹出窗口
vim.opt.timeoutlen = 300

-- 配置如何打开新的 split
-- 设置新分割窗口在右边
vim.opt.splitright = true
-- 设置新分割窗口在下边
vim.opt.splitbelow = true

-- 设置 neovim 如何在编辑器中显示某些空白字符。
-- 请参阅 `:help 'list'`
-- 和 `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 输入时实时预览替换！
vim.opt.inccommand = 'split'

-- 显示光标所在行
vim.opt.cursorline = true

-- 光标上方和下方保留的最小屏幕行数。
vim.opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
