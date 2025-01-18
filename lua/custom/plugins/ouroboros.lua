-- Switch between cpp/hpp files

return {
  {
    'jakemason/ouroboros.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'folke/which-key.nvim',
    },
    opts = {},
    config = function()
      local wk = require 'which-key'
      require('ouroboros').setup {
        switch_to_open_pane_if_possible = true,
      }
      wk.add {
        { '<leader>co', '<cmd>Ouroboros<cr>', desc = 'Switch header/source', mode = 'n' },
      }
    end,
  },
}
