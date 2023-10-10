--------------------------------------------------------------------------------
-- RioVim telescope
--------------------------------------------------------------------------------
--
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup({
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            scroll_speed = 1,
        }
    },
})
