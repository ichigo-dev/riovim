--------------------------------------------------------------------------------
-- RioVIm plugin manager
--
-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim
--------------------------------------------------------------------------------

-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- Start setup
lazy.setup({
    spec = {

        -- Colorschemes
        {
            "arcticicestudio/nord-vim",
            lazy = false,
            priority = 1000,
        },

        {
            "sainnhe/edge",
            lazy = true,
        },

        {
            "navarasu/onedark.nvim",
            lazy = true,
        },

        {
            "cocopon/iceberg.vim",
            lazy = true,
        },

        {
            "tanvirtin/monokai.nvim",
            lazy = true,
        },

        -- Icons
        {
            "kyazdani42/nvim-web-devicons",
            lazy = true,
        },

        -- Dashboard
        {
            "goolord/alpha-nvim",
            lazy = true,
            dependencies = { "kyazdani42/nvim-web-devicons" },
        },

        -- Git labels
        {
            "lewis6991/gitsigns.nvim",
            lazy = true,
            dependencies = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("gitsigns").setup()
            end,
        },

        -- FileTree
        {
            "kyazdani42/nvim-tree.lua",
            cmd = { "NvimTreeToggle", "NvimTreeFocus" },
            dependencies = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("nvim-tree").setup()
            end,
        },

        -- Statusline
        {
            "freddiehaddad/feline.nvim",
            lazy = false,
            dependencies = {
                "kyazdani42/nvim-web-devicons",
                "lewis6991/gitsigns.nvim",
            },
        },

        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
            build = ":TSUpdate",
        },

        -- Indent line
        {
            "lukas-reineke/indent-blankline.nvim",
            lazy = false,
        },

        -- LSP
        {
            "neovim/nvim-lspconfig",
            lazy = false,
        },

        {
            "williamboman/mason.nvim",
            cmd = {
                "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall",
                "MasonUninstallAll", "MasonLog",
            },
            config = function()
                require("mason").setup()
            end,
        },

        -- Autocomplete
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
            },
        },

        -- Fazzy finder
        {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            dependencies = { 'nvim-lua/plenary.nvim' },
        },

        -- Git
        {
            "tpope/vim-fugitive",
            lazy = false,
        },

        -- Which key
        {
            "folke/which-key.nvim",
            lazy = false,
        },

        -- Markdown
        {
            "previm/previm",
            lazy = false,
            config = function()
                vim.g.previm_open_cmd = "firefox"
            end,
        },
    },
})
