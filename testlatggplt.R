#latticeExtra documentation of ggplot2like
#problem with 5


testList <- list()
## basic theme does not include white grid lines
testList[[1]] <- xyplot(exp(1:10) ~ 1:10, type = "b", 
       par.settings = ggplot2like())

## add lines for axis ticks with custom axis function
testList[[2]] <- xyplot(exp(1:10) ~ 1:10, type = "b", 
       par.settings = ggplot2like(), axis = axis.grid)

## this can be used together with scale.components
## (minor lines only visible on devices supporting translucency)
testList[[3]] <- xyplot(exp(rnorm(500)) ~ rnorm(500),
       scales = list(y = list(log = TRUE)),
       yscale.components = yscale.components.log10ticks,
       par.settings = ggplot2like(), axis = axis.grid)

## ggplotlike.opts() specifies axis = axis.grid as well as
## xscale.components.subticks / yscale.components.subticks

xyg <- make.groups(
  "group one" = rnorm(80, 1),
  "group two" = rnorm(80, 5),
  "group three" = rnorm(80, 2))
xyg$x <- rev(xyg$data)

## group styles: specify number of equi-spaced hues
testList[[4]] <- xyplot(data ~ x, xyg, groups = which, auto.key = TRUE, 
       par.settings = ggplot2like(n = 3),
       lattice.options = ggplot2like.opts()) +
  glayer(panel.smoother(...))

## or set it as the default:
opar <- trellis.par.get()
trellis.par.set(ggplot2like(n = 4, h.start = 180))
oopt <- lattice.options(ggplot2like.opts())

testList[[5]] <- bwplot(voice.part ~ height, data = singer)

testList[[6]] <-histogram(rnorm(100))

testList[[7]] <-barchart(Titanic[[,,,"No"]], main = "Titanic deaths",
         layout = c(1, 2), auto.key = list(columns = 2))

## reset
trellis.par.set(opar)
lattice.options(oopt)

## axis.grid and scale.components.subticks can be used alone:
## (again, lines for minor ticks need transculency-support to show up)
testList[[8]] <-xyplot(exp(1:10) ~ 1:10, type = "b", 
       lattice.options = ggplot2like.opts(),
       par.settings = list(axis.line = list(col = NA),
                           reference.line = list(col = "grey")),
       scales = list(tck = c(0,0)))

for(i in 1:length(testList)) {
  print(testList[[i]])
  grid.export(paste0("testlatggplt",i,".svg"))
}

