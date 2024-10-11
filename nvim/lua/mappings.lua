require "nvchad.mappings"

local nomap = vim.keymap.del
nomap("i", "<C-l>")
nomap("n", "<C-c>")
nomap("n", "<C-s>")
nomap("n", "<C-n>")
nomap("n", "<leader>fm")

local map = vim.keymap.set

map("i", "jk", "<esc>")
map("n", "<leader>h", "<cmd>NoiceDismiss<cr>:noh<cr>")
map("n", "<leader>s", "<cmd>update<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")
map("t", "<C-u>", "<C-\\><C-n>", { desc = "Terminal normal mode" })

-- stylua: ignore start
---- Telescope ------------------------------------------------------------------------------------------------------
local builtin = require "telescope.builtin"
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" })
map("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Find dynamic workspace symbols" })
map("n", "<leader>fe", "<cmd>Telescope diagnostics<cr>", { desc = "Find dynamic workspace symbols" })

---- Git -----------------------------------------------------------------------------------------------------------
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gC", builtin.git_commits, { desc = "Search git commits" })
map("n", "<leader>gc", builtin.git_bcommits, { desc = "Search git commits for buffer" })
map("n", "<leader>gB", builtin.git_branches, { desc = "Go to git branch" })

map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>    ", { desc = "Diff against the index" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>  ", { desc = "Git blame current line" })
map("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>   ", { desc = "Go to the previous hunk" })
map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>   ", { desc = "Go to the next hunk" })
map("n", "<leader>gv", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>  ", { desc = "Reset hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })
map("n", "<leader>gw", ":.!gh pr view --web &> /dev/null<cr>  ", { desc = "View github PR" })
map("n", "<leader>gW", ":.!gh repo view --web &> /dev/null<cr>", { desc = "View github repository" })

---- LSP ----------------------------------------------------------------------------------------------------------
map("n", "gI", "<cmd>:Telescope lsp_implementations<cr>",          { desc = "Go to implementations" })
map("n", "gR", "<cmd>:Telescope lsp_references<cr>",               { desc = "Go to references" })
map("i", "<C-h>", function() vim.lsp.buf.signature_help() end,     { desc = "LSP signature help" })
map("n", "<leader>le", function() vim.diagnostic.open_float() end, { desc = "Show detailed error" })
map("n", "<leader>lj", function() vim.diagnostic.goto_next()  end, { desc = "Next error" })
map("n", "<leader>lk", function() vim.diagnostic.goto_prev()  end, { desc = "Previous error" })
map("n", "<leader>la", function() require"actions-preview".code_actions() end, { desc = "LSP action" })
map("n", "<leader>lr", function() vim.lsp.buf.rename()                    end, { desc = "LSP rename" })
map("n", "<leader>lf", function() require("conform").format { lsp_fallback = true } end, { desc = "format files" })

---- Flash -------------------------------------------------------------------------------------------------------
local nxo = { "n", "x", "o" }
local xo  = { "x", "o" }
map(nxo, "s", function() require'flash'.jump()       end, { desc = "Flash" })
map(nxo, "S", function() require'flash'.treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require'flash'.remote()     end, { desc = "Remote Flash" })
map(xo,  "R", function() require'flash'.treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<c-s>", function() require'flash'.toggle()        end, { desc = "Toggle Flash Search" })

---- DAP --------------------------------------------------------------------------------------------------------
local function rdap() return require("dap") end
map("n", "<leader>dd", function() rdap().toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dc", function() rdap().continue()          end, { desc = "Continue" })
map("n", "<leader>dC", function() rdap().run_to_cursor()     end, { desc = "Run to cursor" })
map("n", "<leader>dj", function() rdap().step_over() end, { desc = "Step over" })
map("n", "<leader>dl", function() rdap().step_into() end, { desc = "Step into" })
map("n", "<leader>dk", function() rdap().step_back() end, { desc = "Step back" })
map("n", "<leader>dh", function() rdap().step_out()  end, { desc = "Step out" })
map("n", "<leader>dJ", function() rdap().down()      end, { desc = "Down the stack" })
map("n", "<leader>dK", function() rdap().up()        end, { desc = "Up the stack" })
map("n", "<leader>ds", function() rdap().session()   end, { desc = "Get session" })
map("n", "<leader>dp", function() rdap().pause.toggle() end, { desc = "Pause" })
map("n", "<leader>d;", function() rdap().repl.toggle()  end, { desc = "Repl" })
map("n", "<leader>dx", function() rdap().disconnect()   end, { desc = "Disconnect" })
map("n", "<leader>dq", function() rdap().close()        end, { desc = "Quit" })

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

---- Nvim Tree -------------------------------------------------------------------------------------------------
local function rtree() return require("nvim-tree.api").tree end
map("n", "<leader>e",            rtree().toggle,                          { desc = "Open file tree" })
map("n", "<leader>E", function() rtree().toggle { find_file = true } end, { desc = "Reveal current file on tree" })
