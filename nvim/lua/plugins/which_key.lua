--------------------------------------------------------------------------------
-- RioVim which key
--------------------------------------------------------------------------------

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup {
    icons = {
        breadcrumb = "»",
        separator = "  ",
        group = "+",
    },
    popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
    },
    window = {
        border = "none",
    },
    layout = {
        spacing = 6,
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
}
