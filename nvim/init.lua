-- enable the experimental Lua module loader
vim.loader.enable()

-- disable nvim providers for legacy plugins
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- settings
local mode = os.getenv("THEME_MODE")
if mode == "dark" then
  vim.opt.background = "dark"
else
  vim.opt.background = "light"
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.autocomplete = true
vim.opt.pumborder = "rounded"
vim.opt.pummaxwidth = 40
vim.opt.confirm = true
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.mouse = ""

-- plugins
vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-mini/mini.icons", -- oil.nvim dependency
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/pimalaya/himalaya-vim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim", -- telescope.nvim dependency
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- telescope.nvim dependency
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons", -- lualine.nvim dependency
  "https://github.com/junegunn/goyo.vim",
  "https://github.com/junegunn/limelight.vim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/ledger/vim-ledger",
})

-- setup requiring plugins
require("mini.icons").setup()
require("oil").setup()
require("todo-comments").setup()
require("lualine").setup({
  options = { theme = "auto" },
})
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    json = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

-- lua modules
require("lsp")
require("keymaps")
require("autocommand")

-- colorscheme on
vim.cmd([[colorscheme gruvbox]])
