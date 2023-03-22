--------------------------------------------------------------------------------
-- RioVim autocommand functions
--------------------------------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("setIndent", { clear = true })
autocmd("Filetype", {
    group = "setIndent",
    pattern = {
        "xml", "html", "xhtml"
    },
    command = "setlocal shiftwidth=1 tabstop=1",
})

-- terminal

autocmd("TermOpen", { command = "startinsert" })
autocmd("TermOpen", { command = "setlocal norelativenumber" })
autocmd("TermOpen", { command = "setlocal nonumber" })

autocmd("BufEnter", {
    pattern = "term://*",
    command = "startinsert",
})

autocmd("TermClose", { command = "q" })
