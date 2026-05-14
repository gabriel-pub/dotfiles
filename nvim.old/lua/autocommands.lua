vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.ledger",
  callback = function()
    vim.cmd("LedgerAlignBuffer")
  end,
})
