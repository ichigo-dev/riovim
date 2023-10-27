--------------------------------------------------------------------------------
-- RioVim
--------------------------------------------------------------------------------

if vim.loader then vim.loader.enable() end
require("core/options")
require("core/lazy")
require("core/autocmds")
require("core/keymaps")
require("core/colors")
require("core/statusline")

-- Plugins
require("plugins/alpha_nvim")
require("plugins/lspconfig")
require("plugins/nvim_cmp")
require("plugins/nvim_tree")
require("plugins/nvim_treesitter")
require("plugins/bufferline")
require("plugins/telescope")
require("plugins/which_key")
return
