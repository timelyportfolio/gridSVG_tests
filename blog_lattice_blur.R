require(gridSVG)

trellis.par.set(superpose.symbol=list(pch=21, fill=rgb(1,1,1,.5)),
                background=list(col="grey90"),
                panel.background=list(col="grey90"))
xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
       data = iris, scales = "free", layout = c(2, 2),
       auto.key = list(x = .55, y = .7, corner = c(0, 0)))
blur <- filterEffect(feGaussianBlur(sd=2))
registerFilter("point-blur", blur)
grid.draw(filterGrob(textGrob(""), label="point-blur"))
legendSymbols <- grid.get("key.points", grep=TRUE, global=TRUE)
for (i in legendSymbols) {
  name <- i$name
  grid.garnish(name, 
               onclick=paste("highlight(", 
                             substr(name, nchar(name), nchar(name)),
                             ")", sep=""))
}
grid.script(file="highlight-blur.js")

grid.export("")$svg