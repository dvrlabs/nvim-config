-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
    { -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- If encountering errors, see telescope-fzf-native README for install instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            -- Useful for getting pretty icons, but requires special font.
            --  If you already have a Nerd Font, or terminal set up with fallback fonts
            --  you can enable this
            -- { 'nvim-tree/nvim-web-devicons' }
        },
        config = function()
            -- Telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! It's more than just a "file finder", it can search
            -- many different aspects of Neovim, your workspace, LSP, and more!
            --
            -- The easiest way to use telescope, is to start by doing something like:
            --  :Telescope help_tags
            --
            -- After running this command, a window will open up and you're able to
            -- type in the prompt window. You'll see a list of help_tags options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require('telescope').setup {
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
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

            -- Enable telescope extensions, if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            local w = require('which-key').add
            w { '<leader>s', group = '[S]earch' }

            -- See `:help telescope.builtin`
            local b = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sh', b.help_tags, { desc = '[H]elp' })
            vim.keymap.set('n', '<leader>sk', b.keymaps, { desc = '[K]eymaps' })
            vim.keymap.set('n', '<leader>sf', b.find_files, { desc = '[F]iles' })
            vim.keymap.set('n', '<leader>ss', b.builtin, { desc = '[S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', b.grep_string, { desc = 'Current [W]ord' })
            vim.keymap.set('n', '<leader>sg', b.live_grep, { desc = '[G]rep' })
            vim.keymap.set('n', '<leader>sd', b.diagnostics, { desc = '[D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', b.resume, { desc = '[R]esume' })
            vim.keymap.set('n', '<leader>s.', b.oldfiles, { desc = 'Recent Files ([.] for repeat)' })

            -- Disabled in favor of barbar.nvim
            -- vim.keymap.set('n', '<leader><leader>', b.buffers, { desc = '[ ] Find existing buffers' })

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                b.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- Also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set('n', '<leader>s/', function()
                b.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = '[/] in Open Files' })

            -- Shortcut for searching your neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                b.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[N]eovim files' })
        end,
    },
}
-- vim: ts=2 sts=2 sw=2 et
