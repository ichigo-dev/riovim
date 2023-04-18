--------------------------------------------------------------------------------
-- RioVim File manager
--------------------------------------------------------------------------------

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvim_tree.setup {
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set("n", "a", api.fs.create, opts("Create"))
        vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
        vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
        vim.keymap.set("n", "c", api.fs.cut, opts("Cut"))
        vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
        vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))

        vim.keymap.set("n", "H", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "e", api.tree.change_root_to_node, opts("CD"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open: Edit"))
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
        vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))

        vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))

        vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
        vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
        vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
        vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    end,
    auto_reload_on_write = true,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    remove_keymaps = false,
    select_prompts = false,
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = 34,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { "term" },
    },
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
    modified = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive",
                        "fugitiveblame"
                    },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "trash-put",
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    tab = {
        sync = {
            open = false,
            close = false,
            ignore = {},
        },
    },
    notify = {
        threshold = vim.log.levels.INFO,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
}
