local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },
    java = { "google-java-format" },
    markdown = { "prettierd", "prettier" },
    html = { "prettierd" },
    bash = { "beautysh" },
    proto = { "buf" },
    rust = { "rustfmt" },
    yaml = { "yamlfix" },
    toml = { "taplo" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    sh = { "shellcheck" },
  },
}

return options
