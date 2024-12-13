-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
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
