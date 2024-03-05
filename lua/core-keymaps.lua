-- [[ Core Keymaps ]]
local u = require 'utils'

u.nk('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')

u.nks('<C-j>', ':bnext<CR>', 'Move focus to the lower window')
u.nks('<C-k>', ':bprevious<CR>', 'Move focus to the upper window')

u.nks('<leader>w', ':w<CR>:bdelete!<CR>', 'Write then Close')
u.nks('<leader>q', ':q<CR>', 'Quit')
u.nksnore('<leader>c', ':bdelete!<CR>', 'Close')

-- TODO: Find good uses for these unused maps

-- u.nks('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
-- u.nks('<C-l>', '<C-w><C-l>', 'Move focus to the right window')

u.nks('<leader>p', ':Lazy<CR>', 'Package Manager')
u.nks('<leader>nh', ':NoiceHistory<CR>', 'History')
u.nks('<leader>nd', ':NoiceDismiss<CR>', 'Dismiss Messages')

u.nks('<leader>t', ':ToggleTerm<CR>', 'Terminal')
u.tks('<Esc>', '<C-\\><C-n>:bdelete!<CR>', 'Exit terminal mode')

-- vim: ts=2 sts=2 sw=2 et
