-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
--
-- Some LaTeX-specific conditional expansion functions (requires VimTeX)

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env("tikzpicture")
end

-------------------------------------------------------------------------------
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

-------------------------------------------------------------------------------

-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.

-------------------------------------------------------------------------------
--
return {
  -- snippet to insert alpha beta gamma in math mode
  -- using autosnippet doesn't need to enter expand
  s({ trig = ";a", snippetType = "autosnippet" }, {

    t("\\alpha"),
  }),
  s({ trig = ";b", snippetType = "autosnippet" }, {
    t("\\beta"),
  }),
  s({ trig = ";g", snippetType = "autosnippet" }, {
    t("\\gamma"),
  }),

  s(
    { trig = "//", dscr = "Create a frac", snippetType = "autosnippet" },
    -- Example: using fmt's `delimiters` key to manually specify angle brackets
    fmt(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2),
      },
      { delimiters = "<>" } -- manually specifying angle bracket delimiters
    )
  ),

  s(
    { trig = "^sec", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    -- Using a multiline string for the equation snippet
    fmta(
      [[
     \section{<>}
     \label{sec:<>}

   ]],
      { i(1), rep(1) }
    )
  ),

  s(
    { trig = "^sub", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    -- Using a multiline string for the equation snippet
    fmta(
      [[
     \subsection{<>}
     \label{sub:<>}

   ]],
      { i(1), rep(1) }
    )
  ),

  s(
    { trig = "^ssub", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    -- Using a multiline string for the equation snippet
    fmta(
      [[
     \subsubsection{<>}
     \label{ssub:<>}

   ]],
      { i(1), rep(1) }
    )
  ),

  s(
    { trig = "^pr", wordTrig = false, regTrig = true },
    -- Using a multiline string for the equation snippet
    fmta(
      [[
      \pr{<>}

   ]],
      { i(1) }
    )
  ),

  s(
    { trig = "^sol", wordTrig = false, regTrig = true },
    -- Using a multiline string for the equation snippet
    fmta(
      [[
      \sol{<>}

   ]],
      { i(1) }
    )
  ),

  -- create \begin{} \end{} snippet
  s(
    { trig = "^beg", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),

  -- Example use of insert node placeholder text
  s(
    { trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
    fmta([[\href{<>}{<>}]], {
      i(1, "url"),
      i(2, "display name"),
    })
  ),

  -- Example: italic font implementing visual selection
  s(
    { trig = "ti", dscr = "Expands 'ti' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      -- dynamic_node: see :help luasnip-dynamicnode
      d(1, get_visual),
    })
  ),

  s(
    { trig = "tt", dscr = "Expands 'tt' into LaTeX's texttt{} command." },
    fmta("\\texttt{<>}", {
      -- dynamic_node: see :help luasnip-dynamicnode
      d(1, get_visual),
    })
  ),

  -- inline math block, but activates only if there are no characters directly connected to mm.
  s(
    { trig = "([^%a])mm", snippetType = "autosnippet", wordTrig = false, regTrig = true },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  s(
    { trig = "^pi", wordTrig = false, regTrig = true },
    -- Using a multiline string for the equation snippet
    fmta(
      [[
      pi@raspberrypi:~ $
      ]],
      {}
    )
  ),

  -- create subscripts
  -- s(
  --   { trig = "([%a%)%]%}])ss", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
  --   fmta("<>_{<>}", {
  --     f(function(_, snip)
  --       return snip.captures[1]
  --     end),
  --     i(1),
  --   })
  -- ),

  -- s(
  --   { trig = "([%a%)%]%}])ss", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
  --   fmta("<>_{<>}", {
  --     f(function(_, snip)
  --       return snip.captures[1]
  --     end),
  --     i(1),
  --   })
  -- ),
}
