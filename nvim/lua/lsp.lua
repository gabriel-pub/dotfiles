local servers = {
  lua_ls = {
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
    -- using lua for neovim
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (
            vim.uv.fs_stat(path .. "/.luarc.json")
            or vim.uv.fs_stat(path .. "/.luarc.jsonc")
          )
        then
          return
        end
      end

      client.config.settings.Lua =
        vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using (most
            -- likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Tell the language server how to find Lua modules same way as Neovim
            -- (see `:h lua-module-load`)
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths
              -- here.
              -- '${3rd}/luv/library',
              -- '${3rd}/busted/library',
            },
            -- Or pull in all of 'runtimepath'.
            -- NOTE: this is a lot slower and will cause issues when working on
            -- your own configuration.
            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
            -- library = vim.api.nvim_get_runtime_file('', true),
          },
        })
    end,
  },

  ltex = {
    ltex = {
      language = "en-GB",

      enabled = {
        "bibtex",
        "gitcommit",
        "markdown",
        "org",
        "tex",
        "restructuredtext",
        "rsweave",
        "latex",
        "quarto",
        "rmd",
        "context",
        "html",
        "xhtml",
        "mail",
        "plaintext",
      },
    },
  },

  ts_ls = {
    root_markers = {
      "tsconfig.app.json",
      "tsconfig.json",
      "package.json",
      ".git",
    },
    init_options = {
      preferences = {
        -- Enable auto-import suggestions in completion menu
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,

        -- Force LSP to use @/* aliases instead of relative paths
        importModuleSpecifierPreference = "non-relative",

        -- Prevents adding unnecessary .js/.ts/.tsx extensions in the import path
        importModuleSpecifierEnding = "minimal",
      },
    },
  },

  gopls = {},

  ruff = {
    init_options = {
      settings = {
        configuration = vim.fn.getcwd() .. "/ruff.toml",
      },
    },
  },

  ty = {},
  clangd = {},
  tailwindcss = {},
  csskit = {},
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        completion = {
          autoimport = {
            enable = true,
          },
        },
      },
    },
  },
  bashls = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
  capabilities = capabilities,
})

for lsp, settings in pairs(servers) do
  vim.lsp.config(lsp, settings)
  vim.lsp.enable(lsp)
end
