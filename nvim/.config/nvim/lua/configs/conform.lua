local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt", "goimports" },
    html = { "prettier" },
    python = { "isort", "black" },
    terraform = { "terraform_fmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
