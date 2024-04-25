local ls = require("luasnip")
local p = ls.parser.parse_snippet
-- local c = ls.choice_node
-- local t = ls.text_node
-- local s = ls.snippet
-- local i = ls.insert_node
-- local f = ls.function_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local sn = ls.snippet_node

local M = { snips = {}, autosnips = {} }

-- helper function to get list of snippets
local getSnippetsList = function(tbl)
  local snipList = {}
  for _, v in pairs(tbl) do
    table.insert(snipList, v)
  end
  return snipList
end

-- snippets

M.snips.bb = p({
  trig = "bb",
  name = "Bold Text \\textbf{|}",
  dscr = "Surrounds with bold text",
}, "\\\\textbf{$TM_SELECTED_TEXT$1}")

M.snips.it = p({
  trig = "it",
  name = "Italized Text \\textit{|}",
  dscr = "Surrounds with italized text",
}, "\\\\textit{$TM_SELECTED_TEXT$1}")

M.snips.m = p({
  trig = "m",
  name = "Math $|$",
  dscr = "Surrounds with single math symbols",
}, "\\$$TM_SELECTED_TEXT$1\\$")

M.snips.M = p({
  trig = "M",
  name = "Math $$|$$",
  dscr = "Surrounds with double math symbols",
}, "\\$\\$$TM_SELECTED_TEXT$1\\$\\$")

-- autosnippets

M.autosnips.bb = p({
  trig = ";bb",
  name = "Bold Text \\textbf{|}",
  dscr = "Surrounds with bold text",
}, "\\\\textbf{$TM_SELECTED_TEXT$1}")

M.autosnips.it = p({
  trig = ";it",
  name = "Italized Text \\textit{|}",
  dscr = "Surrounds with italized text",
}, "\\\\textit{$TM_SELECTED_TEXT$1}")

M.autosnips.m = p({
  trig = ";m",
  name = "Math $|$",
  dscr = "Surrounds with single math symbols",
}, "\\$$TM_SELECTED_TEXT$1\\$")

M.autosnips.M = p({
  trig = ";M",
  name = "Math $$|$$",
  dscr = "Surrounds with double math symbols",
}, "\\$\\$$TM_SELECTED_TEXT$1\\$\\$")

return getSnippetsList(M.snips), getSnippetsList(M.autosnips)