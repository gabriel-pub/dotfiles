require("config.lazy")

require("autocommands")

vim.schedule(function()
  require("keymaps")
end)
