-- nvim 0.12 popup
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

-- lsp diagnostic
vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float)

-- vim.snippet jumps
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if vim.snippet.active({ direction = 1 }) then
    vim.snippet.jump(1)
  end
end, { expr = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if vim.snippet.active({ direction = -1 }) then
    vim.snippet.jump(-1)
  end
end, { expr = true })
