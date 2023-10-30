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
vim.g.mapleader = " "

-- util
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<Esc><Esc>", ":noh<CR>")
map("i", "jj", "<Esc>")

-- copy and paste
map("n", "<Leader>p", '"+p')
map("n", "<Leader>y", '"+y')

-- window
map("n", "<Leader>s", ":sp<CR>")
map("n", "<Leader>v", ":vs<CR>")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>l", "<C-w>l")
map("n", "<Leader>w", "<C-w>w")
map("n", "<Leader>W", "<C-w>W")
map("n", "<Leader>r", "<C-w>r")
map("n", "<Leader>R", "<C-w>R")
map("n", "<Leader>J", "<C-w>J")
map("n", "<Leader>K", "<C-w>K")
map("n", "<Leader>H", "<C-w>H")
map("n", "<Leader>L", "<C-w>L")
map("n", "<Leader><", "<C-w><")
map("n", "<Leader>>", "<C-w>>")
map("n", "<Leader>-", "<C-w>-")
map("n", "<Leader>+", "<C-w>+")

-- tab(buffer)
map("n", "<C-[>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-]>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<C-x>", "<cmd> bdelete | bprevious <CR>")
map("n", "<Leader>1", "<cmd> BufferLineGotoBuffer 1 <CR>")
map("n", "<Leader>2", "<cmd> BufferLineGotoBuffer 2 <CR>")
map("n", "<Leader>3", "<cmd> BufferLineGotoBuffer 3 <CR>")
map("n", "<Leader>4", "<cmd> BufferLineGotoBuffer 4 <CR>")
map("n", "<Leader>5", "<cmd> BufferLineGotoBuffer 5 <CR>")
map("n", "<Leader>6", "<cmd> BufferLineGotoBuffer 6 <CR>")
map("n", "<Leader>7", "<cmd> BufferLineGotoBuffer 7 <CR>")
map("n", "<Leader>8", "<cmd> BufferLineGotoBuffer 8 <CR>")
map("n", "<Leader>9", "<cmd> BufferLineGotoBuffer 9 <CR>")
map("n", "<Leader>[", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<Leader>]", "<cmd> BufferLineCycleNext <CR>")
map("n", "<Leader>x", "<cmd> bdelete | bprevious <CR>")

-- terminal
map("n", "<C-t>", "<cmd> belowright new <CR><cmd> terminal <CR>")
map("n", "<Leader>t", "<cmd> belowright new <CR><cmd> terminal <CR>")
map("t", "<C-t>", "<cmd> vsplit <CR><cmd> terminal <CR>")
map("t", "<C-j>", "<cmd> wincmd j <CR>")
map("t", "<C-k>", "<cmd> wincmd k <CR>")
map("t", "<C-h>", "<cmd> wincmd h <CR>")
map("t", "<C-l>", "<cmd> wincmd l <CR>")
map("t", "<C-[>", "<cmd> BufferLineCyclePrev <CR>")
map("t", "<C-]>", "<cmd> BufferLineCycleNext <CR>")
map("t", "<C-x>", "<cmd> bdelete | bprevious <CR>")

-- plugin
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<Leader>n", "<cmd> NvimTreeToggle <CR>")
map("n", "<Leader>f", "<cmd> Telescope find_files<CR>")
map("n", "<Leader>g", "<cmd> Telescope live_grep<CR>")
map("n", "<Leader>d", "<cmd> Telescope diagnostics<CR>")
