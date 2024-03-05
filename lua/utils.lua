--[[
Utils is for utility/helper functions to help configure other files.
Some of it is functionality.
Some of it is just used to make other files more terse and less verbose.
--]]

local M = {}

-- Normal Keymap
-- See `:help vim.keymap.set()`
function M.nk(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Silent = true,
function M.nks(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc, silent = true })
end

-- Silent = true, noremap = true
function M.nksnore(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc, noremap = true, silent = true })
end

-- Terminal Keymap
function M.tk(keys, func, desc)
  vim.keymap.set('t', keys, func, { desc = desc })
end

-- Silent = true,
function M.tks(keys, func, desc)
  vim.keymap.set('t', keys, func, { desc = desc, silent = true })
end

-- Silent = true, noremap = true
function M.tksnore(keys, func, desc)
  vim.keymap.set('t', keys, func, { desc = desc, noremap = true, silent = true })
end

return M
