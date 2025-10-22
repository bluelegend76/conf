
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set global variables here (e.g., leader key)
vim.g.mapleader = ","

-- Setup lazy.nvim
require("lazy").setup({
  -- Plugins go here
  'nvim-telescope/telescope.nvim',
  { 'folke/tokyonight.nvim', lazy = true }, -- Example of lazy-loading
})

