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

    -- Notification UI
    {
        'folke/noice.nvim',
        event = 'VeryLazy', -- Make sure 'VeryLazy' is a valid event or remove this line
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require('noice').setup {
                -- Noice setup configuration
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
                routes = {
                    {
                        view = 'cmdline',
                        filter = { event = 'msg_showmode' },
                    },
                },
            }

            local w = require('which-key').add
            w { '<leader>n', group = '[N]otifications' }
            w { '<leader>T', group = '[T]odo Comments' }
        end,
    },

    -- Useful plugin to show you pending keybinds.
    {
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        opts = {},
    },

    -- Statusline
    {
        'echasnovski/mini.statusline',
        version = '*',
        init = function()
            local statusline = require 'mini.statusline'
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end
        end,
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

    -- Tabs, as understood by any other editor!
    {
        'romgrk/barbar.nvim',
        dependencies = {
            -- OPTIONAL: for git status
            'lewis6991/gitsigns.nvim',
            -- OPTIONAL: for file icons
            'nvim-tree/nvim-web-devicons',
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
}
