--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

什么是启动？

  Kickstart.nvim 不是一个发行版。

  Kickstart.nvim 是您自己配置的起点。
    目标是你可以从上到下阅读每一行代码，理解
    您的配置正在做什么，并修改它以满足您的需要。

    完成此操作后，您就可以开始探索、配置和修补
    让 Neovim 成为您自己的！这可能意味着 Kickstart 暂时保持原样
    或者立即将其分解成模块化的部分。由你决定！

    如果你对Lua一无所知，我建议你花一些时间阅读一下
    指引。一个可能的例子只需要 10-15 分钟：
      - https://learnxinymonths.com/docs/lua/

    在对 Lua 有更多了解后，您可以使用 `:help lua-guide` 作为
    Neovim 如何集成 Lua 的参考。
    - :帮助 lua 指南
    -（或 HTML 版本）：https://neovim.io/doc/user/lua-guide.html

启动指南：

 TODO: 您应该做的第一件事是在 Neovim 中运行命令 `:Tutor`。

如果您不知道这意味着什么，请输入以下内容：
      - <escape key>
      - :
      - Tutor
      - <enter key>

 （如果您已经了解 Neovim 基础知识，则可以跳过此步骤。）

  完成后，您可以继续**并阅读**其余部分的 kickstart init.lua。

接下来，运行并阅读`:help`。
    这将打开一个帮助窗口，其中包含一些基本信息
    关于阅读、导航和搜索内置帮助文档。

    当你遇到困难或困惑时，这应该是你第一个去看的地方
    与某事。这是我最喜欢的 Neovim 功能之一。

    最重要的是，我们提供了一个键盘映射 "<space>sh" 来 [s]earch [h]elp 文档，
    当您不确定自己要查找什么时，这非常有用。

我在 init.lua 中留下了几条 `:help X` 注释
    这些是关于在哪里可以找到有关相关设置的更多信息的提示，
    Kickstart 中使用的插件或 Neovim 功能。

 TODO: 寻找像这样的行

    贯穿整个文件。这些是为读者您准备的，旨在帮助您了解正在发生的事情。
    一旦您知道自己在做什么，就可以随意删除它们，但它们应该作为指导
    当您第一次在 Neovim 配置中遇到一些不同的构造时。

如果您在尝试安装 kickstart 时遇到任何错误，请运行 `:checkhealth` 以获取更多信息。

我希望您享受 Neovim 之旅，
- TJ

附：完成后您也可以删除它。现在是你的配置了！ :)
--]]

-- 设置 <space> 为 leader key
-- 请参阅 `:help mapleader`
--  NOTE: 必须在加载插件之前发生（否则将使用错误的 leader ）
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 如果您安装了 Nerd Font，则设置为 true
vim.g.have_nerd_font = true

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

-- [[ 基本自动命令 ]]
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

-- [[ 安装 `lazy.nvim` 插件管理器 ]]
-- 有关更多信息，请参阅 `:help lazy.nvim.txt` 或 https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ 配置并安装插件 ]]
--
-- 要检查插件的当前状态，请运行
--    :Lazy
--
-- 您可以在此菜单中按 `?` 寻求帮助。使用 `:q` 关闭窗口
--
-- 要更新插件，您可以运行
--    :Lazy update
--
-- NOTE: 这是您安装插件的位置。
require('lazy').setup({
  {
    'potamides/pantran.nvim',
    config = function()
      local pantran = require 'pantran'
      pantran.setup {
        default_engine = 'google',
        engines = {
          google = {
            fallback = {
              default_source = 'auto',
              default_target = 'zh',
            },
          },
        },
      }

      vim.keymap.set('x', '<leader>t', pantran.motion_translate, { noremap = true, silent = true, expr = true, desc = '[T]ranslate' })
    end,
  },

  -- NOTE: 可以通过链接添加插件（或者对于 github 存储库：'owner/repo' 链接）。
  'tpope/vim-sleuth', -- 自动检测 tabstop 和 shiftwidth

  -- NOTE: 还可以使用表格添加插件，
  -- 第一个参数是链接，
  -- 后面是 keys 可用于配置插件的 behavior/loading/etc.
  --
  -- 使用 `opts = {}` 强制加载插件。
  --
  -- 这相当于：
  --    require('Comment').setup({})

  -- "gc" 注释视觉 regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- 这是一个更高级的示例，我们在其中传递配置
  -- `gitsigns.nvim` 的选项。这相当于下面的 Lua：
  --    require('gitsigns').setup({ ... })
  --
  -- 请参阅 `:help gitsigns` 以了解配置 keys 的作用
  { -- 将 git 相关标志添加到装订线中，以及用于管理更改的实用程序
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: 插件还可以配置为在加载时运行 Lua 代码。
  --
  -- 这对于 group configuration 和 handle 通常非常有用
  -- 延迟加载插件，不需要在启动时立即加载。
  --
  -- 例如，在下面的配置中，我们使用:
  --  event = 'VimEnter'
  --
  -- 在加载所有 UI 元素之前加载which-key。
  -- event 可以是普通自动命令事件 (`:help autocmd-events`)。
  --
  -- 然后，因为我们使用 `config` key，
  -- 所以配置只运行插件加载后：
  --  config = function() ... end

  { -- 有用的插件，可以显示待处理的按键绑定。
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
      }
    end,
  },

  -- NOTE: 插件可以指定依赖项。
  --
  -- 依赖项也是正确的插件规范 - 任何东西
  -- 您可以为顶层插件执行此操作，也可以为依赖项执行此操作。
  --
  -- 使用 `dependencies` 键来指定特定插件的依赖关系

  { -- 模糊查找器 (files, lsp, etc)
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
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
  },

  { -- LSP 配置和插件
    'neovim/nvim-lspconfig',
    dependencies = {
      -- 自动将 LSP 和相关工具安装到 Neovim 的 stdpath
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- LSP 有用的状态更新。
      -- NOTE: `opts = {}` 与调用 `require('fidget').setup({})` 相同
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` 为您的 Neovim 配置、运行时和插件设置 Lua LSP
      -- 用于 Neovim api 的补全、注释和签名
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- 旁白：**什么是 LSP？**
      --
      -- LSP 是您可能听说过的缩写，但可能不明白它是什么。
      --
      -- LSP 代表语言服务器协议。这是一个可以帮助编辑的协议
      -- 语言工具以标准化方式进行通信。
      --
      -- 一般来说，你有一个“服务器”，它是一些为理解特定语言而构建的工具（例如“gopls”、“lua_ls”、“rust_analyzer”等）。
      -- 这些语言服务器（有时称为 LSP 服务器，但这有点像 ATM 机）是与某些“客户端”通信的独立进程 - 在本例中为 Neovim！

      --
      -- LSP 为 Neovim 提供了以下功能：
      -- - 转到定义
      -- - 查找参考
      -- - 自动完成
      -- - 符号搜索
      -- - 和更多！
      --
      -- 因此，语言服务器是必须与 Neovim 分开安装的外部工具。这就是“mason”和相关插件发挥作用的地方。

      --
      -- 如果您想了解 lsp 对比 treesitter ，您可以查看精彩且优雅的帮助部分，`:help lsp-vs-treesitter`

      -- 当 LSP 连接到特定缓冲区时，该函数将运行。
      -- 也就是说，每次打开与 lsp 关联的新文件时（例如，打开 `main.rs` 与 `rust_analyzer` 关联），
      -- 都会执行此函数来配置当前缓冲区

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: 请记住，Lua 是一种真正的编程语言，
          -- 因此可以定义小的帮助程序和实用函数，这样您就不必重复自己。
          --
          -- 在本例中，我们创建一个函数，使我们能够更轻松地定义特定于 LSP 相关项的映射。
          -- 它每次都会为我们设置模式、缓冲区和描述。
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- 跳转到光标所在单词的定义。
          -- 这是第一次声明变量的地方，或者定义函数的地方等。
          -- 要返回，请按 <C-t>。
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- 查找光标下的单词的参考文档。
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- 跳转到光标所在单词的执行处。
          -- 当您的有声明类型但没有实际实现的方法时很有用。
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- 跳转到光标所在单词的类型。
          -- 当您不确定变量是什么类型并且想要查看时很有用
          -- 其*类型*的定义，而不是它*定义*的位置。
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- 模糊查找当前文档中的所有符号。
          -- 符号是指变量、函数、类型等。
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- 模糊查找当前工作区中的所有符号。
          -- 与文档符号类似，但搜索整个项目。
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- 重命名光标下的变量。
          -- 大多数语言服务器支持跨文件重命名等。
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- 执行代码操作，通常您的光标需要位于 LSP 的错误或建议之上才能激活。

          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- 打开一个弹出窗口，显示有关光标下的单词的文档
          -- 请参阅 `:help K` 了解为什么使用此键盘映射。
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: 这不是 Goto Definition，这是 Goto Declaration。
          -- 例如，在 C 中，这会将您带到 header。
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- 以下两个自动命令用于当光标停留一会儿时突出显示光标下单词的引用。
          -- 有关何时执行的信息，请参阅 `:help CursorHold`

          --
          -- 当您移动光标时，高亮显示将被清除（第二个自动命令）。
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- LSP 服务器和客户端能够相互通信它们支持的功能。
      -- 默认情况下，Neovim 并不支持 LSP 规范中的所有内容。
      -- 当您添加 nvim-cmp、luasnip 等时，Neovim 现在拥有*更多*功能。
      -- 因此，我们使用 nvim cmp 创建新功能，然后将其广播到服务器。
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- 启用以下语言服务器
      --  您可以在此处随意添加/删除任何您想要的 LSP。它们将自动安装。
      --
      --  在下表中添加任何其他覆盖配置。可用的 keys 有：
      --  - cmd (table)：覆盖用于启动服务器的默认命令
      --  - filetypes (table): 覆盖服务器关联文件类型的默认列表
      --  - capabilities (table): 覆盖功能中的字段。可用于禁用某些 LSP 功能。
      --  - settings (table): 覆盖初始化服务器时传递的默认设置。
      --      例如，要查看 `lua_ls` 的选项，您可以访问：https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... 请参阅 `:help lspconfig-all` 以获取所有预配置 LSP 的列表
        --
        -- 某些语言（如 typescript）具有有用的完整语言插件：
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- 但对于许多设置，LSP (`tsserver`) 就可以正常工作
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- 您可以在下面切换以忽略 Lua_LS 嘈杂的 “missing-fields” 警告
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- 确保安装了上述服务器和工具
      -- 要检查已安装工具的当前状态和/或手动安装其他工具，您可以运行

      --    :Mason
      --
      -- 您可以在此菜单中按 "g?" 获取帮助。
      require('mason').setup()

      -- 您可以在此处添加您希望 Mason 为您安装的其他工具，以便可以在 Neovim 中使用它们。

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- 用于格式化Lua代码
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- 这仅处理覆盖上面服务器配置显式传递的值。
            -- 在禁用 LSP 的某些功能时很有用（例如，关闭 tsserver 的 formatting）

            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- 自动格式化
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- 对于没有良好标准化编码风格的语言禁用“format_on_save lsp_fallback”。
        -- 您可以在此处添加其他语言或为禁用的语言重新启用它。
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform 还可以顺序运行多个格式化程序
        -- python = { "isort", "black" },
        --
        -- 您可以使用子列表来告诉 conform 运行*直到*找到格式化程序。
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- 自动补全
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
  },

  { -- 您可以轻松更改为不同的配色方案。
    -- 更改下面的 colorcheme 插件的名称，
    -- 然后将配置中的命令更改为该 colorcheme 的名称。
    --
    -- 如果你想查看已经安装了哪些颜色方案，可以使用`:Telescope colorscheme`。
    'folke/tokyonight.nvim',
    priority = 1000, -- 确保在所有其他启动插件之前加载此插件。
    init = function()
      -- 在此处加载配色方案。
      -- 与许多其他主题一样，这个主题有不同的风格，您可以加载任何其他主题，
      -- 例如“tokyonight-storm”、“tokyonight-moon”或“tokyonight-day”。
      vim.cmd.colorscheme 'tokyonight-night'

      -- 您可以通过执行以下操作来配置突出显示：
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- 在评论中突出显示待办事项、注释等
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- 各种小型独立插件/模块的集合
    'echasnovski/mini.nvim',
    config = function()
      -- 更好的 Around/Inside textobjects
      --
      -- 例如:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- 简单易用的状态栏。
      -- 如果您不喜欢它，您可以删除此设置调用，并尝试其他状态行插件
      local statusline = require 'mini.statusline'
      -- 如果您有 Nerd 字体，请将 use_icons 设置为 true
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- 您可以通过覆盖状态行中的部分的默认行为来配置它们。
      -- 例如，这里我们将光标位置的部分设置为 LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ...还有更多！
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- 突出显示、编辑和导航代码
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
  },

  -- 以下两条注释仅在您下载了 kickstart 存储库时才有效，而不仅仅是复制粘贴 init.lua。
  -- 如果您需要这些文件，它们位于存储库中，因此您只需下载它们并将它们放在正确的位置即可。

  -- NOTE: Neovim 之旅的下一步：为 Kickstart 添加/配置其他插件
  --
  -- 以下是我已包含在 Kickstart 存储库中的一些示例插件。
  -- 取消注释以下任何行以启用它们（您将需要重新启动 nvim ）。
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',

  -- NOTE: 下面的导入可以自动从 `lua/custom/plugins/*.lua` 添加您自己的插件、配置等，
  -- 这是模块化配置的最简单方法。
  --
  -- 取消注释以下行并将插件添加到 `lua/custom/plugins/*.lua` 即可开始。
  -- 有关更多信息，请参阅 `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- 如果您使用的是 Nerd Font：将图标设置为空表，该表将使用默认的lazy.nvim 定义的 Nerd Font 图标，否则定义一个 unicode 图标表
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- 下面的行称为 `modeline`。请参阅 `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
