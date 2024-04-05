-- 在评论中突出显示待办事项、注释等
return { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } }

-- vim: ts=2 sts=2 sw=2 et
