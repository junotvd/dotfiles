local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s({ trig = "ifi" }, { t("if and only if") }),
  s({ trig = "Ifi" }, { t("If and only if") }),
  s({ trig = "tm" }, { t("this means") }),
  s({ trig = "Tm" }, { t("This means") }),
  s({ trig = "bmo" }, { t("by means of") }),
  s({ trig = "Bmo" }, { t("By means of") }),
  s({ trig = "ifo" }, { t("in function of") }),
  s({ trig = "Ifo" }, { t("In function of") }),
  s({ trig = "iow" }, { t("in other words") }),
  s({ trig = "Iow" }, { t("In other words") }),
  s({ trig = "wrt" }, { t("with regard to") }),
  s({ trig = "Wrt" }, { t("With regard to") }),
  s({ trig = "nl" }, { t("namely") }),
  s({ trig = "Nl" }, { t("Namely") }),
  s({ trig = "resp" }, { t("respectively") }),
  s({ trig = "Resp" }, { t("Respectively") }),
}
