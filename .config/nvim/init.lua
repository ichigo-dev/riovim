--------------------------------------------------------------------------------
-- RioVim
--
-- This is an integrated development environment (IDE) for Nvim. It is a
-- collection of plugins and configurations that are designed to work
-- together to provide a seamless experience for the user.
--
-- If you want to add plugins, edit `core/lazy.lua`.
--------------------------------------------------------------------------------

if vim.loader then vim.loader.enable() end
require("core/options")
require("core/lazy")
require("core/autocmds")
require("core/keymaps")
require("core/colors")
require("core/statusline")

-- Plugin configurations.
require("plugins/alpha_nvim")
require("plugins/bufferline")
require("plugins/indent_blankline")
require("plugins/lspconfig")
require("plugins/noice")
require("plugins/nvim_cmp")
require("plugins/nvim_cmp_path")
require("plugins/nvim_tree")
require("plugins/nvim_treesitter")
require("plugins/telescope")
require("plugins/which_key")
return
