-- bootstrap Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- setup lazy
require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "java"},
              sync_install = false,
              highlight = { enable = true },
	      -- buggy indent, leave it to be off
              indent = { enable = false },  
            })
        end
    },
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        config = function()
          -- Optionally configure and load the colorscheme
          -- directly inside the plugin declaration.
          vim.g.gruvbox_material_enable_italic = true
          vim.cmd.colorscheme('gruvbox-material')
        end
    },
    {
        "tpope/vim-fugitive",
    },
})


vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.nu = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
