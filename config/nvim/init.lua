require("jesseward.plugins-setup")
require("jesseward.core.options")
require("jesseward.core.keymaps")
require("jesseward.core.colorscheme")
require("jesseward.plugins.nvim-tree")
require("jesseward.plugins.comment")
require("jesseward.plugins.lualine")
require("jesseward.plugins.lsp")
require("jesseward.plugins.go")
-- :lua vim.lsp.buf.formatting() <-- autoformat lua syntax
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})
