-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local highlights = {}

-- @type HLTable
highlights.override = {
  -- CursorLine = {
  --   bg = "black2",
  -- },
  -- Comment = {
  --   italic = true,
  -- },
}

---@type HLTable
highlights.add = {
  -- NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return highlights
