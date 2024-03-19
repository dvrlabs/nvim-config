-- F5, execute code!
local execute_code = function()
    if vim.bo.filetype == 'python' then
        local run_cmd = 'python ' .. vim.fn.expand '%:p'
        vim.cmd("TermExec cmd='" .. run_cmd .. "'")
    end
end
vim.keymap.set('n', '<F5>', execute_code, {})

-- Search and replace
local substitute_prompt = function()
    --local find = vim.fn.input("Find: ")
    local find = vim.fn.expand '<cword>'
    vim.api.nvim_echo({ { 'Replacing: "' .. find .. '"', 'Highlight' } }, true, {})
    local replace = vim.fn.input 'Replace: '
    if replace == '' then
        vim.api.nvim_echo({ { 'Canceled Replace.', 'Highlight' } }, true, {})
        return
    end
    vim.cmd('silent! %s/' .. find .. '/' .. replace .. '/g')
    vim.api.nvim_echo({ { find .. ' --> ' .. replace, 'Highlight' } }, true, {})
end

vim.keymap.set('n', '<leader>r', substitute_prompt, { desc = '[R]eplace word under cursor' })

-- Search and replace
local substitute_prompt_full = function()
    local find = vim.fn.input 'Find: '
    vim.api.nvim_echo({ { 'Replacing: "' .. find .. '"', 'Highlight' } }, true, {})
    local replace = vim.fn.input 'Replace: '
    if replace == '' then
        vim.api.nvim_echo({ { 'Canceled Replace.', 'Highlight' } }, true, {})
        return
    end
    vim.cmd('silent! %s/' .. find .. '/' .. replace .. '/g')
    vim.api.nvim_echo({ { find .. ' --> ' .. replace, 'Highlight' } }, true, {})
end

vim.keymap.set('n', '<leader>R', substitute_prompt_full, { desc = '[R]eplace word defined' })
