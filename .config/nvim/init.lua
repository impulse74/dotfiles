-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Smart indentation
vim.o.smartindent = true

-- Tab width
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- Use spaces instead of tabs
vim.o.expandtab = true

-- Ignore case when searching
vim.o.ignorecase = true
-- Override ignorecase if the search contains uppercase letters
vim.o.smartcase = true
-- Incremental search
vim.o.incsearch = true
-- Highlight search results
vim.o.hlsearch = true

-- Line wrapping
vim.o.wrap = true

-- Always show tab line
vim.o.showtabline = 1

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>h", vim.cmd.Ex)
vim.keymap.set("n", "<leader>tn", ":tabnew | Explore<CR>", { silent = true });
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true });
vim.keymap.set("v", "♠", '"+y')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            'EdenEast/nightfox.nvim',
            lazy = false,
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                vim.cmd("colorscheme carbonfox")
            end,
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                require("lualine").setup({})
            end,
        },
        {
            "nvim-telescope/telescope.nvim", 
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("telescope").setup({})

                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
                vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
                vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
                vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
            end,    
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local config = require("nvim-treesitter.configs")
                config.setup({
                    ensure_installed = { "lua", "c", "cpp", "cmake", "rust", "asm", "python", "bash", "python" },
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end,
        },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = true,
        },

    },
    install = { colorscheme = { "solarized" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
