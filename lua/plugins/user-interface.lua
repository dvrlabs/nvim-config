return {

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Add indentation guides even on blank lines
  -- See `:help ibl`
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '┊' },
    },
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
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

  -- ColorScheme
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'everforest'
      vim.g.everforest_background = 'hard'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Adds fancy command bar, notifications, search
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },

      -- Need this to show @recording
      routes = {
        {
          view = 'cmdline',
          filter = { event = 'msg_showmode' },
        },
      },
    },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>c'] = { name = '[L]sp', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

  -- Statusline
  {
    'echasnovski/mini.statusline',
    version = '*',
    opts = {},
  },

  -- Fancy animations around movement, ctrl-u, ctrl-d, etc
  {
    'echasnovski/mini.animate',
    version = '*',
    opts = {},
  },

  -- Work with terminals
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    },
  },
}
