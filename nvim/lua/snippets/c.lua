local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Сниппеты для C/C++
ls.add_snippets("c", {
  -- Функция
  s("func", fmt([[
    {} {}({}) {{
        {}
    }}
  ]], { i(1, "void"), i(2, "function_name"), i(3, ""), i(0, "// body") })),

  -- Главная функция
  s("main", fmt([[
    int main(int argc, char *argv[]) {{
        {}
        return 0;
    }}
  ]], { i(0, "// code") })),

  -- if/else
  s("if", fmt([[
    if ({}) {{
        {}
    }} else {{
        {}
    }}
  ]], { i(1, "condition"), i(2, "// body"), i(0, "") })),

  -- for-loop
  s("for", fmt([[
    for (int {} = 0; {} < {}; {}++) {{
        {}
    }}
  ]], { i(1, "i"), i(1), i(2, "N"), i(1), i(0, "// body") })),

  -- while-loop
  s("while", fmt([[
    while ({}) {{
        {}
    }}
  ]], { i(1, "condition"), i(0, "// body") })),
})

