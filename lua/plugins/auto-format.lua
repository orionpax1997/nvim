-- 自动格式化
return {
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
}

-- vim: ts=2 sts=2 sw=2 et
