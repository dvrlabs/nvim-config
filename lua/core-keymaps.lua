-- [[ Core Keymaps ]]
local k = vim.keymap.set

-- Escapes
k('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true, desc = 'Clear highlight on search' })
k('t', '<Esc>', '<C-\\><C-n>:bdelete!<CR>', { silent = true, desc = 'Exit terminal mode' })

-- Windows
k('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
k('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
k('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
k('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Buffers
k('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
k('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
-- NOTE: The above disables the High/Low functionality. Use relative line numbers instead.
k('n', '<leader><Left>', '<Cmd>BufferMovePrevious<CR>', { desc = '[←] Swap Buffer Left', noremap = true, silent = true })
k('n', '<leader><Right>', '<Cmd>BufferMoveNext<CR>', { desc = '[→] Swap Buffer Right ', noremap = true, silent = true })
k('n', '<leader><leader>', '<Cmd>BufferPick<CR>', { desc = '[ ] Pick Buffer ', noremap = true, silent = true })
k('n', '<leader>c', '<Cmd>BufferClose<CR>', { desc = '[C]lose Buffer', noremap = true, silent = true })
k('n', '<leader>q', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', { desc = '[Q]uit other buffers', noremap = true, silent = true })
k('n', '<leader>i', '<Cmd>BufferPin<CR>', { desc = 'P[i]n Buffer', noremap = true, silent = true })
k('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })
k('n', '<leader>0', '<Cmd>BufferLast<CR>', { desc = 'which_key_ignore', noremap = true, silent = true })

-- Plugins
k('n', '<leader>p', '<cmd>Lazy<CR>', { desc = '[P]ackage Manager' })
k('n', '<leader>nh', '<cmd>NoiceHistory<CR>', { desc = '[H]istory' })
k('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', { desc = '[D]ismiss Messages' })
k('n', '<leader>t', ':ToggleTerm<CR>', { desc = '[T]erminal' })

-- vim: ts=2 sts=2 sw=2 et
