-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.python3_host_prog = "/home/christian/.local/share/p3nvim/bin/python"
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--     pattern = {
--         "build.sh",
--         "*.subpackage.sh",
--         "PKGBUILD",
--         "*.install",
--         "makepkg.conf",
--         "*.ebuild",
--         "*.eclass",
--         "color.map",
--         "make.conf",
--     },
--     callback = function()
--         vim.lsp.start({
--             name = "termux",
--             cmd = { "termux-language-server" },
--         })
--     end,
-- })

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
