require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "rust_analyzer",
  "clangd",
  "pyright",
  "hls",
  "gopls",
  "jdtls",
  "html",
  "cssls",
}

local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local M = {
  metals_opts = function()
    local metals = require "metals"
    local config = metals.bare_config()
    config.on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      metals.setup_dap()
    end
    config.on_init = nvlsp.on_init
    config.capabilities = nvlsp.capabilities
    return config
  end,

  metals_config = function(self, opts)
    local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        local metals = require "metals"
        metals.initialize_or_attach(opts)
      end,
      group = group,
    })
  end,
}

return M
