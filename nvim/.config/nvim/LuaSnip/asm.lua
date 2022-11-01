local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
--[[ local isn = ls.indent_snippet_node ]]
local t = ls.text_node
local i = ls.insert_node
--[[ local f = ls.function_node ]]
--[[ local c = ls.choice_node ]]
--[[ local d = ls.dynamic_node ]]
--[[ local r = ls.restore_node ]]
--[[ local events = require("luasnip.util.events") ]]
--[[ local ai = require("luasnip.nodes.absolute_indexer") ]]
--[[ local fmt = require("luasnip.extras.fmt").fmt ]]
local fmta = require("luasnip.extras.fmt").fmta
--[[ local extras = require("luasnip.extras") ]]
--[[ local m = extras.m ]]
--[[ local l = extras.l ]]
--[[ local rep = extras.rep ]]
--[[ local postfix = require("luasnip.extras.postfix").postfix ]]

--[[ local get_visual = function(args, parent) ]]
--[[   if (#parent.snippet.env.SELECT_RAW > 0) then ]]
--[[     return sn(nil, i(1, parent.snippet.env.SELECT_RAW)) ]]
--[[   else  -- If SELECT_RAW is empty, return a blank insert node ]]
--[[     return sn(nil, i(1)) ]]
--[[   end ]]
--[[ end ]]

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
},
-- autosnippet
{
  -- short trigger for percent sign
  s({trig = "jj"},
    t('%')
  ),

  -- general operation from register to register
  s({trig = "rr"},
    fmta(
      [[
        <> %<>, %<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    {condition = line_begin}
  ),

  -- general operation from immediate to register
  s({trig = "ir"},
    fmta(
      [[
        <> $<>, %<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    {condition = line_begin}
  ),

  -- general operation from memory to register
  s({trig = "ar"},
    fmta(
      [[
        <> <>, %<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    {condition = line_begin}
  ),

  -- general operation from register to memory
  s({trig = "ra"},
    fmta(
      [[
        <> %<>, <>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    {condition = line_begin}
  ),

  -- general operation from immediate to memory
  s({trig = "ia"},
    fmta(
      [[
        <> $<>, <>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    {condition = line_begin}
  ),

  s({trig = "mrr"},
    fmta(
      [[
        mov<> %<>, %<>
      ]],
      {
        i(1),
        i(2),
        i(0),
      }
    ),
    {condition = line_begin}
  ),
  s({trig = "mra"},
    fmta(
      [[
        mov<> %<>, <>
      ]],
      {
      i(1),
      i(2),
      i(0),
    }
    ),
    {condition = line_begin}
  ),
  s({trig = "mar"},
    fmta(
      [[
        mov<> <>, %<>
      ]],
      {
      i(1),
      i(2),
      i(0),
    }
    ),
    {condition = line_begin}
  ),
  s({trig = "mir"},
    fmta(
      [[
        mov<> $<>, %<>
      ]],
      {
      i(1),
      i(2),
      i(0),
    }
    ),
    {condition = line_begin}
  ),
  s({trig = "air"},
    fmta(
      [[
        add<> $<>, %<>
      ]],
      {
      i(1),
      i(2),
      i(0),
    }
    ),
    {condition = line_begin}
  )

}

