require(latticeExtra)
require(quantmod)

require(devtools)
setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg/pkg")
load_all()
setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg_tests")


japanReserves <- getSymbols(
  "TRESEGJPM052N",
  src = "FRED",
  auto.assign = FALSE
)

p1 <- xyplot(
  japanReserves,
  scales = list(y = list(rot = 1)),
  lattice.options = theEconomist.opts(),
  par.settings = theEconomist.theme(box="transparent"),
  main = "Japan Foreign Reserves excluding Gold"
)

p1

#update(p1,panel=panel.xyarea)

grid.export("d3testarea.svg", addClasses = TRUE)