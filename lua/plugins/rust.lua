return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy

  init = function()
    -- require("core.utils").load_mappings "rustaceanvim"
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
          local bufopts = {
            noremap = true,
            silent = true,
            buffer = bufnr,
          }
          vim.keymap.set("n", "<leader>rd", "<Cmd>RustLsp debuggables<CR>", bufopts)
          vim.keymap.set("n", "<leader>rt", "<Cmd>RustLsp testables<CR>", bufopts)
          vim.keymap.set("n", "<leader>rr", "<Cmd>RustLsp runnables<CR>", bufopts)
          vim.keymap.set("n", "K", "<Cmd>RustLsp hover actions<CR>", bufopts)
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
  end,
}
