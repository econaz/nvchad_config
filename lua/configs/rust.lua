local opts = function()
  vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
      autoSetHints = true,
      inlay_hints = {
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
      },
    },
    server = {
      on_attach = function(client, bufnr)
        require("nvchad.configs.lspconfig").on_attach(client, bufnr)

        vim.keymap.set("n", "<leader>rr", "<Cmd>RustLsp runnables<CR>", { desc = "eseses" })
        vim.keymap.set("n", "K", "<Cmd>RustLsp hover actions<CR>", { desc = "sesese" })
      end,
      settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          assist = {
            importEnforceGranularity = true,
            importPrefix = "create",
          },
          cargo = { allFeatures = true },
          checkOnSave = {
            -- default: `cargo check` but `clippy` can be used too.
            command = "cargo check",
            allFeatures = true,
          },
          inlayHints = {
            lifetimeElisionHints = {
              enable = true,
              useParameterNames = true,
            },
          },
        },
      },
    },
  }
end
return opts
