-- [[ 基本键盘映射 ]]
-- 请参阅 `:help vim.keymap.set()`

-- 在搜索时设置突出显示，但在正常模式下按 <Esc> 则清除
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic 映射
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- 使用更简单的快捷方式在内置终端中退出终端模式供人们发现。
-- 否则，您通常需要按 <C-\><C-n>，这没有更多经验的人是不会猜到的。
-- NOTE: 这不适用于所有终端 emulators/tmux/etc。
-- 尝试自己的映射或者只使用 <C-\><C-n> 退出终端模式
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: 在正常模式下禁用箭头键
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- 按键绑定使分割导航更容易。
-- 使用 CTRL+<hjkl> 在窗口之间切换
--
-- 请参阅 `:help wincmd` 以获取所有窗口命令的列表
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- 使用 Shift + j/k 代替 Ctrl + d/u
vim.keymap.set('n', '<S-j>', '<C-d>')
vim.keymap.set('n', '<S-k>', '<C-u>')

-- vim: ts=2 sts=2 sw=2 et
