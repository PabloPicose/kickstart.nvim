return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { '<leader>e', '<cmd>Neotree<cr>', desc = 'Open TreeFile', mode = 'n' },
    },
    opts = {
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<space>'] = 'none',
          ['Y'] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            desc = 'Copy Path to Clipboard',
          },
          ['S'] = 'open_vsplit',
        },
      },
    },
    init = function()
      -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
      -- because `cwd` is not set up properly.
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
        desc = 'Start Neo-tree with directory',
        once = true,
        callback = function()
          if package.loaded['neo-tree'] then
            return
          else
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == 'directory' then
              require 'neo-tree'
            end
          end
        end,
      })
    end,
    -- config = function()
    --   require('neo-tree').setup {
    --     -- other configuration settings you want to keep
    --     window = {
    --       mappings = {
    --         ['l'] = 'open',
    --         ['h'] = 'close_node',
    --         ['<space>'] = 'none',
    --         ['Y'] = {
    --           function(state)
    --             local node = state.tree:get_node()
    --             local path = node:get_id()
    --             vim.fn.setreg('+', path, 'c')
    --           end,
    --           desc = 'Copy Path to Clipboard',
    --         },
    --       },
    --     },
    --   }
    -- end,
  },
}
