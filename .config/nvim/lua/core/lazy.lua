--------------------------------------------------------------------------------
-- RioVim plugin manager.
--
-- Use the `lazy` plugin manager to load plugins asynchronously.
--
-- reference:
--     https://github.com/folke/lazy.nvim
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

-- Start setup.
lazy.setup({
    spec = {

        ------------------------------------------------------------------------
        -- Colorscheme.
        --
        -- reference:
        --     https://github.com/nordtheme/vim
        ------------------------------------------------------------------------
        {
            "nordtheme/vim",
            lazy = false,
            priority = 1000,
        },

        ------------------------------------------------------------------------
        -- Display icons in file tree, statusline, buffer line, etc.
        --
        -- reference:
        --     https://github.com/nvim-tree/nvim-web-devicons
        ------------------------------------------------------------------------
        {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
            config = function()
                require("nvim-web-devicons").setup {
                    strict = true,
                    override_by_extension = {
                        ["txt"] = {
                            icon = "",
                            color = "#ffffff",
                            name = "txt"
                        },
                    },
                }
            end,
        },

        ------------------------------------------------------------------------
        -- Show the dashboard when starting Nvim.
        --
        -- reference:
        --     https://github.com/goolord/alpha-nvim
        ------------------------------------------------------------------------
        {
            "goolord/alpha-nvim",
            lazy = true,
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        ------------------------------------------------------------------------
        -- File tree: Display a list of files. Use the `Ctrl + n` key binding
        -- to toggle the file tree.
        --
        -- reference:
        --     https://github.com/nvim-tree/nvim-tree.lua
        ------------------------------------------------------------------------
        {
            "nvim-tree/nvim-tree.lua",
            lazy = true,
            cmd = { "NvimTreeToggle", "NvimTreeFocus" },
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("nvim-tree").setup()
            end,
        },

        ------------------------------------------------------------------------
        -- Bufferline: Display a list of buffers.
        --
        -- reference:
        --     https://github.com/akinsho/bufferline.nvim
        ------------------------------------------------------------------------
        {
            "akinsho/bufferline.nvim",
            lazy = true,
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        ------------------------------------------------------------------------
        -- Statusline: Display information about the current file.
        --
        -- reference:
        --     https://github.com/freddiehaddad/feline.nvim
        ------------------------------------------------------------------------
        {
            "freddiehaddad/feline.nvim",
            lazy = true,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
                "lewis6991/gitsigns.nvim",
            },
        },

        ------------------------------------------------------------------------
        -- Treesitter: Analyze program code for highlighting, navigation, etc.
        --
        -- reference:
        --     https://github.com/nvim-treesitter/nvim-treesitter
        ------------------------------------------------------------------------
        {
            "nvim-treesitter/nvim-treesitter",
            lazy = true,
            cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
            build = ":TSUpdate",
        },

        ------------------------------------------------------------------------
        -- Language Server Protocol (LSP): Help with code completion, etc.
        -- We use Mason to manage the LSP servers. To enable LSP for a new
        -- language, run `MasonInstall <language>`.
        --
        -- reference:
        --     https://github.com/neovim/nvim-lspconfig
        --     https://github.com/williamboman/mason.nvim
        --     https://github.com/williamboman/mason-lspconfig.nvim
        --     https://github.com/onsails/lspkind.nvim
        ------------------------------------------------------------------------
        {
            "neovim/nvim-lspconfig",
            lazy = true,
        },

        {
            "williamboman/mason.nvim",
            lazy = true,
            cmd = {
                "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall",
                "MasonUninstallAll", "MasonLog",
            },
            config = function()
                require("mason").setup()
            end,
        },

        {
            "williamboman/mason-lspconfig.nvim",
            lazy = true,
        },
        {
            "onsails/lspkind.nvim",
            lazy = true,
        },

        ------------------------------------------------------------------------
        -- Complementing the content proposed by LSP, Copilot, etc.
        --
        -- reference:
        --     https://github.com/hrsh7th/nvim-cmp
        ------------------------------------------------------------------------
        {
            "hrsh7th/nvim-cmp",
            lazy = true,
            event = "InsertEnter",
            dependencies = {
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
            },
        },

        ------------------------------------------------------------------------
        -- Finder for discovering files by keyword, file name, etc. File name
        -- search with `Reader + f`, grep search with `Reader + g`, diagnostic
        -- search with `Reader + d`.
        --
        -- reference:
        --     https://github.com/nvim-telescope/telescope.nvim
        ------------------------------------------------------------------------
        {
            "nvim-telescope/telescope.nvim",
            lazy = true,
            cmd = "Telescope",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("telescope").setup {
                    defaults = {
                        mappings = {
                            i = {
                                ["<C-d>"] = require("telescope.actions").preview_scrolling_up,
                                ["<C-f>"] = require("telescope.actions").preview_scrolling_down,
                            },
                        },
                    },
                }
            end,
        },

        ------------------------------------------------------------------------
        -- Enable to run Git commands in Nvim and display the status of the
        -- file changes.
        --
        -- reference:
        --     https://github.com/tpope/vim-fugitive
        --     https://github.com/lewis6991/gitsigns.nvim
        --     https://github.com/NeogitOrg/neogit
        --     https://github.com/sindrets/diffview.nvim
        --     https://github.com/github/copilot.vim
        ------------------------------------------------------------------------
        {
            "tpope/vim-fugitive",
            lazy = false,
        },

        {
            "lewis6991/gitsigns.nvim",
            lazy = true,
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("gitsigns").setup()
            end,
        },

        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },

        {
            "sindrets/diffview.nvim",
            lazy = true,
        },

        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "sindrets/diffview.nvim",
                "nvim-lua/telescope.nvim",
            },
            config = true,
        },

        -- GitHub copilot
        {
            "github/copilot.vim",
            lazy = false,
            config = function()
                vim.g.copilot_filetypes = {
                    gitcommit = true,
                    markdown = true,
                    text = true,
                    yaml = true,
                }
            end,
        },

        ------------------------------------------------------------------------
        -- Highlight colors in the files.
        --
        -- reference:
        --     https://github.com/norcalli/nvim-colorizer.lua
        ------------------------------------------------------------------------
        {
            "norcalli/nvim-colorizer.lua",
            lazy = true,
            config = function()
                require("colorizer").setup {
                    filetypes={ "*" },
                    buftypes={ "*" },
                    use_default_options,
                }
            end,
        },

        ------------------------------------------------------------------------
        -- Enpower markdown editing and preview in browser.
        --
        -- reference:
        --     https://github.com/preservim/vim-markdown
        --     https://github.com/previm/previm
        ------------------------------------------------------------------------
        {
            "preservim/vim-markdown",
            lazy = false,
            config = function()
                vim.g.vim_markdown_folding_disabled = 1
            end,
        },

        {
            "previm/previm",
            lazy = true,
            config = function()
                vim.g.previm_open_cmd = "firefox"
            end,
        },

        ------------------------------------------------------------------------
        -- Display the indent line.
        --
        -- reference:
        --     https://github.com/lukas-reineke/indent-blankline.nvim
        ------------------------------------------------------------------------
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
        },

        ------------------------------------------------------------------------
        -- Display the popup with possible key bindings.
        --
        -- reference:
        --     https://github.com/folke/which-key.nvim
        ------------------------------------------------------------------------
        {
            "folke/which-key.nvim",
            lazy = true,
        },

        ------------------------------------------------------------------------
        -- Display the rich notice.
        --
        -- reference:
        --     https://github.com/folke/noice.nvim
        ------------------------------------------------------------------------
        {
            "MunifTanjim/nui.nvim",
            lazy = true,
        },

        {
            "folke/noice.nvim",
            event = "VeryLazy",
            lazy = true,
            dependences = {
                "MunifTanjim/nui.nvim",
            }
        },
    },
})
