return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      menu = {
        -- Tells Harpoon’s quick menu to be nearly as wide as the current window
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        -- Automatically save any changes to Harpoon’s state when the menu is toggled
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          '<leader>la',
          function()
            require('harpoon'):list():add()
          end,
          desc = 'Harpoon File',
        },
        {
          '<leader>lm',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Harpoon Quick Menu',
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          '<leader>l' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end
      return keys
    end,
  },
}
