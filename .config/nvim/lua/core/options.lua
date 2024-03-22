--------------------------------------------------------------------------------
-- RioVim options.
--
-- General Neovim settings and configuration.
--------------------------------------------------------------------------------

local g = vim.g
local opt = vim.opt

--------------------------------------------------------------------------------
-- General.
--------------------------------------------------------------------------------
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.swapfile = false
opt.completeopt = "menuone,noinsert,noselect"

opt.cursorline = true
opt.whichwrap = "b,s,<,>,~,[,]"
opt.virtualedit = "onemore"

-- File.
opt.encoding = "utf-8"
opt.fileencodings = "utf-8,enc-jp,iso-20220-jp"
opt.fileformats = "unix,mac,dos"

-- Timeout.
opt.timeout = true
opt.timeoutlen = 300

--------------------------------------------------------------------------------
-- Neovim UI.
--------------------------------------------------------------------------------
opt.guifont = "SauceCodePro Nerd Font:h12,monospace:h12"
opt.number = true
opt.showmatch = true
opt.foldmethod = "marker"
opt.colorcolumn = "80"
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.linebreak = false
opt.termguicolors = true
opt.laststatus = 3
opt.signcolumn = "yes"
opt.updatetime = 100
opt.title = true
opt.list = true
opt.listchars = "tab:»-,extends:»,precedes:«,nbsp:%"

--------------------------------------------------------------------------------
-- Tabs, indent.
--------------------------------------------------------------------------------
opt.autoindent = true
opt.expandtab = false 
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

--------------------------------------------------------------------------------
-- Search.
--------------------------------------------------------------------------------
opt.hlsearch = true
opt.wrapscan = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

--------------------------------------------------------------------------------
-- Memory, CPU.
--------------------------------------------------------------------------------
opt.hidden = true
opt.history = 100
opt.undofile = true
opt.confirm = true
opt.backup = false
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 250

--------------------------------------------------------------------------------
-- Startup.
--------------------------------------------------------------------------------

-- Disable nvim intro.
opt.shortmess:append "sI"

-- Disable builtin plugins.
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
