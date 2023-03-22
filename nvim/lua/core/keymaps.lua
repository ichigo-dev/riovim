--------------------------------------------------------------------------------
-- RioVim keymaps
--------------------------------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- change leader
vim.g.mapleader = "<Space>"

-- util
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<Esc><Esc>", ":noh<CR>")

-- copy and paste
map("n", "<Space>p", '"+p')
map("n", "<Space>y", '"+y')

-- window
map("n", "<Space>s", ":sp<CR>")
map("n", "<Space>v", ":vs<CR>")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<Space>j", "<C-w>j")
map("n", "<Space>k", "<C-w>k")
map("n", "<Space>h", "<C-w>h")
map("n", "<Space>l", "<C-w>l")
map("n", "<Space>w", "<C-w>w")
map("n", "<Space>W", "<C-w>W")
map("n", "<Space>r", "<C-w>r")
map("n", "<Space>R", "<C-w>R")
map("n", "<Space>J", "<C-w>J")
map("n", "<Space>K", "<C-w>K")
map("n", "<Space>H", "<C-w>H")
map("n", "<Space>L", "<C-w>L")
map("n", "<Space><", "<C-w><")
map("n", "<Space>>", "<C-w>>")
map("n", "<Space>-", "<C-w>-")
map("n", "<Space>+", "<C-w>+")

-- terminal
map("n", "<Space>t", "<cmd> belowright new <CR><cmd> terminal <CR>")
map("t", "<C-j>", "<cmd> wincmd j <CR>")
map("t", "<C-k>", "<cmd> wincmd k <CR>")
map("t", "<C-h>", "<cmd> wincmd h <CR>")
map("t", "<C-l>", "<cmd> wincmd l <CR>")
map("t", "<Space>j", "<cmd> wincmd j <CR>")
map("t", "<Space>k", "<cmd> wincmd k <CR>")
map("t", "<Space>h", "<cmd> wincmd h <CR>")
map("t", "<Space>l", "<cmd> wincmd l <CR>")
map("t", "<Space>-", "<cmd> wincmd - <CR>")
map("t", "<Space>+", "<cmd> wincmd + <CR>")

-- plugin
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<Space>n", "<cmd> NvimTreeToggle <CR>")
map("n", "<Space>f", "<cmd> Telescope find_files<CR>")
map("n", "<Space>g", "<cmd> Telescope live_grep<CR>")
