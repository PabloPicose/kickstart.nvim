-- Format the code
return {
  {
    'stevearc/conform.nvim',
    -- Load the plugin just before a buffer is written to a file.
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {},
    keys = {
      {
        '<leader>cf',
        function()
          -- lsp_format = 'fallback' option indicates that if LSP is available
          -- it hsould be user; otherwise, fallback to other configured formatters.
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '', -- this mode allow to format the current buffer
        desc = '[F]ormat buffer',
      },
    },
  },
}
