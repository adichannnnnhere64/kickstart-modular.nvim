local blink = require("blink.cmp")

return {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    root_markers = { "composer.json", ".git" },
}
