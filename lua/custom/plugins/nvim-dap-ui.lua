return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
    },
  },
}

-- 'o' => while the cursor is in the ui, goto file:line in the main window
--
