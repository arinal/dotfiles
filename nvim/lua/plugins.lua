return {

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
    config = function()
      local cmp = require "cmp"
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      {
        modes = {
          char = {
            multi_line = false,
          },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  { "lambdalisue/vim-suda", event = "VeryLazy" },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        local map = vim.keymap.set
        map("n", "l", api.node.open.edit, opts "Open")
        map("n", "h", api.node.navigate.parent_close, opts "Close Directory")
      end
      require("nvim-tree").setup {
        on_attach = on_attach,
        renderer = {
          group_empty = true,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
        "clangd",
        "pyright",
        "jdtls",
        "asm-lsp",
        "html-lsp",
        "css-lsp",
        -- formatter
        "google-java-format",
        "beautysh",
        "stylua",
        "shellcheck",
        "buf",
        "rustfmt",
        "prettierd",
        "taplo",
        "yamlfix",
        "htmlbeautifier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "scala",
        "java",
        "rust",
        "c",
        "go",
        "javascript",
        "typescript",
        "smithy",
        "json",
        "terraform",
        "markdown",
        "html",
        "css",
      },
    },
  },

  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = false,
        dim = true,
      }
    end,
  },

  { "github/copilot.vim", event = "VeryLazy" },

  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup()
    end,
  },

  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    config = function()
      require("gitlinker").setup {
        router = {
          browse = {
            ["^github.bamtech.co"] = require("gitlinker.routers").github_browse,
          },
          blame = {
            ["^github.bamtech.co"] = require("gitlinker.routers").github_blame,
          },
        },
      }
    end,
    keys = {
      { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },

  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {
      on_open = function(_)
        vim.opt.nu = false
        vim.opt.relativenumber = false
        require("noice").disable()
        vim.o.foldcolumn = "0"
        vim.o.foldenable = false
        vim.o.laststatus = 0
      end,
      on_close = function()
        vim.opt.nu = true
        vim.opt.relativenumber = true
        require("noice").enable()
        vim.o.foldcolumn = "1"
        vim.o.foldenable = true
        vim.o.laststatus = 2
      end,
    },
  },

  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local config = require("metals").bare_config()
      local lspconfig = require "nvchad.configs.lspconfig"
      config.on_attach = lspconfig.on_attach
      config.on_init = lspconfig.on_init
      config.capabilities = lspconfig.caps
      return config
    end,
    config = function(self, config)
      local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(config)
        end,
        group = group,
      })
    end,
  },
}
