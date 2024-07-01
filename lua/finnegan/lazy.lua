local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "finnegan.plugins" },
  { import = "finnegan.plugins.lsp" },
  { import = "finnegan.plugins_no_vscode", cond = (function() return not vim.g.vscode end) }
}, {
  checker = {
    enable = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

