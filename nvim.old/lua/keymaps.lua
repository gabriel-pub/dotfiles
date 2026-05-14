vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float)

vim.keymap.set(
  "i",
  "<C-y>",
  'pumvisible() ? "<C-y>" : "<Tab>"',
  { expr = true, noremap = true }
)
vim.keymap.set(
  "i",
  "<Tab>",
  'pumvisible() ? "<C-n>" : "<Tab>"',
  { expr = true, noremap = true }
)
vim.keymap.set(
  "i",
  "<S-Tab>",
  'pumvisible() ? "<C-p>" : "<S-Tab>"',
  { expr = true, noremap = true }
)
