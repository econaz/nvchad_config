return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "vim", "rust" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
  "nvim-treesitter/nvim-treesitter-context",
  lazy = false,
}
