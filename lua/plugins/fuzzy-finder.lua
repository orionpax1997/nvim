-- 模糊查找器 (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- 如果遇到错误，请参阅 telescope-fzf-native README 以获取安装说明
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` 用于在安装/更新插件时运行一些命令。
      -- 这仅在那时运行，而不是每次 Neovim 启动时运行。
      build = 'make',

      -- `cond` 是一个条件，用于确定该插件是否应该安装并加载。
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- 对于获得漂亮的图标很有用，但需要 Nerd 字体。
    { 'nvim-tree/nvim-web-devicons', enabled = true },
  },
  config = function()
    -- telescope 是一个模糊的取景器，它带有很多不同的东西
    -- 可以模糊查找！它不仅仅是一个“文件查找器”，
    -- 它还可以搜索 Neovim 的许多不同方面、您的工作空间、LSP 等等！
    --
    -- 使用 Telescope 最简单的方法是首先执行以下操作：
    --  :Telescope help_tags
    --
    -- 运行此命令后，将打开一个窗口，您可以在提示窗口中输入。
    -- 您将看到 "help_tags" 选项列表以及相应的帮助预览。

    --
    -- 在 Telescope 中使用的两个重要的键盘映射是：
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- 这将打开一个窗口，显示当前的 Telescope picker 所有键盘映射
    -- 这对于发现望远镜的功能非常有用，做以及如何实际做!

    -- [[ 配置 Telescope ]]
    -- 请参阅 `:help telescope` 和 `:help telescope.setup()`
    require('telescope').setup {
      -- 您可以将默认 mappings / updates / etc. 放在这里
      -- 您要查找的所有信息都在 `:help telescope.setup()` 中
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- 启用 Telescope 扩展（如果已安装）
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- 请参阅 `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- 覆盖默认行为和主题的稍微高级的示例
    vim.keymap.set('n', '<leader>/', function()
      -- 您可以将附加配置传递给 Telescope 来更改主题、布局等。
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- 也可以传递额外的配置选项。
    -- 有关特定 keys 的信息，请参阅 `:help telescope.builtin.live_grep()`
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- 搜索 Neovim 配置文件的快捷方式
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
