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
  main = "Japan Foreign Reserves excluding Gold"
)

p1


grid.export("d3testline.svg", addClasses = TRUE)