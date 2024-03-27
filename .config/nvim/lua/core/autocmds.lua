--------------------------------------------------------------------------------
-- RioVim autocommand functions.
--------------------------------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


--------------------------------------------------------------------------------
-- Indentation settings for each file type.
--------------------------------------------------------------------------------
augroup("setIndent", { clear = true })
autocmd("Filetype", {
    group = "setIndent",
    pattern = {
        "xml", "html", "xhtml"
    },
    command = "setlocal shiftwidth=1 tabstop=1",
})


--------------------------------------------------------------------------------
-- Settings when switching terminal mode.
--------------------------------------------------------------------------------
autocmd("TermOpen", { command = "startinsert" })
autocmd("TermOpen", { command = "setlocal norelativenumber" })
autocmd("TermOpen", { command = "setlocal nonumber" })

autocmd("BufEnter", {
    pattern = "term://*",
    command = "startinsert",
})

autocmd("TermClose", { command = "bdelete | bprevious" })


--------------------------------------------------------------------------------
-- Write diff to buffer during git commit.
--------------------------------------------------------------------------------
local function append_diff()
    local git_dir = vim.fn.FugitiveGitDir()
    local git_root = vim.fn.fnamemodify(git_dir, ":h")
    local diff = vim.fn.system("git -C " .. git_root .. " diff --cached")
    local lines = vim.fn.split(diff, "\n")
    local comment_diff = ""
    for _, line in ipairs(lines) do
        comment_diff = comment_diff .. "# " .. line .. "\n"
    end
    vim.fn.append(vim.fn.line("$"), vim.fn.split(comment_diff, "\n"))
end

autocmd("BufReadPost", {
    pattern = "COMMIT_EDITMSG",
    callback = append_diff,
})
