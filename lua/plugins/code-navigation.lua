return {

    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    {
        'echasnovski/mini.ai',
        version = '*',
        opts = {},
    },

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    {
        'echasnovski/mini.surround',
        version = '*',
        opts = {},
    },

    -- gc to comment visual, or gcc normal
    {
        'echasnovski/mini.comment',
        version = '*',
        opts = {},
    },

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'c',
                    'cpp',
                    'go',
                    'lua',
                    'python',
                    'rust',
                    'tsx',
                    'typescript',
                    'javascript',
                    'vim',
                    'vimdoc',
                    'bash',
                    'html',
                    'markdown',
                    'hyprlang',
                    'json',
                    'jsonc',
                    'rasi',
                    'toml',
                    'xml',
                    'yaml',
                    'dockerfile',
                },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            }

            vim.filetype.add {
                extension = { rasi = 'rasi' },
                pattern = {
                    ['.*/waybar/config'] = 'jsonc',
                    ['.*/mako/config'] = 'dosini',
                    ['.*/kitty/*.conf'] = 'bash',
                    ['.*/hypr/.*%.conf'] = 'hyprlang',
                },
            }

            -- There are additional nvim-treesitter modules that you can use to interact
            -- with nvim-treesitter. You should go explore a few and see what interests you:
            --
            --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
            --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },
}
-- vim: ts=2 sts=2 sw=2 et
