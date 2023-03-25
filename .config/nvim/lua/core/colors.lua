--------------------------------------------------------------------------------
-- RioVim Color schemes
--------------------------------------------------------------------------------

vim.cmd "colorscheme nord"

local M = {}

-- nord
M.nord = {
    bg = "#2e3440",
    fg = "#d8dee9",
    pink = "#848ead",
    green = "#a3be8c",
    cyan = "#88c0d0",
    yellow = "#ebcb8b",
    orange = "#dd8770",
    red = "#bf616a",
}

-- edge (dark)
M.edge_dark = {
    bg = "#24272a",
    fg = "#c5cdd9",
    pink = "#d38aea",
    green = "#a0c980",
    cyan = "#5d88c1",
    yellow = "#ed8974",
    orange = "#ec2729",
    red = "#ec7279",
}

-- iceberg
M.iceberg = {
    bg = "#dcdfe7",
    fg = "#818596",
    pink = "#cc517a",
    green = "#668e3d",
    cyan = "#2d539e",
    yellow = "#c0ca8e",
    orange = "#c57339",
    red = "#e98989",
}

-- OneDark (dark)
M.onedark_dark = {
    bg = "#282c34",
    fg = "#b2bbcc",
    pink = "#c678dd",
    green = "#98c379",
    cyan = "#56b6c2",
    yellow = "#e5c07b",
    orange = "#d19a66",
    red = "#e86671",
}

-- Monokai (classic)
M.monokai = {
    bg = "#202328",
    fg = "#f8f8f0",
    pink = "#f92672",
    green = "#a6e22e",
    cyan = "#66d9ef",
    yellow = "#e6db74",
    orange = "#fd971f",
    red = "#e95678",
}

return M
