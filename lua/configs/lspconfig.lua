-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
-- EXAMPLE
local servers = { "html", "cssls", "cmake", "zls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  servers = {
    -- Ensure mason installs the server
    clangd = {
      keys = {
        { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
          "lspconfig.util"
        ).find_git_ancestor(fname)
      end,
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    },
  },
  setup = {},
}

--
-- lspconfig.rust_analyzer.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--

-- vim.g.rustaceanvim = {
--   tools = {
--     autoSetHints = true,
--     inlay_hints = {
--
--       show_parameter_hints = true,
--       parameter_hints_prefix = "<-",
--       other_hints_prefix = "=>",
--     },
--   },
--   server = {
--     on_attch = function(client, bufnr)
--       nvlsp.on_attch(client)
--       local bufopts = {
--         noremap = true,
--         slient = true,
--         buffer = bufnr,
--       }
--       vim.keymap.set("n", "<leader><leader>rr", "<Cmd>RustLsp runnables<CR>", bufopts)
--     end,
--     settings = {
--       ["rust-analyzer"] = {
--         assist = {
--           importEnforceGranularity = true,
--           importPrefix = "create",
--         },
--         cargo = { allFeatures = true },
--       },
--     },
--   },
-- }
