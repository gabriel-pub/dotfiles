-- i_C-x_C-o equivalent
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(
        true,
        client.id,
        args.buf,
        { autotrigger = true }
      )
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ledger" },
  command = "LedgerAlignBuffer",
})
