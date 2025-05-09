require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.smartindent = true
o.smartcase = true
o.swapfile = false
o.backup = false
o.undodir = os.getenv "HOME" .. "/.vim/undodir"
o.undofile = true
o.scrolloff = 8
o.shada = "!,'500,<50,@100,s10,h"

vim.g.firenvim_config = {
  localSettings = {
    [".*"] = { takeover = "never" },
  },
}

if vim.g.neovide then
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = -80
  vim.g.neovide_padding_left = 0

  vim.g.neovide_cursor_vfx_mode = "sonicboom"

  vim.g.neovide_scale_factor = 0.8
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.15)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.15)
  end)
end
