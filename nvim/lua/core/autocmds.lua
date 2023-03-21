--------------------------------------------------------------------------------
-- RioVim autocommand functions
--------------------------------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('setIndent', { clear = true })
autocmd('Filetype', {
    group = 'setIndent',
    pattern = {
        'xml', 'html', 'xhtml'
    },
    command = 'setlocal shiftwidth=1 tabstop=1'
})
