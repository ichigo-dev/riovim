--------------------------------------------------------------------------------
-- RioVim Treesitter
--------------------------------------------------------------------------------

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

nvim_treesitter.setup {
    ensure_installed = {
        "bash", "c", "cpp", "css", "html", "javascript", "json", "lua",
        "python", "rust", "typescript", "vim", "yaml",
    },
    sync_install = false,
    highlight = {
        enable = true,
    },
}
