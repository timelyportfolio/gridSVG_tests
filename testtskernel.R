#documentation panel.tskernel

testList <- list()

testList[[1]] <- xyplot(sunspot.year, panel = panel.xyarea, origin = 0,
       aspect = "xy", cut = list(n = 3, overlap = 0))

## two series superposed: one filled, one as a line.
testList[[2]] <- xyplot(ts.union(data = sunspot.year, lag10 = lag(sunspot.year, 10)),
       aspect = "xy", cut = list(n = 3, overlap = 0),
       superpose = TRUE,
       panel = panel.superpose,
       panel.groups = function(..., group.number) {
         if (group.number == 1)
           panel.xyarea(...) else panel.xyplot(...)
       }, border = NA, 
       par.settings = simpleTheme(col = c("grey", "black"), lwd = c(5,2)))

## missing values are handled by splitting the series
tmp <- window(sunspot.year, start = 1900)
tmp[c(1:2, 50:60)] <- NA
testList[[3]] <- xyplot(tmp, panel = panel.xyarea, origin = 0)

set.seed(0)
testList[[4]] <- qqmath(~ data, make.groups(baseline = rnorm(100),
                           other = rnorm(100) * 2 - 0.5),
       groups = which, distribution = qunif,
       panel = panel.qqmath.xyarea, xlim = 0:1,
       auto.key = list(points = FALSE, rectangles = TRUE),
       par.settings = simpleTheme(col = c("blue", "green"),
                                  alpha = 0.5))

for(i in 1:length(testList)) {
  print(testList[[i]])
  grid.export(paste0("testtskernel",i,".svg"))
}