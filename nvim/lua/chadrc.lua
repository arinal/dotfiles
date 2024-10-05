-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
}

M.ui = {
  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- theme = "minimal",

    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    -- separator_style = "round",

    order = nil,
    modules = nil,
  },
}

return M
