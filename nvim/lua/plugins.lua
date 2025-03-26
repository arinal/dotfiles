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

  "aznhe21/actions-preview.nvim",

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          multi_line = false,
        },
      },
    },
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  { "lambdalisue/vim-suda", cmd = "SudaWrite" },

  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-nvim-dap").setup {
        handlers = {},
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.dap"
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
        "haskell",
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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end)
    end,
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
            ["^github.twdcgrid.net"] = require("gitlinker.routers").github_browse,
          },
          blame = {
            ["^github.bamtech.co"] = require("gitlinker.routers").github_blame,
            ["^github.twdcgrid.net"] = require("gitlinker.routers").github_browse,
          },
        },
      }
    end,
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    config = true,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
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
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cmd = "ObsidianSearch",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        { name = "neuron", path = "~/Documents/neuron" },
      },
      templates = {
        folder = "3 - Resources/Templates",
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "md", "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      file_types = { "markdown", "Avante" },
      -- heading = {
      -- border_virtual = true,
      -- border = true,
      --},
    },
  },

  { "glacambre/firenvim", build = ":call firenvim#install(0)", lazy = false },

  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = require("configs.lspconfig").metals_opts,
    config = require("configs.lspconfig").metals_config,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = require "configs.avante",
    build = "make",
    dependencies = require("configs.avante").dependencies,
  },
}
