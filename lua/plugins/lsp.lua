-- LSP 配置和插件
return {
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
        map('<leader>pd', vim.lsp.buf.hover, '[P]eek [D]ocumentation')

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
}

-- vim: ts=2 sts=2 sw=2 et
