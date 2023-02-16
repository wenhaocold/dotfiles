local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else  -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local in_mathzone = function ()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  s({trig = '([^%a])ee', regTrig = true, wordTrig = false},
      fmta(
        "<>e^{<>}",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual)
        }
      )
  ),
  --[[ s("hi", t("hello")), ]]
  s({trig = '([^%a])ff', regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      [[<>\frac{<>}{<>}]],
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
      }
    ),
    {condition = in_mathzone}
  ),
},
-- autosnippet
{
  s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false},
    fmta(
    "<>_{<>}",
    {
        f( function(_, snip) return snip.captures[1] end ),
        t("0")
      }
    )
  ),
s({trig = "h1", dscr="Top-level section"},
  fmta(
    [[\section{<>}]],
    { i(1) }
  ),
  {condition = line_begin}  -- set condition in the `opts` table
),

s({trig="new", dscr="A generic new environmennt"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),
    }
  ),
  {condition = line_begin}
),}
