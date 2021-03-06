# gridSVG + open_notebook()

The [blog posts about `gridSVG`](http://stattech.wordpress.fos.auckland.ac.nz/) offer some very fine examples.  I thought combining these with `rCharts` and `slidify` would provide a powerful combination.  Here are some quick experiments adding another layer of interactivity with `open_notebook()`.

## Example 1 - Filters in Statistical Graphics


```r
require(latticeExtra)
```

```
## Loading required package: latticeExtra Loading required package:
## RColorBrewer Loading required package: lattice
```

```r
require(gridSVG)
```

```
## Loading required package: gridSVG Loading required package: grid Loading
## required package: RJSONIO Loading required package: XML
## 
## Attaching package: 'gridSVG'
## 
## The following object is masked from 'package:grDevices':
## 
## dev.off
```

```r

# just for fun use one of the themes from latticeExtra
tp <- trellis.par.get()
trellis.par.set(theEconomist.theme())
xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species, data = iris, 
    scales = "free", layout = c(2, 2), auto.key = list(x = 0.55, y = 0.7, corner = c(0, 
        0)))
blur <- filterEffect(feGaussianBlur(sd = 2))
registerFilter("point-blur", blur)
grid.draw(filterGrob(textGrob(""), label = "point-blur"))
legendSymbols <- grid.get("key.points", grep = TRUE, global = TRUE)
for (i in legendSymbols) {
    name <- i$name
    grid.garnish(name, onclick = paste("highlight(", substr(name, nchar(name), 
        nchar(name)), ")", sep = ""))
}

grid.export("")$svg
```

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="504px" height="504px" viewBox="0 0 504 504" version="1.1">
  <metadata xmlns:gridsvg="http://www.stat.auckland.ac.nz/~paul/R/gridSVG/">
    <gridsvg:generator name="gridSVG" version="1.3-0" time="2013-08-05 09:49:56"/>
    <gridsvg:argument name="name" value=""/>
    <gridsvg:argument name="exportCoords" value="none"/>
    <gridsvg:argument name="exportMappings" value="none"/>
    <gridsvg:argument name="exportJS" value="none"/>
    <gridsvg:argument name="res" value="72"/>
    <gridsvg:argument name="prefix" value=""/>
    <gridsvg:argument name="addClasses" value="FALSE"/>
    <gridsvg:argument name="indent" value="TRUE"/>
    <gridsvg:argument name="htmlWrapper" value="FALSE"/>
    <gridsvg:argument name="usePaths" value="vpPaths"/>
    <gridsvg:argument name="uniqueNames" value="TRUE"/>
    <gridsvg:separator name="id.sep" value="."/>
    <gridsvg:separator name="gPath.sep" value="::"/>
    <gridsvg:separator name="vpPath.sep" value="::"/>
  </metadata>
  <g transform="translate(0, 504) scale(1, -1)">
    <g id="gridSVG" fill="none" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" font-size="12" font-family="Helvetica, Arial, FreeSans, Liberation Sans, Nimbus Sans L, sans-serif" opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-opacity="1" fill-opacity="0" font-weight="normal" font-style="normal">
      <defs>
        <symbol id="gridSVG.pch16" viewBox="-5 -5 10 10" overflow="visible">
          <circle cx="0" cy="0" r="3.75"/>
        </symbol>
        <filter id="point-blur.1" x="0" y="0" width="504" height="504" filterUnits="userSpaceOnUse" primitiveUnits="userSpaceOnUse">
          <feGaussianBlur x="0" y="0" width="504" height="504" stdDeviation="2"/>
        </filter>
      </defs>
      <g id="plot_01.background.1">
        <rect id="plot_01.background.1.1" x="0" y="0" width="504" height="504" fill="none" stroke="none" stroke-opacity="0" fill-opacity="0"/>
      </g>
      <g id="plot_01.toplevel.vp.1" font-size="12">
        <g id="plot_01.toplevel.vp::plot_01.xlab.vp.1">
          <g id="plot_01.xlab.1">
            <g id="plot_01.xlab.1.1" transform="translate(268.4, 16.31)" stroke-width="0.1">
              <g id="plot_01.xlab.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.xlab.1.1.text" text-anchor="middle" opacity="1" stroke="rgb(0,0,0)" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.xlab.1.1.tspan.1" dy="4.31" x="0">Petal.Length + Petal.Width</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.ylab.vp.1">
          <g id="plot_01.ylab.1">
            <g id="plot_01.ylab.1.1" transform="translate(10.31, 261.2)" stroke-width="0.1">
              <g id="plot_01.ylab.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ylab.1.1.text" transform="rotate(-90)" text-anchor="middle" opacity="1" stroke="rgb(0,0,0)" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ylab.1.1.tspan.1" dy="4.31" x="0">Sepal.Length + Sepal.Width</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.figure.vp.1"/>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.1.clipPath">
            <rect x="44.8" y="50.8" width="211.5" height="191.1" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.1" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.1.vp.1.clipPath)"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.1.1.off.vp.1"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.left.1.1.off.vp.1">
          <g id="plot_01.ticks.left.panel.1.1.1">
            <polyline id="plot_01.ticks.left.panel.1.1.1.1" points="44.8,96.07 39.13,96.07" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.1.1.2" points="44.8,143.96 39.13,143.96" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.1.1.3" points="44.8,191.86 39.13,191.86" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.1.1.4" points="44.8,239.75 39.13,239.75" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.left.panel.1.1.1">
            <g id="plot_01.ticklabels.left.panel.1.1.1.1" transform="translate(33.47, 96.07)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.1.1.1.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.1.1.1.tspan.1" dy="0" x="0">3</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.1.1.2" transform="translate(33.47, 143.96)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.1.1.2.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.1.1.2.tspan.1" dy="0" x="0">4</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.1.1.3" transform="translate(33.47, 191.86)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.1.1.3.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.1.1.3.tspan.1" dy="0" x="0">5</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.off.vp.1">
          <g id="plot_01.ticks.bottom.panel.1.1.1">
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.1" points="47.48,50.8 47.48,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.2" points="99.02,50.8 99.02,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.3" points="150.56,50.8 150.56,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.4" points="202.09,50.8 202.09,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.5" points="253.63,50.8 253.63,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.bottom.panel.1.1.1">
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.1" transform="translate(99.02, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.1.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.1.tspan.1" dy="7.18" x="0">0.5</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.2" transform="translate(150.56, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.2.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.2.tspan.1" dy="7.18" x="0">1.0</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.3" transform="translate(202.09, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.3.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.3.tspan.1" dy="7.18" x="0">1.5</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.2.clipPath">
            <rect x="44.8" y="50.8" width="211.5" height="191.1" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.2" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.1.vp.2.clipPath)">
          <g id="plot_01.xyplot.points.group.1.panel.1.1.1">
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.1" xlink:href="#gridSVG.pch16" x="191.78" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.2" xlink:href="#gridSVG.pch16" x="191.78" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.3" xlink:href="#gridSVG.pch16" x="181.48" y="177.49" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.4" xlink:href="#gridSVG.pch16" x="202.09" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.5" xlink:href="#gridSVG.pch16" x="191.78" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.6" xlink:href="#gridSVG.pch16" x="222.71" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.7" xlink:href="#gridSVG.pch16" x="191.78" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.8" xlink:href="#gridSVG.pch16" x="202.09" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.9" xlink:href="#gridSVG.pch16" x="191.78" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.10" xlink:href="#gridSVG.pch16" x="202.09" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.11" xlink:href="#gridSVG.pch16" x="202.09" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.12" xlink:href="#gridSVG.pch16" x="212.4" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.13" xlink:href="#gridSVG.pch16" x="191.78" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.14" xlink:href="#gridSVG.pch16" x="160.86" y="158.33" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.15" xlink:href="#gridSVG.pch16" x="171.17" y="230.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.16" xlink:href="#gridSVG.pch16" x="202.09" y="225.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.17" xlink:href="#gridSVG.pch16" x="181.48" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.18" xlink:href="#gridSVG.pch16" x="191.78" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.19" xlink:href="#gridSVG.pch16" x="222.71" y="225.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.20" xlink:href="#gridSVG.pch16" x="202.09" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.21" xlink:href="#gridSVG.pch16" x="222.71" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.22" xlink:href="#gridSVG.pch16" x="202.09" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.23" xlink:href="#gridSVG.pch16" x="150.56" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.24" xlink:href="#gridSVG.pch16" x="222.71" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.25" xlink:href="#gridSVG.pch16" x="243.32" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.26" xlink:href="#gridSVG.pch16" x="212.4" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.27" xlink:href="#gridSVG.pch16" x="212.4" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.28" xlink:href="#gridSVG.pch16" x="202.09" y="201.44" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.29" xlink:href="#gridSVG.pch16" x="191.78" y="201.44" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.30" xlink:href="#gridSVG.pch16" x="212.4" y="177.49" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.31" xlink:href="#gridSVG.pch16" x="212.4" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.32" xlink:href="#gridSVG.pch16" x="202.09" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.33" xlink:href="#gridSVG.pch16" x="202.09" y="201.44" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.34" xlink:href="#gridSVG.pch16" x="191.78" y="215.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.35" xlink:href="#gridSVG.pch16" x="202.09" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.36" xlink:href="#gridSVG.pch16" x="171.17" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.37" xlink:href="#gridSVG.pch16" x="181.48" y="215.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.38" xlink:href="#gridSVG.pch16" x="191.78" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.39" xlink:href="#gridSVG.pch16" x="181.48" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.40" xlink:href="#gridSVG.pch16" x="202.09" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.41" xlink:href="#gridSVG.pch16" x="181.48" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.42" xlink:href="#gridSVG.pch16" x="181.48" y="167.91" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.43" xlink:href="#gridSVG.pch16" x="181.48" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.44" xlink:href="#gridSVG.pch16" x="212.4" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.45" xlink:href="#gridSVG.pch16" x="243.32" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.46" xlink:href="#gridSVG.pch16" x="191.78" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.47" xlink:href="#gridSVG.pch16" x="212.4" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.48" xlink:href="#gridSVG.pch16" x="191.78" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.49" xlink:href="#gridSVG.pch16" x="202.09" y="206.23" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.1.1.50" xlink:href="#gridSVG.pch16" x="191.78" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.2.panel.1.1.1">
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.1" xlink:href="#gridSVG.pch16" x="68.1" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.2" xlink:href="#gridSVG.pch16" x="68.1" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.3" xlink:href="#gridSVG.pch16" x="68.1" y="177.49" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.4" xlink:href="#gridSVG.pch16" x="68.1" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.5" xlink:href="#gridSVG.pch16" x="68.1" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.6" xlink:href="#gridSVG.pch16" x="88.71" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.7" xlink:href="#gridSVG.pch16" x="78.41" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.8" xlink:href="#gridSVG.pch16" x="68.1" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.9" xlink:href="#gridSVG.pch16" x="68.1" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.10" xlink:href="#gridSVG.pch16" x="57.79" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.11" xlink:href="#gridSVG.pch16" x="68.1" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.12" xlink:href="#gridSVG.pch16" x="68.1" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.13" xlink:href="#gridSVG.pch16" x="57.79" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.14" xlink:href="#gridSVG.pch16" x="57.79" y="158.33" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.15" xlink:href="#gridSVG.pch16" x="68.1" y="230.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.16" xlink:href="#gridSVG.pch16" x="88.71" y="225.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.17" xlink:href="#gridSVG.pch16" x="88.71" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.18" xlink:href="#gridSVG.pch16" x="78.41" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.19" xlink:href="#gridSVG.pch16" x="78.41" y="225.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.20" xlink:href="#gridSVG.pch16" x="78.41" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.21" xlink:href="#gridSVG.pch16" x="68.1" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.22" xlink:href="#gridSVG.pch16" x="88.71" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.23" xlink:href="#gridSVG.pch16" x="68.1" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.24" xlink:href="#gridSVG.pch16" x="99.02" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.25" xlink:href="#gridSVG.pch16" x="68.1" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.26" xlink:href="#gridSVG.pch16" x="68.1" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.27" xlink:href="#gridSVG.pch16" x="88.71" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.28" xlink:href="#gridSVG.pch16" x="68.1" y="201.44" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.29" xlink:href="#gridSVG.pch16" x="68.1" y="201.44" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.30" xlink:href="#gridSVG.pch16" x="68.1" y="177.49" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.31" xlink:href="#gridSVG.pch16" x="68.1" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.32" xlink:href="#gridSVG.pch16" x="88.71" y="211.02" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.33" xlink:href="#gridSVG.pch16" x="57.79" y="201.44" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.34" xlink:href="#gridSVG.pch16" x="68.1" y="215.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.35" xlink:href="#gridSVG.pch16" x="68.1" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.36" xlink:href="#gridSVG.pch16" x="68.1" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.37" xlink:href="#gridSVG.pch16" x="68.1" y="215.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.38" xlink:href="#gridSVG.pch16" x="57.79" y="187.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.39" xlink:href="#gridSVG.pch16" x="68.1" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.40" xlink:href="#gridSVG.pch16" x="68.1" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.41" xlink:href="#gridSVG.pch16" x="78.41" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.42" xlink:href="#gridSVG.pch16" x="78.41" y="167.91" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.43" xlink:href="#gridSVG.pch16" x="68.1" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.44" xlink:href="#gridSVG.pch16" x="109.33" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.45" xlink:href="#gridSVG.pch16" x="88.71" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.46" xlink:href="#gridSVG.pch16" x="78.41" y="182.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.47" xlink:href="#gridSVG.pch16" x="68.1" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.48" xlink:href="#gridSVG.pch16" x="68.1" y="172.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.49" xlink:href="#gridSVG.pch16" x="68.1" y="206.23" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.1.1.50" xlink:href="#gridSVG.pch16" x="68.1" y="191.86" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.3.panel.1.1.1">
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.1" xlink:href="#gridSVG.pch16" x="191.78" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.2" xlink:href="#gridSVG.pch16" x="191.78" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.3" xlink:href="#gridSVG.pch16" x="181.48" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.4" xlink:href="#gridSVG.pch16" x="202.09" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.5" xlink:href="#gridSVG.pch16" x="191.78" y="124.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.6" xlink:href="#gridSVG.pch16" x="222.71" y="139.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.7" xlink:href="#gridSVG.pch16" x="191.78" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.8" xlink:href="#gridSVG.pch16" x="202.09" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.9" xlink:href="#gridSVG.pch16" x="191.78" y="91.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.10" xlink:href="#gridSVG.pch16" x="202.09" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.11" xlink:href="#gridSVG.pch16" x="202.09" y="129.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.12" xlink:href="#gridSVG.pch16" x="212.4" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.13" xlink:href="#gridSVG.pch16" x="191.78" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.14" xlink:href="#gridSVG.pch16" x="160.86" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.15" xlink:href="#gridSVG.pch16" x="171.17" y="143.96" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.16" xlink:href="#gridSVG.pch16" x="202.09" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.17" xlink:href="#gridSVG.pch16" x="181.48" y="139.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.18" xlink:href="#gridSVG.pch16" x="191.78" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.19" xlink:href="#gridSVG.pch16" x="222.71" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.20" xlink:href="#gridSVG.pch16" x="202.09" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.21" xlink:href="#gridSVG.pch16" x="222.71" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.22" xlink:href="#gridSVG.pch16" x="202.09" y="129.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.23" xlink:href="#gridSVG.pch16" x="150.56" y="124.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.24" xlink:href="#gridSVG.pch16" x="222.71" y="110.43" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.25" xlink:href="#gridSVG.pch16" x="243.32" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.26" xlink:href="#gridSVG.pch16" x="212.4" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.27" xlink:href="#gridSVG.pch16" x="212.4" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.28" xlink:href="#gridSVG.pch16" x="202.09" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.29" xlink:href="#gridSVG.pch16" x="191.78" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.30" xlink:href="#gridSVG.pch16" x="212.4" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.31" xlink:href="#gridSVG.pch16" x="212.4" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.32" xlink:href="#gridSVG.pch16" x="202.09" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.33" xlink:href="#gridSVG.pch16" x="202.09" y="148.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.34" xlink:href="#gridSVG.pch16" x="191.78" y="153.54" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.35" xlink:href="#gridSVG.pch16" x="202.09" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.36" xlink:href="#gridSVG.pch16" x="171.17" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.37" xlink:href="#gridSVG.pch16" x="181.48" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.38" xlink:href="#gridSVG.pch16" x="191.78" y="124.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.39" xlink:href="#gridSVG.pch16" x="181.48" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.40" xlink:href="#gridSVG.pch16" x="202.09" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.41" xlink:href="#gridSVG.pch16" x="181.48" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.42" xlink:href="#gridSVG.pch16" x="181.48" y="62.54" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.43" xlink:href="#gridSVG.pch16" x="181.48" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.44" xlink:href="#gridSVG.pch16" x="212.4" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.45" xlink:href="#gridSVG.pch16" x="243.32" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.46" xlink:href="#gridSVG.pch16" x="191.78" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.47" xlink:href="#gridSVG.pch16" x="212.4" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.48" xlink:href="#gridSVG.pch16" x="191.78" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.49" xlink:href="#gridSVG.pch16" x="202.09" y="129.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.1.1.50" xlink:href="#gridSVG.pch16" x="191.78" y="110.43" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.4.panel.1.1.1">
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.1" xlink:href="#gridSVG.pch16" x="68.1" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.2" xlink:href="#gridSVG.pch16" x="68.1" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.3" xlink:href="#gridSVG.pch16" x="68.1" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.4" xlink:href="#gridSVG.pch16" x="68.1" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.5" xlink:href="#gridSVG.pch16" x="68.1" y="124.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.6" xlink:href="#gridSVG.pch16" x="88.71" y="139.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.7" xlink:href="#gridSVG.pch16" x="78.41" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.8" xlink:href="#gridSVG.pch16" x="68.1" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.9" xlink:href="#gridSVG.pch16" x="68.1" y="91.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.10" xlink:href="#gridSVG.pch16" x="57.79" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.11" xlink:href="#gridSVG.pch16" x="68.1" y="129.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.12" xlink:href="#gridSVG.pch16" x="68.1" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.13" xlink:href="#gridSVG.pch16" x="57.79" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.14" xlink:href="#gridSVG.pch16" x="57.79" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.15" xlink:href="#gridSVG.pch16" x="68.1" y="143.96" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.16" xlink:href="#gridSVG.pch16" x="88.71" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.17" xlink:href="#gridSVG.pch16" x="88.71" y="139.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.18" xlink:href="#gridSVG.pch16" x="78.41" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.19" xlink:href="#gridSVG.pch16" x="78.41" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.20" xlink:href="#gridSVG.pch16" x="78.41" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.21" xlink:href="#gridSVG.pch16" x="68.1" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.22" xlink:href="#gridSVG.pch16" x="88.71" y="129.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.23" xlink:href="#gridSVG.pch16" x="68.1" y="124.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.24" xlink:href="#gridSVG.pch16" x="99.02" y="110.43" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.25" xlink:href="#gridSVG.pch16" x="68.1" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.26" xlink:href="#gridSVG.pch16" x="68.1" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.27" xlink:href="#gridSVG.pch16" x="88.71" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.28" xlink:href="#gridSVG.pch16" x="68.1" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.29" xlink:href="#gridSVG.pch16" x="68.1" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.30" xlink:href="#gridSVG.pch16" x="68.1" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.31" xlink:href="#gridSVG.pch16" x="68.1" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.32" xlink:href="#gridSVG.pch16" x="88.71" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.33" xlink:href="#gridSVG.pch16" x="57.79" y="148.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.34" xlink:href="#gridSVG.pch16" x="68.1" y="153.54" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.35" xlink:href="#gridSVG.pch16" x="68.1" y="100.85" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.36" xlink:href="#gridSVG.pch16" x="68.1" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.37" xlink:href="#gridSVG.pch16" x="68.1" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.38" xlink:href="#gridSVG.pch16" x="57.79" y="124.8" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.39" xlink:href="#gridSVG.pch16" x="68.1" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.40" xlink:href="#gridSVG.pch16" x="68.1" y="115.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.41" xlink:href="#gridSVG.pch16" x="78.41" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.42" xlink:href="#gridSVG.pch16" x="78.41" y="62.54" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.43" xlink:href="#gridSVG.pch16" x="68.1" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.44" xlink:href="#gridSVG.pch16" x="109.33" y="120.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.45" xlink:href="#gridSVG.pch16" x="88.71" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.46" xlink:href="#gridSVG.pch16" x="78.41" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.47" xlink:href="#gridSVG.pch16" x="68.1" y="134.38" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.48" xlink:href="#gridSVG.pch16" x="68.1" y="105.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.49" xlink:href="#gridSVG.pch16" x="68.1" y="129.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.1.1.50" xlink:href="#gridSVG.pch16" x="68.1" y="110.43" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.off.vp.2">
          <g id="plot_01.border.panel.1.1.1">
            <rect id="plot_01.border.panel.1.1.1.1" x="44.8" y="50.8" width="211.5" height="191.1" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="1" fill-opacity="0"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.strip.1.1.vp.1">
          <defs>
            <clipPath id="plot_01.toplevel.vp::plot_01.strip.1.1.vp::plot_01.strip.default.1.1.clipPath">
              <rect x="44.8" y="241.91" width="211.5" height="14.4" fill="none" stroke="none"/>
            </clipPath>
          </defs>
          <g id="plot_01.toplevel.vp::plot_01.strip.1.1.vp::plot_01.strip.default.1.1" clip-path="url(#plot_01.toplevel.vp::plot_01.strip.1.1.vp::plot_01.strip.default.1.1.clipPath)">
            <g id="plot_01.bg.strip.1.1.1">
              <rect id="plot_01.bg.strip.1.1.1.1" x="44.8" y="241.91" width="211.5" height="14.4" fill="rgb(203,221,230)" stroke="rgb(203,221,230)" stroke-opacity="1" fill-opacity="1"/>
            </g>
            <g id="plot_01.textr.strip.1.1.1">
              <g id="plot_01.textr.strip.1.1.1.1" transform="translate(132.88, 249.11)" stroke-width="0.1">
                <g id="plot_01.textr.strip.1.1.1.1.scale" transform="scale(1, -1)">
                  <text x="0" y="0" id="plot_01.textr.strip.1.1.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                    <tspan id="plot_01.textr.strip.1.1.1.1.tspan.1" dy="4.31" x="0">setosa</tspan>
                  </text>
                </g>
              </g>
            </g>
          </g>
          <g id="plot_01.toplevel.vp::plot_01.strip.1.1.vp::plot_01.strip.default.off.1.1">
            <g id="plot_01.border.strip.1.1.1">
              <rect id="plot_01.border.strip.1.1.1.1" x="44.8" y="241.91" width="211.5" height="14.4" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="1" fill-opacity="0"/>
            </g>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.2.1.vp.1.clipPath">
            <rect x="280.5" y="50.8" width="211.5" height="191.1" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.2.1.vp.1" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.2.1.vp.1.clipPath)"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.2.1.off.vp.1"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.left.2.1.off.vp.1">
          <g id="plot_01.ticks.left.panel.2.1.1">
            <polyline id="plot_01.ticks.left.panel.2.1.1.1" points="280.5,62.54 274.83,62.54" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.2.1.1.2" points="280.5,96.07 274.83,96.07" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.2.1.1.3" points="280.5,129.59 274.83,129.59" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.2.1.1.4" points="280.5,163.12 274.83,163.12" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.2.1.1.5" points="280.5,196.65 274.83,196.65" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.2.1.1.6" points="280.5,230.17 274.83,230.17" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.left.panel.2.1.1">
            <g id="plot_01.ticklabels.left.panel.2.1.1.1" transform="translate(269.16, 62.54)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.2.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.2.1.1.1.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.2.1.1.1.tspan.1" dy="0" x="0">2</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.2.1.1.2" transform="translate(269.16, 96.07)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.2.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.2.1.1.2.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.2.1.1.2.tspan.1" dy="0" x="0">3</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.2.1.1.3" transform="translate(269.16, 129.59)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.2.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.2.1.1.3.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.2.1.1.3.tspan.1" dy="0" x="0">4</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.2.1.1.4" transform="translate(269.16, 163.12)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.2.1.1.4.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.2.1.1.4.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.2.1.1.4.tspan.1" dy="0" x="0">5</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.2.1.1.5" transform="translate(269.16, 196.65)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.2.1.1.5.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.2.1.1.5.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.2.1.1.5.tspan.1" dy="0" x="0">6</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.2.1.1.6" transform="translate(269.16, 230.17)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.2.1.1.6.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.2.1.1.6.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.2.1.1.6.tspan.1" dy="0" x="0">7</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.2.1.off.vp.1">
          <g id="plot_01.ticks.bottom.panel.2.1.1">
            <polyline id="plot_01.ticks.bottom.panel.2.1.1.1" points="293.48,50.8 293.48,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.2.1.1.2" points="338.73,50.8 338.73,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.2.1.1.3" points="383.99,50.8 383.99,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.2.1.1.4" points="429.24,50.8 429.24,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.2.1.1.5" points="474.49,50.8 474.49,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.bottom.panel.2.1.1">
            <g id="plot_01.ticklabels.bottom.panel.2.1.1.1" transform="translate(293.48, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.2.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.2.1.1.1.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.2.1.1.1.tspan.1" dy="7.18" x="0">1</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.2.1.1.2" transform="translate(338.73, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.2.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.2.1.1.2.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.2.1.1.2.tspan.1" dy="7.18" x="0">2</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.2.1.1.3" transform="translate(383.99, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.2.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.2.1.1.3.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.2.1.1.3.tspan.1" dy="7.18" x="0">3</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.2.1.1.4" transform="translate(429.24, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.2.1.1.4.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.2.1.1.4.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.2.1.1.4.tspan.1" dy="7.18" x="0">4</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.2.1.1.5" transform="translate(474.49, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.2.1.1.5.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.2.1.1.5.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.2.1.1.5.tspan.1" dy="7.18" x="0">5</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.2.1.vp.2.clipPath">
            <rect x="280.5" y="50.8" width="211.5" height="191.1" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.2.1.vp.2" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.2.1.vp.2.clipPath)">
          <g id="plot_01.xyplot.points.group.1.panel.2.1.1">
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.1" xlink:href="#gridSVG.pch16" x="460.91" y="230.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.2" xlink:href="#gridSVG.pch16" x="451.86" y="210.06" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.3" xlink:href="#gridSVG.pch16" x="469.96" y="226.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.4" xlink:href="#gridSVG.pch16" x="429.24" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.5" xlink:href="#gridSVG.pch16" x="456.39" y="213.41" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.6" xlink:href="#gridSVG.pch16" x="451.86" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.7" xlink:href="#gridSVG.pch16" x="460.91" y="206.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.8" xlink:href="#gridSVG.pch16" x="397.56" y="159.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.9" xlink:href="#gridSVG.pch16" x="456.39" y="216.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.10" xlink:href="#gridSVG.pch16" x="424.71" y="169.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.11" xlink:href="#gridSVG.pch16" x="406.61" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.12" xlink:href="#gridSVG.pch16" x="438.29" y="193.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.13" xlink:href="#gridSVG.pch16" x="429.24" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.14" xlink:href="#gridSVG.pch16" x="460.91" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.15" xlink:href="#gridSVG.pch16" x="411.14" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.16" xlink:href="#gridSVG.pch16" x="447.34" y="220.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.17" xlink:href="#gridSVG.pch16" x="451.86" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.18" xlink:href="#gridSVG.pch16" x="433.76" y="189.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.19" xlink:href="#gridSVG.pch16" x="451.86" y="203.35" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.20" xlink:href="#gridSVG.pch16" x="424.71" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.21" xlink:href="#gridSVG.pch16" x="465.44" y="193.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.22" xlink:href="#gridSVG.pch16" x="429.24" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.23" xlink:href="#gridSVG.pch16" x="469.96" y="206.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.24" xlink:href="#gridSVG.pch16" x="460.91" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.25" xlink:href="#gridSVG.pch16" x="442.81" y="210.06" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.26" xlink:href="#gridSVG.pch16" x="447.34" y="216.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.27" xlink:href="#gridSVG.pch16" x="465.44" y="223.47" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.28" xlink:href="#gridSVG.pch16" x="474.49" y="220.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.29" xlink:href="#gridSVG.pch16" x="451.86" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.30" xlink:href="#gridSVG.pch16" x="406.61" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.31" xlink:href="#gridSVG.pch16" x="420.19" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.32" xlink:href="#gridSVG.pch16" x="415.66" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.33" xlink:href="#gridSVG.pch16" x="424.71" y="189.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.34" xlink:href="#gridSVG.pch16" x="479.01" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.35" xlink:href="#gridSVG.pch16" x="451.86" y="176.53" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.36" xlink:href="#gridSVG.pch16" x="451.86" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.37" xlink:href="#gridSVG.pch16" x="460.91" y="220.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.38" xlink:href="#gridSVG.pch16" x="447.34" y="206.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.39" xlink:href="#gridSVG.pch16" x="433.76" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.40" xlink:href="#gridSVG.pch16" x="429.24" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.41" xlink:href="#gridSVG.pch16" x="447.34" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.42" xlink:href="#gridSVG.pch16" x="456.39" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.43" xlink:href="#gridSVG.pch16" x="429.24" y="189.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.44" xlink:href="#gridSVG.pch16" x="397.56" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.45" xlink:href="#gridSVG.pch16" x="438.29" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.46" xlink:href="#gridSVG.pch16" x="438.29" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.47" xlink:href="#gridSVG.pch16" x="438.29" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.48" xlink:href="#gridSVG.pch16" x="442.81" y="203.35" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.49" xlink:href="#gridSVG.pch16" x="383.99" y="166.47" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.2.1.1.50" xlink:href="#gridSVG.pch16" x="433.76" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.2.panel.2.1.1">
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.1" xlink:href="#gridSVG.pch16" x="311.58" y="230.17" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.2" xlink:href="#gridSVG.pch16" x="316.11" y="210.06" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.3" xlink:href="#gridSVG.pch16" x="316.11" y="226.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.4" xlink:href="#gridSVG.pch16" x="307.06" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.5" xlink:href="#gridSVG.pch16" x="316.11" y="213.41" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.6" xlink:href="#gridSVG.pch16" x="307.06" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.7" xlink:href="#gridSVG.pch16" x="320.63" y="206.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.8" xlink:href="#gridSVG.pch16" x="293.48" y="159.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.9" xlink:href="#gridSVG.pch16" x="307.06" y="216.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.10" xlink:href="#gridSVG.pch16" x="311.58" y="169.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.11" xlink:href="#gridSVG.pch16" x="293.48" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.12" xlink:href="#gridSVG.pch16" x="316.11" y="193.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.13" xlink:href="#gridSVG.pch16" x="293.48" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.14" xlink:href="#gridSVG.pch16" x="311.58" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.15" xlink:href="#gridSVG.pch16" x="307.06" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.16" xlink:href="#gridSVG.pch16" x="311.58" y="220.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.17" xlink:href="#gridSVG.pch16" x="316.11" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.18" xlink:href="#gridSVG.pch16" x="293.48" y="189.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.19" xlink:href="#gridSVG.pch16" x="316.11" y="203.35" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.20" xlink:href="#gridSVG.pch16" x="298.01" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.21" xlink:href="#gridSVG.pch16" x="329.68" y="193.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.22" xlink:href="#gridSVG.pch16" x="307.06" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.23" xlink:href="#gridSVG.pch16" x="316.11" y="206.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.24" xlink:href="#gridSVG.pch16" x="302.53" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.25" xlink:href="#gridSVG.pch16" x="307.06" y="210.06" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.26" xlink:href="#gridSVG.pch16" x="311.58" y="216.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.27" xlink:href="#gridSVG.pch16" x="311.58" y="223.47" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.28" xlink:href="#gridSVG.pch16" x="325.16" y="220.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.29" xlink:href="#gridSVG.pch16" x="316.11" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.30" xlink:href="#gridSVG.pch16" x="293.48" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.31" xlink:href="#gridSVG.pch16" x="298.01" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.32" xlink:href="#gridSVG.pch16" x="293.48" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.33" xlink:href="#gridSVG.pch16" x="302.53" y="189.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.34" xlink:href="#gridSVG.pch16" x="320.63" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.35" xlink:href="#gridSVG.pch16" x="316.11" y="176.53" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.36" xlink:href="#gridSVG.pch16" x="320.63" y="196.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.37" xlink:href="#gridSVG.pch16" x="316.11" y="220.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.38" xlink:href="#gridSVG.pch16" x="307.06" y="206.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.39" xlink:href="#gridSVG.pch16" x="307.06" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.40" xlink:href="#gridSVG.pch16" x="307.06" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.41" xlink:href="#gridSVG.pch16" x="302.53" y="179.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.42" xlink:href="#gridSVG.pch16" x="311.58" y="200" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.43" xlink:href="#gridSVG.pch16" x="302.53" y="189.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.44" xlink:href="#gridSVG.pch16" x="293.48" y="163.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.45" xlink:href="#gridSVG.pch16" x="307.06" y="183.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.46" xlink:href="#gridSVG.pch16" x="302.53" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.47" xlink:href="#gridSVG.pch16" x="307.06" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.48" xlink:href="#gridSVG.pch16" x="307.06" y="203.35" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.49" xlink:href="#gridSVG.pch16" x="298.01" y="166.47" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.2.1.1.50" xlink:href="#gridSVG.pch16" x="307.06" y="186.59" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.3.panel.2.1.1">
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.1" xlink:href="#gridSVG.pch16" x="460.91" y="102.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.2" xlink:href="#gridSVG.pch16" x="451.86" y="102.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.3" xlink:href="#gridSVG.pch16" x="469.96" y="99.42" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.4" xlink:href="#gridSVG.pch16" x="429.24" y="72.6" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.5" xlink:href="#gridSVG.pch16" x="456.39" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.6" xlink:href="#gridSVG.pch16" x="451.86" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.7" xlink:href="#gridSVG.pch16" x="460.91" y="106.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.8" xlink:href="#gridSVG.pch16" x="397.56" y="75.95" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.9" xlink:href="#gridSVG.pch16" x="456.39" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.10" xlink:href="#gridSVG.pch16" x="424.71" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.11" xlink:href="#gridSVG.pch16" x="406.61" y="62.54" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.12" xlink:href="#gridSVG.pch16" x="438.29" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.13" xlink:href="#gridSVG.pch16" x="429.24" y="69.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.14" xlink:href="#gridSVG.pch16" x="460.91" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.15" xlink:href="#gridSVG.pch16" x="411.14" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.16" xlink:href="#gridSVG.pch16" x="447.34" y="99.42" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.17" xlink:href="#gridSVG.pch16" x="451.86" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.18" xlink:href="#gridSVG.pch16" x="433.76" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.19" xlink:href="#gridSVG.pch16" x="451.86" y="69.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.20" xlink:href="#gridSVG.pch16" x="424.71" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.21" xlink:href="#gridSVG.pch16" x="465.44" y="102.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.22" xlink:href="#gridSVG.pch16" x="429.24" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.23" xlink:href="#gridSVG.pch16" x="469.96" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.24" xlink:href="#gridSVG.pch16" x="460.91" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.25" xlink:href="#gridSVG.pch16" x="442.81" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.26" xlink:href="#gridSVG.pch16" x="447.34" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.27" xlink:href="#gridSVG.pch16" x="465.44" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.28" xlink:href="#gridSVG.pch16" x="474.49" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.29" xlink:href="#gridSVG.pch16" x="451.86" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.30" xlink:href="#gridSVG.pch16" x="406.61" y="82.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.31" xlink:href="#gridSVG.pch16" x="420.19" y="75.95" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.32" xlink:href="#gridSVG.pch16" x="415.66" y="75.95" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.33" xlink:href="#gridSVG.pch16" x="424.71" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.34" xlink:href="#gridSVG.pch16" x="479.01" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.35" xlink:href="#gridSVG.pch16" x="451.86" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.36" xlink:href="#gridSVG.pch16" x="451.86" y="109.48" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.37" xlink:href="#gridSVG.pch16" x="460.91" y="99.42" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.38" xlink:href="#gridSVG.pch16" x="447.34" y="72.6" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.39" xlink:href="#gridSVG.pch16" x="433.76" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.40" xlink:href="#gridSVG.pch16" x="429.24" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.41" xlink:href="#gridSVG.pch16" x="447.34" y="82.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.42" xlink:href="#gridSVG.pch16" x="456.39" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.43" xlink:href="#gridSVG.pch16" x="429.24" y="82.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.44" xlink:href="#gridSVG.pch16" x="397.56" y="72.6" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.45" xlink:href="#gridSVG.pch16" x="438.29" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.46" xlink:href="#gridSVG.pch16" x="438.29" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.47" xlink:href="#gridSVG.pch16" x="438.29" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.48" xlink:href="#gridSVG.pch16" x="442.81" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.49" xlink:href="#gridSVG.pch16" x="383.99" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.2.1.1.50" xlink:href="#gridSVG.pch16" x="433.76" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.4.panel.2.1.1">
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.1" xlink:href="#gridSVG.pch16" x="311.58" y="102.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.2" xlink:href="#gridSVG.pch16" x="316.11" y="102.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.3" xlink:href="#gridSVG.pch16" x="316.11" y="99.42" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.4" xlink:href="#gridSVG.pch16" x="307.06" y="72.6" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.5" xlink:href="#gridSVG.pch16" x="316.11" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.6" xlink:href="#gridSVG.pch16" x="307.06" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.7" xlink:href="#gridSVG.pch16" x="320.63" y="106.12" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.8" xlink:href="#gridSVG.pch16" x="293.48" y="75.95" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.9" xlink:href="#gridSVG.pch16" x="307.06" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.10" xlink:href="#gridSVG.pch16" x="311.58" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.11" xlink:href="#gridSVG.pch16" x="293.48" y="62.54" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.12" xlink:href="#gridSVG.pch16" x="316.11" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.13" xlink:href="#gridSVG.pch16" x="293.48" y="69.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.14" xlink:href="#gridSVG.pch16" x="311.58" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.15" xlink:href="#gridSVG.pch16" x="307.06" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.16" xlink:href="#gridSVG.pch16" x="311.58" y="99.42" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.17" xlink:href="#gridSVG.pch16" x="316.11" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.18" xlink:href="#gridSVG.pch16" x="293.48" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.19" xlink:href="#gridSVG.pch16" x="316.11" y="69.24" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.20" xlink:href="#gridSVG.pch16" x="298.01" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.21" xlink:href="#gridSVG.pch16" x="329.68" y="102.77" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.22" xlink:href="#gridSVG.pch16" x="307.06" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.23" xlink:href="#gridSVG.pch16" x="316.11" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.24" xlink:href="#gridSVG.pch16" x="302.53" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.25" xlink:href="#gridSVG.pch16" x="307.06" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.26" xlink:href="#gridSVG.pch16" x="311.58" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.27" xlink:href="#gridSVG.pch16" x="311.58" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.28" xlink:href="#gridSVG.pch16" x="325.16" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.29" xlink:href="#gridSVG.pch16" x="316.11" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.30" xlink:href="#gridSVG.pch16" x="293.48" y="82.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.31" xlink:href="#gridSVG.pch16" x="298.01" y="75.95" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.32" xlink:href="#gridSVG.pch16" x="293.48" y="75.95" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.33" xlink:href="#gridSVG.pch16" x="302.53" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.34" xlink:href="#gridSVG.pch16" x="320.63" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.35" xlink:href="#gridSVG.pch16" x="316.11" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.36" xlink:href="#gridSVG.pch16" x="320.63" y="109.48" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.37" xlink:href="#gridSVG.pch16" x="316.11" y="99.42" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.38" xlink:href="#gridSVG.pch16" x="307.06" y="72.6" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.39" xlink:href="#gridSVG.pch16" x="307.06" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.40" xlink:href="#gridSVG.pch16" x="307.06" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.41" xlink:href="#gridSVG.pch16" x="302.53" y="82.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.42" xlink:href="#gridSVG.pch16" x="311.58" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.43" xlink:href="#gridSVG.pch16" x="302.53" y="82.65" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.44" xlink:href="#gridSVG.pch16" x="293.48" y="72.6" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.45" xlink:href="#gridSVG.pch16" x="307.06" y="86.01" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.46" xlink:href="#gridSVG.pch16" x="302.53" y="96.07" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.47" xlink:href="#gridSVG.pch16" x="307.06" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.48" xlink:href="#gridSVG.pch16" x="307.06" y="92.71" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.49" xlink:href="#gridSVG.pch16" x="298.01" y="79.3" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.2.1.1.50" xlink:href="#gridSVG.pch16" x="307.06" y="89.36" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.2.1.off.vp.2">
          <g id="plot_01.border.panel.2.1.1">
            <rect id="plot_01.border.panel.2.1.1.1" x="280.5" y="50.8" width="211.5" height="191.1" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="1" fill-opacity="0"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.strip.2.1.vp.1">
          <defs>
            <clipPath id="plot_01.toplevel.vp::plot_01.strip.2.1.vp::plot_01.strip.default.1.1.clipPath">
              <rect x="280.5" y="241.91" width="211.5" height="14.4" fill="none" stroke="none"/>
            </clipPath>
          </defs>
          <g id="plot_01.toplevel.vp::plot_01.strip.2.1.vp::plot_01.strip.default.1.1" clip-path="url(#plot_01.toplevel.vp::plot_01.strip.2.1.vp::plot_01.strip.default.1.1.clipPath)">
            <g id="plot_01.bg.strip.2.1.1">
              <rect id="plot_01.bg.strip.2.1.1.1" x="280.5" y="241.91" width="211.5" height="14.4" fill="rgb(203,221,230)" stroke="rgb(203,221,230)" stroke-opacity="1" fill-opacity="1"/>
            </g>
            <g id="plot_01.textr.strip.2.1.1">
              <g id="plot_01.textr.strip.2.1.1.1" transform="translate(360.73, 249.11)" stroke-width="0.1">
                <g id="plot_01.textr.strip.2.1.1.1.scale" transform="scale(1, -1)">
                  <text x="0" y="0" id="plot_01.textr.strip.2.1.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                    <tspan id="plot_01.textr.strip.2.1.1.1.tspan.1" dy="4.31" x="0">versicolor</tspan>
                  </text>
                </g>
              </g>
            </g>
          </g>
          <g id="plot_01.toplevel.vp::plot_01.strip.2.1.vp::plot_01.strip.default.off.1.1">
            <g id="plot_01.border.strip.2.1.1">
              <rect id="plot_01.border.strip.2.1.1.1" x="280.5" y="241.91" width="211.5" height="14.4" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="1" fill-opacity="0"/>
            </g>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.2.vp.1.clipPath">
            <rect x="44.8" y="280.5" width="211.5" height="191.1" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.2.vp.1" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.2.vp.1.clipPath)"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.1.2.off.vp.1"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.left.1.2.off.vp.1">
          <g id="plot_01.ticks.left.panel.1.2.1">
            <polyline id="plot_01.ticks.left.panel.1.2.1.1" points="44.8,286.35 39.13,286.35" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.2.1.2" points="44.8,315.76 39.13,315.76" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.2.1.3" points="44.8,345.17 39.13,345.17" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.2.1.4" points="44.8,374.58 39.13,374.58" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.2.1.5" points="44.8,403.99 39.13,403.99" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.2.1.6" points="44.8,433.4 39.13,433.4" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.2.1.7" points="44.8,462.81 39.13,462.81" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.left.panel.1.2.1">
            <g id="plot_01.ticklabels.left.panel.1.2.1.1" transform="translate(33.47, 286.35)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.1.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.1.tspan.1" dy="0" x="0">2</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.2.1.2" transform="translate(33.47, 315.76)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.2.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.2.tspan.1" dy="0" x="0">3</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.2.1.3" transform="translate(33.47, 345.17)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.3.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.3.tspan.1" dy="0" x="0">4</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.2.1.4" transform="translate(33.47, 374.58)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.4.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.4.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.4.tspan.1" dy="0" x="0">5</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.2.1.5" transform="translate(33.47, 403.99)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.5.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.5.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.5.tspan.1" dy="0" x="0">6</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.2.1.6" transform="translate(33.47, 433.4)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.6.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.6.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.6.tspan.1" dy="0" x="0">7</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.2.1.7" transform="translate(33.47, 462.81)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.2.1.7.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.2.1.7.text" transform="rotate(-90)" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.2.1.7.tspan.1" dy="0" x="0">8</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.2.off.vp.1">
          <g id="plot_01.ticks.bottom.panel.1.2.1">
            <polyline id="plot_01.ticks.bottom.panel.1.2.1.1" points="78.03,280.5 78.03,274.83" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.2.1.2" points="111.76,280.5 111.76,274.83" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.2.1.3" points="145.5,280.5 145.5,274.83" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.2.1.4" points="179.23,280.5 179.23,274.83" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.2.1.5" points="212.96,280.5 212.96,274.83" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.2.1.6" points="246.69,280.5 246.69,274.83" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.bottom.panel.1.2.1">
            <g id="plot_01.ticklabels.bottom.panel.1.2.1.1" transform="translate(78.03, 269.16)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.2.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.2.1.1.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.2.1.1.tspan.1" dy="7.18" x="0">2</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.2.1.2" transform="translate(111.76, 269.16)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.2.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.2.1.2.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.2.1.2.tspan.1" dy="7.18" x="0">3</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.2.1.3" transform="translate(145.5, 269.16)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.2.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.2.1.3.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.2.1.3.tspan.1" dy="7.18" x="0">4</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.2.1.4" transform="translate(179.23, 269.16)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.2.1.4.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.2.1.4.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.2.1.4.tspan.1" dy="7.18" x="0">5</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.2.1.5" transform="translate(212.96, 269.16)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.2.1.5.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.2.1.5.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.2.1.5.tspan.1" dy="7.18" x="0">6</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.2.1.6" transform="translate(246.69, 269.16)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.2.1.6.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.2.1.6.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.2.1.6.tspan.1" dy="7.18" x="0">7</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.2.vp.2.clipPath">
            <rect x="44.8" y="280.5" width="211.5" height="191.1" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.2.vp.2" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.2.vp.2.clipPath)">
          <g id="plot_01.xyplot.points.group.1.panel.1.2.1">
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.1" xlink:href="#gridSVG.pch16" x="212.96" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.2" xlink:href="#gridSVG.pch16" x="182.6" y="398.11" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.3" xlink:href="#gridSVG.pch16" x="209.59" y="436.34" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.4" xlink:href="#gridSVG.pch16" x="199.47" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.5" xlink:href="#gridSVG.pch16" x="206.21" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.6" xlink:href="#gridSVG.pch16" x="233.2" y="451.04" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.7" xlink:href="#gridSVG.pch16" x="162.36" y="371.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.8" xlink:href="#gridSVG.pch16" x="223.08" y="442.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.9" xlink:href="#gridSVG.pch16" x="206.21" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.10" xlink:href="#gridSVG.pch16" x="216.33" y="439.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.11" xlink:href="#gridSVG.pch16" x="182.6" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.12" xlink:href="#gridSVG.pch16" x="189.35" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.13" xlink:href="#gridSVG.pch16" x="196.1" y="427.51" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.14" xlink:href="#gridSVG.pch16" x="179.23" y="395.16" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.15" xlink:href="#gridSVG.pch16" x="182.6" y="398.11" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.16" xlink:href="#gridSVG.pch16" x="189.35" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.17" xlink:href="#gridSVG.pch16" x="196.1" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.18" xlink:href="#gridSVG.pch16" x="236.57" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.19" xlink:href="#gridSVG.pch16" x="243.32" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.20" xlink:href="#gridSVG.pch16" x="179.23" y="403.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.21" xlink:href="#gridSVG.pch16" x="202.84" y="430.46" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.22" xlink:href="#gridSVG.pch16" x="175.86" y="392.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.23" xlink:href="#gridSVG.pch16" x="236.57" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.24" xlink:href="#gridSVG.pch16" x="175.86" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.25" xlink:href="#gridSVG.pch16" x="202.84" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.26" xlink:href="#gridSVG.pch16" x="212.96" y="439.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.27" xlink:href="#gridSVG.pch16" x="172.48" y="409.87" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.28" xlink:href="#gridSVG.pch16" x="175.86" y="406.93" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.29" xlink:href="#gridSVG.pch16" x="199.47" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.30" xlink:href="#gridSVG.pch16" x="206.21" y="439.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.31" xlink:href="#gridSVG.pch16" x="216.33" y="445.16" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.32" xlink:href="#gridSVG.pch16" x="226.45" y="459.87" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.33" xlink:href="#gridSVG.pch16" x="199.47" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.34" xlink:href="#gridSVG.pch16" x="182.6" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.35" xlink:href="#gridSVG.pch16" x="199.47" y="406.93" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.36" xlink:href="#gridSVG.pch16" x="216.33" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.37" xlink:href="#gridSVG.pch16" x="199.47" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.38" xlink:href="#gridSVG.pch16" x="196.1" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.39" xlink:href="#gridSVG.pch16" x="172.48" y="403.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.40" xlink:href="#gridSVG.pch16" x="192.72" y="430.46" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.41" xlink:href="#gridSVG.pch16" x="199.47" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.42" xlink:href="#gridSVG.pch16" x="182.6" y="430.46" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.43" xlink:href="#gridSVG.pch16" x="182.6" y="398.11" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.44" xlink:href="#gridSVG.pch16" x="209.59" y="427.51" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.45" xlink:href="#gridSVG.pch16" x="202.84" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.46" xlink:href="#gridSVG.pch16" x="185.98" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.47" xlink:href="#gridSVG.pch16" x="179.23" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.48" xlink:href="#gridSVG.pch16" x="185.98" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.49" xlink:href="#gridSVG.pch16" x="192.72" y="409.87" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.1.panel.1.2.1.50" xlink:href="#gridSVG.pch16" x="182.6" y="401.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.2.panel.1.2.1">
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.1" xlink:href="#gridSVG.pch16" x="94.9" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.2" xlink:href="#gridSVG.pch16" x="74.66" y="398.11" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.3" xlink:href="#gridSVG.pch16" x="81.4" y="436.34" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.4" xlink:href="#gridSVG.pch16" x="71.28" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.5" xlink:href="#gridSVG.pch16" x="84.78" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.6" xlink:href="#gridSVG.pch16" x="81.4" y="451.04" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.7" xlink:href="#gridSVG.pch16" x="67.91" y="371.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.8" xlink:href="#gridSVG.pch16" x="71.28" y="442.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.9" xlink:href="#gridSVG.pch16" x="71.28" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.10" xlink:href="#gridSVG.pch16" x="94.9" y="439.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.11" xlink:href="#gridSVG.pch16" x="78.03" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.12" xlink:href="#gridSVG.pch16" x="74.66" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.13" xlink:href="#gridSVG.pch16" x="81.4" y="427.51" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.14" xlink:href="#gridSVG.pch16" x="78.03" y="395.16" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.15" xlink:href="#gridSVG.pch16" x="91.52" y="398.11" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.16" xlink:href="#gridSVG.pch16" x="88.15" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.17" xlink:href="#gridSVG.pch16" x="71.28" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.18" xlink:href="#gridSVG.pch16" x="84.78" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.19" xlink:href="#gridSVG.pch16" x="88.15" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.20" xlink:href="#gridSVG.pch16" x="61.16" y="403.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.21" xlink:href="#gridSVG.pch16" x="88.15" y="430.46" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.22" xlink:href="#gridSVG.pch16" x="78.03" y="392.22" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.23" xlink:href="#gridSVG.pch16" x="78.03" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.24" xlink:href="#gridSVG.pch16" x="71.28" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.25" xlink:href="#gridSVG.pch16" x="81.4" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.26" xlink:href="#gridSVG.pch16" x="71.28" y="439.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.27" xlink:href="#gridSVG.pch16" x="71.28" y="409.87" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.28" xlink:href="#gridSVG.pch16" x="71.28" y="406.93" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.29" xlink:href="#gridSVG.pch16" x="81.4" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.30" xlink:href="#gridSVG.pch16" x="64.54" y="439.28" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.31" xlink:href="#gridSVG.pch16" x="74.66" y="445.16" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.32" xlink:href="#gridSVG.pch16" x="78.03" y="459.87" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.33" xlink:href="#gridSVG.pch16" x="84.78" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.34" xlink:href="#gridSVG.pch16" x="61.16" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.35" xlink:href="#gridSVG.pch16" x="57.79" y="406.93" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.36" xlink:href="#gridSVG.pch16" x="88.15" y="453.98" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.37" xlink:href="#gridSVG.pch16" x="91.52" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.38" xlink:href="#gridSVG.pch16" x="71.28" y="415.75" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.39" xlink:href="#gridSVG.pch16" x="71.28" y="403.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.40" xlink:href="#gridSVG.pch16" x="81.4" y="430.46" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.41" xlink:href="#gridSVG.pch16" x="91.52" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.42" xlink:href="#gridSVG.pch16" x="88.15" y="430.46" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.43" xlink:href="#gridSVG.pch16" x="74.66" y="398.11" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.44" xlink:href="#gridSVG.pch16" x="88.15" y="427.51" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.45" xlink:href="#gridSVG.pch16" x="94.9" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.46" xlink:href="#gridSVG.pch16" x="88.15" y="424.57" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.47" xlink:href="#gridSVG.pch16" x="74.66" y="412.81" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.48" xlink:href="#gridSVG.pch16" x="78.03" y="418.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.49" xlink:href="#gridSVG.pch16" x="88.15" y="409.87" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.2.panel.1.2.1.50" xlink:href="#gridSVG.pch16" x="71.28" y="401.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.3.panel.1.2.1">
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.1" xlink:href="#gridSVG.pch16" x="212.96" y="324.58" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.2" xlink:href="#gridSVG.pch16" x="182.6" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.3" xlink:href="#gridSVG.pch16" x="209.59" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.4" xlink:href="#gridSVG.pch16" x="199.47" y="312.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.5" xlink:href="#gridSVG.pch16" x="206.21" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.6" xlink:href="#gridSVG.pch16" x="233.2" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.7" xlink:href="#gridSVG.pch16" x="162.36" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.8" xlink:href="#gridSVG.pch16" x="223.08" y="312.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.9" xlink:href="#gridSVG.pch16" x="206.21" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.10" xlink:href="#gridSVG.pch16" x="216.33" y="333.4" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.11" xlink:href="#gridSVG.pch16" x="182.6" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.12" xlink:href="#gridSVG.pch16" x="189.35" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.13" xlink:href="#gridSVG.pch16" x="196.1" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.14" xlink:href="#gridSVG.pch16" x="179.23" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.15" xlink:href="#gridSVG.pch16" x="182.6" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.16" xlink:href="#gridSVG.pch16" x="189.35" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.17" xlink:href="#gridSVG.pch16" x="196.1" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.18" xlink:href="#gridSVG.pch16" x="236.57" y="339.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.19" xlink:href="#gridSVG.pch16" x="243.32" y="303.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.20" xlink:href="#gridSVG.pch16" x="179.23" y="292.23" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.21" xlink:href="#gridSVG.pch16" x="202.84" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.22" xlink:href="#gridSVG.pch16" x="175.86" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.23" xlink:href="#gridSVG.pch16" x="236.57" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.24" xlink:href="#gridSVG.pch16" x="175.86" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.25" xlink:href="#gridSVG.pch16" x="202.84" y="324.58" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.26" xlink:href="#gridSVG.pch16" x="212.96" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.27" xlink:href="#gridSVG.pch16" x="172.48" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.28" xlink:href="#gridSVG.pch16" x="175.86" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.29" xlink:href="#gridSVG.pch16" x="199.47" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.30" xlink:href="#gridSVG.pch16" x="206.21" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.31" xlink:href="#gridSVG.pch16" x="216.33" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.32" xlink:href="#gridSVG.pch16" x="226.45" y="339.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.33" xlink:href="#gridSVG.pch16" x="199.47" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.34" xlink:href="#gridSVG.pch16" x="182.6" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.35" xlink:href="#gridSVG.pch16" x="199.47" y="303.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.36" xlink:href="#gridSVG.pch16" x="216.33" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.37" xlink:href="#gridSVG.pch16" x="199.47" y="327.52" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.38" xlink:href="#gridSVG.pch16" x="196.1" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.39" xlink:href="#gridSVG.pch16" x="172.48" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.40" xlink:href="#gridSVG.pch16" x="192.72" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.41" xlink:href="#gridSVG.pch16" x="199.47" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.42" xlink:href="#gridSVG.pch16" x="182.6" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.43" xlink:href="#gridSVG.pch16" x="182.6" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.44" xlink:href="#gridSVG.pch16" x="209.59" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.45" xlink:href="#gridSVG.pch16" x="202.84" y="324.58" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.46" xlink:href="#gridSVG.pch16" x="185.98" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.47" xlink:href="#gridSVG.pch16" x="179.23" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.48" xlink:href="#gridSVG.pch16" x="185.98" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.49" xlink:href="#gridSVG.pch16" x="192.72" y="327.52" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.3.panel.1.2.1.50" xlink:href="#gridSVG.pch16" x="182.6" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
          <g id="plot_01.xyplot.points.group.4.panel.1.2.1">
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.1" xlink:href="#gridSVG.pch16" x="94.9" y="324.58" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.2" xlink:href="#gridSVG.pch16" x="74.66" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.3" xlink:href="#gridSVG.pch16" x="81.4" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.4" xlink:href="#gridSVG.pch16" x="71.28" y="312.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.5" xlink:href="#gridSVG.pch16" x="84.78" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.6" xlink:href="#gridSVG.pch16" x="81.4" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.7" xlink:href="#gridSVG.pch16" x="67.91" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.8" xlink:href="#gridSVG.pch16" x="71.28" y="312.82" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.9" xlink:href="#gridSVG.pch16" x="71.28" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.10" xlink:href="#gridSVG.pch16" x="94.9" y="333.4" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.11" xlink:href="#gridSVG.pch16" x="78.03" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.12" xlink:href="#gridSVG.pch16" x="74.66" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.13" xlink:href="#gridSVG.pch16" x="81.4" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.14" xlink:href="#gridSVG.pch16" x="78.03" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.15" xlink:href="#gridSVG.pch16" x="91.52" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.16" xlink:href="#gridSVG.pch16" x="88.15" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.17" xlink:href="#gridSVG.pch16" x="71.28" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.18" xlink:href="#gridSVG.pch16" x="84.78" y="339.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.19" xlink:href="#gridSVG.pch16" x="88.15" y="303.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.20" xlink:href="#gridSVG.pch16" x="61.16" y="292.23" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.21" xlink:href="#gridSVG.pch16" x="88.15" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.22" xlink:href="#gridSVG.pch16" x="78.03" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.23" xlink:href="#gridSVG.pch16" x="78.03" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.24" xlink:href="#gridSVG.pch16" x="71.28" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.25" xlink:href="#gridSVG.pch16" x="81.4" y="324.58" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.26" xlink:href="#gridSVG.pch16" x="71.28" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.27" xlink:href="#gridSVG.pch16" x="71.28" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.28" xlink:href="#gridSVG.pch16" x="71.28" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.29" xlink:href="#gridSVG.pch16" x="81.4" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.30" xlink:href="#gridSVG.pch16" x="64.54" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.31" xlink:href="#gridSVG.pch16" x="74.66" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.32" xlink:href="#gridSVG.pch16" x="78.03" y="339.29" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.33" xlink:href="#gridSVG.pch16" x="84.78" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.34" xlink:href="#gridSVG.pch16" x="61.16" y="309.88" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.35" xlink:href="#gridSVG.pch16" x="57.79" y="303.99" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.36" xlink:href="#gridSVG.pch16" x="88.15" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.37" xlink:href="#gridSVG.pch16" x="91.52" y="327.52" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.38" xlink:href="#gridSVG.pch16" x="71.28" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.39" xlink:href="#gridSVG.pch16" x="71.28" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.40" xlink:href="#gridSVG.pch16" x="81.4" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.41" xlink:href="#gridSVG.pch16" x="91.52" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.42" xlink:href="#gridSVG.pch16" x="88.15" y="318.7" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.43" xlink:href="#gridSVG.pch16" x="74.66" y="306.94" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.44" xlink:href="#gridSVG.pch16" x="88.15" y="321.64" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.45" xlink:href="#gridSVG.pch16" x="94.9" y="324.58" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.46" xlink:href="#gridSVG.pch16" x="88.15" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.47" xlink:href="#gridSVG.pch16" x="74.66" y="301.05" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.48" xlink:href="#gridSVG.pch16" x="78.03" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.49" xlink:href="#gridSVG.pch16" x="88.15" y="327.52" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
            <use id="plot_01.xyplot.points.group.4.panel.1.2.1.50" xlink:href="#gridSVG.pch16" x="71.28" y="315.76" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" stroke-width="1.17" opacity="1" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.2.off.vp.2">
          <g id="plot_01.border.panel.1.2.1">
            <rect id="plot_01.border.panel.1.2.1.1" x="44.8" y="280.5" width="211.5" height="191.1" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="1" fill-opacity="0"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.strip.1.2.vp.1">
          <defs>
            <clipPath id="plot_01.toplevel.vp::plot_01.strip.1.2.vp::plot_01.strip.default.1.1.clipPath">
              <rect x="44.8" y="471.6" width="211.5" height="14.4" fill="none" stroke="none"/>
            </clipPath>
          </defs>
          <g id="plot_01.toplevel.vp::plot_01.strip.1.2.vp::plot_01.strip.default.1.1" clip-path="url(#plot_01.toplevel.vp::plot_01.strip.1.2.vp::plot_01.strip.default.1.1.clipPath)">
            <g id="plot_01.bg.strip.1.2.1">
              <rect id="plot_01.bg.strip.1.2.1.1" x="44.8" y="471.6" width="211.5" height="14.4" fill="rgb(203,221,230)" stroke="rgb(203,221,230)" stroke-opacity="1" fill-opacity="1"/>
            </g>
            <g id="plot_01.textr.strip.1.2.1">
              <g id="plot_01.textr.strip.1.2.1.1" transform="translate(128.55, 478.8)" stroke-width="0.1">
                <g id="plot_01.textr.strip.1.2.1.1.scale" transform="scale(1, -1)">
                  <text x="0" y="0" id="plot_01.textr.strip.1.2.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                    <tspan id="plot_01.textr.strip.1.2.1.1.tspan.1" dy="4.31" x="0">virginica</tspan>
                  </text>
                </g>
              </g>
            </g>
          </g>
          <g id="plot_01.toplevel.vp::plot_01.strip.1.2.vp::plot_01.strip.default.off.1.1">
            <g id="plot_01.border.strip.1.2.1">
              <rect id="plot_01.border.strip.1.2.1.1" x="44.8" y="471.6" width="211.5" height="14.4" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="1" fill-opacity="0"/>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.legend.region.vp.1">
          <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp.1">
            <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1.1">
              <g id="plot_01.key.frame.1">
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.2.1">
                  <g id="GRID.cellGrob.11.1">
                    <g id="plot_01.key.background.1">
                      <rect id="plot_01.key.background.1.1" x="290.76" y="355.44" width="180.86" height="45.98" fill="none" opacity="1" stroke="none" stroke-opacity="0" fill-opacity="0"/>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.3.1">
                  <g id="GRID.cellGrob.12.1">
                    <g id="plot_01.key.text.1.1.1">
                      <g id="plot_01.key.text.1.1.1.1" transform="translate(297.43, 395.68)" stroke-width="0.1">
                        <g id="plot_01.key.text.1.1.1.1.scale" transform="scale(1, -1)">
                          <text x="0" y="0" id="plot_01.key.text.1.1.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                            <tspan id="plot_01.key.text.1.1.1.1.tspan.1" dy="4.31" x="0">Sepal.Length * Petal.Length</tspan>
                          </text>
                        </g>
                      </g>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.4.1">
                  <g id="GRID.cellGrob.13.1">
                    <g id="plot_01.key.text.1.2.1">
                      <g id="plot_01.key.text.1.2.1.1" transform="translate(297.43, 384.18)" stroke-width="0.1">
                        <g id="plot_01.key.text.1.2.1.1.scale" transform="scale(1, -1)">
                          <text x="0" y="0" id="plot_01.key.text.1.2.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                            <tspan id="plot_01.key.text.1.2.1.1.tspan.1" dy="4.31" x="0">Sepal.Length * Petal.Width</tspan>
                          </text>
                        </g>
                      </g>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.5.1">
                  <g id="GRID.cellGrob.14.1">
                    <g id="plot_01.key.text.1.3.1">
                      <g id="plot_01.key.text.1.3.1.1" transform="translate(297.43, 372.69)" stroke-width="0.1">
                        <g id="plot_01.key.text.1.3.1.1.scale" transform="scale(1, -1)">
                          <text x="0" y="0" id="plot_01.key.text.1.3.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                            <tspan id="plot_01.key.text.1.3.1.1.tspan.1" dy="4.31" x="0">Sepal.Width * Petal.Length</tspan>
                          </text>
                        </g>
                      </g>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.6.1">
                  <g id="GRID.cellGrob.15.1">
                    <g id="plot_01.key.text.1.4.1">
                      <g id="plot_01.key.text.1.4.1.1" transform="translate(297.43, 361.19)" stroke-width="0.1">
                        <g id="plot_01.key.text.1.4.1.1.scale" transform="scale(1, -1)">
                          <text x="0" y="0" id="plot_01.key.text.1.4.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                            <tspan id="plot_01.key.text.1.4.1.1.tspan.1" dy="4.31" x="0">Sepal.Width * Petal.Width</tspan>
                          </text>
                        </g>
                      </g>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.7.1">
                  <g id="GRID.cellGrob.16.1">
                    <g id="plot_01.key.points.2.1.1" onclick="highlight(1)">
                      <use id="plot_01.key.points.2.1.1.1" xlink:href="#gridSVG.pch16" x="462.28" y="395.68" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" opacity="1" stroke-width="1.17" fill="rgb(0,82,109)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.8.1">
                  <g id="GRID.cellGrob.17.1">
                    <g id="plot_01.key.points.2.2.1" onclick="highlight(2)">
                      <use id="plot_01.key.points.2.2.1.1" xlink:href="#gridSVG.pch16" x="462.28" y="384.18" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" opacity="1" stroke-width="1.17" fill="rgb(0,163,219)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.9.1">
                  <g id="GRID.cellGrob.18.1">
                    <g id="plot_01.key.points.2.3.1" onclick="highlight(3)">
                      <use id="plot_01.key.points.2.3.1.1" xlink:href="#gridSVG.pch16" x="462.28" y="372.69" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" opacity="1" stroke-width="1.17" fill="rgb(122,39,19)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
                    </g>
                  </g>
                </g>
                <g id="plot_01.toplevel.vp::plot_01.legend.region.vp::plot_01.legend.inside.vp::GRID.VP.1::GRID.VP.10.1">
                  <g id="GRID.cellGrob.19.1">
                    <g id="plot_01.key.points.2.4.1" onclick="highlight(4)">
                      <use id="plot_01.key.points.2.4.1.1" xlink:href="#gridSVG.pch16" x="462.28" y="361.19" width="6.4" height="6.4" transform="translate(-3.2,-3.2)" stroke="none" opacity="1" stroke-width="1.17" fill="rgb(147,149,152)" font-size="6.4" stroke-opacity="0" fill-opacity="1" font-weight="normal" font-style="normal"/>
                    </g>
                  </g>
                </g>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01..1"/>
      </g>
      <g id="GRID.text.26.1" filter="url(#point-blur.1)">
        <g id="GRID.text.26.1.1" transform="translate(252, 252)" stroke-width="0.1">
          <g id="GRID.text.26.1.1.scale" transform="scale(1, -1)">
            <text x="0" y="0" id="GRID.text.26.1.1.text" text-anchor="middle" fill="rgb(0,0,0)" fill-opacity="1">
              <tspan id="GRID.text.26.1.1.tspan.1" dy="4.31" x="0"></tspan>
            </text>
          </g>
        </g>
      </g>
    </g>
  </g>
</svg> 


`grid.script` does not work in `open_notebook`, since the script gets parsed as markdown.  We could load scripts from a file or url like `grid.script` through something like

```
cat(
  "<script>",
  readLines("c:/myjavascriptfiles/highlight-blur.js"),
  </script>"
)
```
but I think the use case would favor writing the script as below.
```
function highlight(i) {
    for (row=1; row<3; row++) {
        for (col=1; col<3; col++) {
            for (j=1; j<5; j++) {
                var target = 
                    document.getElementById("plot_01.xyplot.points.group." 
                                            + j + ".panel." + 
                                            row + "." + col + ".1");
                if (i == j) {
                    target.setAttribute("filter", "none");            
                } else {
                    target.setAttribute("filter", "url(#point-blur.1)");
                }
            }
        }
    }
}
```


<script>
function highlight(i) {
    for (row=1; row<3; row++) {
        for (col=1; col<3; col++) {
            for (j=1; j<5; j++) {
                var target = 
                    document.getElementById("plot_01.xyplot.points.group." 
                                            + j + ".panel." + 
                                            row + "." + col + ".1");
                if (i == j) {
                    target.setAttribute("filter", "none");            
                } else {
                    target.setAttribute("filter", "url(#point-blur.1)");
                }
            }
        }
    }
}

</script>



## Example 2 - Gradient Fills in Statistical Graphics

```r
xyplot(y ~ x, ylim = extendrange(c(y + delta, y - delta)), pch = 21, col = "white", 
    bg = "black", panel = function(x, y, ...) {
        lrect(x - barwidth, y - delta, x + barwidth, y + delta, border = "transparent", 
            identifier = "bar")
        panel.xyplot(x, y, ...)
    })
lg <- linearGradient(c("white", "black", "white"), x0 = 0.5, y0 = 0, x1 = 0.5, 
    y1 = 1)
registerGradientFill("lg", lg)
grid.gradientFill("bar.rect", label = rep("lg", 10), grep = TRUE, group = FALSE)
grid.export("")$svg
```



```r
trellis.par.set(ggplot2like())
plotdat <- aggregate(hp ~ gear + vs, data = mtcars, mean)
plotdat$gear <- factor(plotdat$gear)
plotdat$vs <- factor(plotdat$vs)
barchart(hp ~ gear, groups = vs, data = plotdat, xlab = "Number of Gears", ylab = "Mean Horsepower", 
    auto.key = list(space = "right"), horizontal = FALSE)
fills <- c("#CCFFFF", "#FFCCFF")
val0pat <- pattern(gTree(children = gList(rectGrob(gp = gpar(col = NA, fill = fills[1])), 
    linesGrob(gp = gpar(col = "black")))), width = unit(2, "mm"), height = unit(2, 
    "mm"), dev.width = 1, dev.height = 1)
val1pat <- pattern(gTree(children = gList(rectGrob(gp = gpar(col = NA, fill = fills[2])), 
    filterGrob(circleGrob(r = 0.4, gp = gpar(lwd = 5)), filterEffect(feGaussianBlur(sd = 10))))), 
    width = unit(2, "mm"), height = unit(2, "mm"), dev.width = 1, dev.height = 1)
grid.export("")$svg
```

```
## Warning: one of more grobs overwritten (grab WILL not be faithful; try
## 'wrap = TRUE')
```

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="504px" height="504px" viewBox="0 0 504 504" version="1.1">
  <metadata xmlns:gridsvg="http://www.stat.auckland.ac.nz/~paul/R/gridSVG/">
    <gridsvg:generator name="gridSVG" version="1.3-0" time="2013-08-05 09:49:58"/>
    <gridsvg:argument name="name" value=""/>
    <gridsvg:argument name="exportCoords" value="none"/>
    <gridsvg:argument name="exportMappings" value="none"/>
    <gridsvg:argument name="exportJS" value="none"/>
    <gridsvg:argument name="res" value="72"/>
    <gridsvg:argument name="prefix" value=""/>
    <gridsvg:argument name="addClasses" value="FALSE"/>
    <gridsvg:argument name="indent" value="TRUE"/>
    <gridsvg:argument name="htmlWrapper" value="FALSE"/>
    <gridsvg:argument name="usePaths" value="vpPaths"/>
    <gridsvg:argument name="uniqueNames" value="TRUE"/>
    <gridsvg:separator name="id.sep" value="."/>
    <gridsvg:separator name="gPath.sep" value="::"/>
    <gridsvg:separator name="vpPath.sep" value="::"/>
  </metadata>
  <g transform="translate(0, 504) scale(1, -1)">
    <g id="gridSVG" fill="none" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" font-size="12" font-family="Helvetica, Arial, FreeSans, Liberation Sans, Nimbus Sans L, sans-serif" opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-opacity="1" fill-opacity="0" font-weight="normal" font-style="normal">
      <defs/>
      <g id="plot_01.background.1">
        <rect id="plot_01.background.1.1" x="0" y="0" width="504" height="504" fill="none" stroke="none" stroke-opacity="0" fill-opacity="0"/>
      </g>
      <g id="plot_01.toplevel.vp.1" font-size="12">
        <g id="plot_01.toplevel.vp::plot_01.xlab.vp.1">
          <g id="plot_01.xlab.1">
            <g id="plot_01.xlab.1.1" transform="translate(231.96, 16.31)" stroke-width="0.1">
              <g id="plot_01.xlab.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.xlab.1.1.text" text-anchor="middle" opacity="1" stroke="rgb(0,0,0)" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.xlab.1.1.tspan.1" dy="4.31" x="0">Number of Gears</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.ylab.vp.1">
          <g id="plot_01.ylab.1">
            <g id="plot_01.ylab.1.1" transform="translate(10.31, 259.9)" stroke-width="0.1">
              <g id="plot_01.ylab.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ylab.1.1.text" transform="rotate(-90)" text-anchor="middle" opacity="1" stroke="rgb(0,0,0)" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ylab.1.1.tspan.1" dy="4.31" x="0">Mean Horsepower</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.figure.vp.1"/>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.1.clipPath">
            <rect x="54.3" y="45.13" width="355.3" height="429.53" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.1" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.1.vp.1.clipPath)">
          <g id="plot_01.fill.panel.1.1.1">
            <rect id="plot_01.fill.panel.1.1.1.1" x="54.3" y="45.13" width="355.3" height="429.53" fill="rgb(229,229,229)" stroke="none" stroke-opacity="0" fill-opacity="1"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.strip.1.1.off.vp.1"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.left.1.1.off.vp.1">
          <g id="plot_01.ticks.left.panel.1.1.1">
            <polyline id="plot_01.ticks.left.panel.1.1.1.1" points="54.3,113.55 48.63,113.55" stroke="none" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="0" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.1.1.2" points="54.3,257.52 48.63,257.52" stroke="none" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="0" fill="none"/>
            <polyline id="plot_01.ticks.left.panel.1.1.1.3" points="54.3,401.5 48.63,401.5" stroke="none" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="0" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.left.panel.1.1.1">
            <g id="plot_01.ticklabels.left.panel.1.1.1.1" transform="translate(42.97, 113.55)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.1.1.1.text" text-anchor="end" stroke="rgb(127,127,127)" opacity="1" fill="rgb(127,127,127)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.1.1.1.tspan.1" dy="3.59" x="0">100</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.1.1.2" transform="translate(42.97, 257.52)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.1.1.2.text" text-anchor="end" stroke="rgb(127,127,127)" opacity="1" fill="rgb(127,127,127)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.1.1.2.tspan.1" dy="3.59" x="0">150</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.left.panel.1.1.1.3" transform="translate(42.97, 401.5)" stroke-width="0.1">
              <g id="plot_01.ticklabels.left.panel.1.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.left.panel.1.1.1.3.text" text-anchor="end" stroke="rgb(127,127,127)" opacity="1" fill="rgb(127,127,127)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.left.panel.1.1.1.3.tspan.1" dy="3.59" x="0">200</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.off.vp.1">
          <g id="plot_01.ticklabels.bottom.panel.1.1.1">
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.1" transform="translate(120.92, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.1.text" text-anchor="middle" stroke="rgb(127,127,127)" opacity="1" fill="rgb(127,127,127)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.1.tspan.1" dy="7.18" x="0">3</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.2" transform="translate(231.96, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.2.text" text-anchor="middle" stroke="rgb(127,127,127)" opacity="1" fill="rgb(127,127,127)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.2.tspan.1" dy="7.18" x="0">4</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.3" transform="translate(342.99, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.3.text" text-anchor="middle" stroke="rgb(127,127,127)" opacity="1" fill="rgb(127,127,127)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.3.tspan.1" dy="7.18" x="0">5</tspan>
                </text>
              </g>
            </g>
          </g>
          <g id="plot_01.ticks.right.panel.1.1.1">
            <polyline id="plot_01.ticks.right.panel.1.1.1.1" points="409.61,113.55 415.28,113.55" stroke="none" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="0" fill="none"/>
            <polyline id="plot_01.ticks.right.panel.1.1.1.2" points="409.61,257.52 415.28,257.52" stroke="none" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="0" fill="none"/>
            <polyline id="plot_01.ticks.right.panel.1.1.1.3" points="409.61,401.5 415.28,401.5" stroke="none" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="0" fill="none"/>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.2.clipPath">
            <rect x="54.3" y="45.13" width="355.3" height="429.53" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.2" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.1.vp.2.clipPath)">
          <g id="plot_01.barchart.rect.panel.1.1.1">
            <rect id="plot_01.barchart.rect.panel.1.1.1.1" x="83.91" y="45.13" width="37.01" height="339.56" fill="rgb(248,118,109)" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" stroke-opacity="0" fill-opacity="1"/>
            <rect id="plot_01.barchart.rect.panel.1.1.1.2" x="120.92" y="45.13" width="37.01" height="79.93" fill="rgb(183,159,0)" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" stroke-opacity="0" fill-opacity="1"/>
          </g>
          <g id="plot_01.barchart.rect.panel.1.1.2">
            <rect id="plot_01.barchart.rect.panel.1.1.2.1" x="194.94" y="45.13" width="37.01" height="97.21" fill="rgb(248,118,109)" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" stroke-opacity="0" fill-opacity="1"/>
            <rect id="plot_01.barchart.rect.panel.1.1.2.2" x="231.96" y="45.13" width="37.01" height="26.37" fill="rgb(183,159,0)" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" stroke-opacity="0" fill-opacity="1"/>
          </g>
          <g id="plot_01.barchart.rect.panel.1.1.3">
            <rect id="plot_01.barchart.rect.panel.1.1.3.1" x="305.98" y="45.13" width="37.01" height="403.15" fill="rgb(248,118,109)" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" stroke-opacity="0" fill-opacity="1"/>
            <rect id="plot_01.barchart.rect.panel.1.1.3.2" x="342.99" y="45.13" width="37.01" height="105.85" fill="rgb(183,159,0)" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" stroke-opacity="0" fill-opacity="1"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.off.vp.2">
          <g id="plot_01.border.panel.1.1.1">
            <rect id="plot_01.border.panel.1.1.1.1" x="54.3" y="45.13" width="355.3" height="429.53" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="0" fill-opacity="0"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.legend.right.vp.1">
          <g id="plot_01.toplevel.vp::plot_01.legend.right.vp::GRID.VP.616.1">
            <g id="plot_01.key.frame.1">
              <g id="plot_01.toplevel.vp::plot_01.legend.right.vp::GRID.VP.616::GRID.VP.617.1">
                <g id="GRID.cellGrob.151.1">
                  <g id="plot_01.key.background.1">
                    <rect id="plot_01.key.background.1.1" x="432.61" y="250.13" width="65.39" height="19.55" fill="none" opacity="1" stroke="none" stroke-opacity="0" fill-opacity="0"/>
                  </g>
                </g>
              </g>
              <g id="plot_01.toplevel.vp::plot_01.legend.right.vp::GRID.VP.616::GRID.VP.618.1">
                <g id="GRID.cellGrob.152.1">
                  <g id="plot_01.key.text.1.1.1">
                    <g id="plot_01.key.text.1.1.1.1" transform="translate(439.29, 264.78)" stroke-width="0.1">
                      <g id="plot_01.key.text.1.1.1.1.scale" transform="scale(1, -1)">
                        <text x="0" y="0" id="plot_01.key.text.1.1.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                          <tspan id="plot_01.key.text.1.1.1.1.tspan.1" dy="3.59" x="0">0</tspan>
                        </text>
                      </g>
                    </g>
                  </g>
                </g>
              </g>
              <g id="plot_01.toplevel.vp::plot_01.legend.right.vp::GRID.VP.616::GRID.VP.619.1">
                <g id="GRID.cellGrob.153.1">
                  <g id="plot_01.key.text.1.2.1">
                    <g id="plot_01.key.text.1.2.1.1" transform="translate(439.29, 255.01)" stroke-width="0.1">
                      <g id="plot_01.key.text.1.2.1.1.scale" transform="scale(1, -1)">
                        <text x="0" y="0" id="plot_01.key.text.1.2.1.1.text" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                          <tspan id="plot_01.key.text.1.2.1.1.tspan.1" dy="3.59" x="0">1</tspan>
                        </text>
                      </g>
                    </g>
                  </g>
                </g>
              </g>
              <g id="plot_01.toplevel.vp::plot_01.legend.right.vp::GRID.VP.616::GRID.VP.620.1">
                <g id="GRID.cellGrob.154.1">
                  <g id="plot_01.key.rect.2.1.1">
                    <rect id="plot_01.key.rect.2.1.1.1" x="457.97" y="259.9" width="33.36" height="9.77" opacity="1" fill="rgb(248,118,109)" stroke="none" stroke-opacity="0" fill-opacity="1"/>
                  </g>
                </g>
              </g>
              <g id="plot_01.toplevel.vp::plot_01.legend.right.vp::GRID.VP.616::GRID.VP.621.1">
                <g id="GRID.cellGrob.155.1">
                  <g id="plot_01.key.rect.2.2.1">
                    <rect id="plot_01.key.rect.2.2.1.1" x="457.97" y="250.13" width="33.36" height="9.77" opacity="1" fill="rgb(183,159,0)" stroke="none" stroke-opacity="0" fill-opacity="1"/>
                  </g>
                </g>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01..1"/>
      </g>
    </g>
  </g>
</svg> 



```r
require(quantmod)
```

```
## Loading required package: quantmod Loading required package: Defaults
## Loading required package: xts Loading required package: zoo
## 
## Attaching package: 'zoo'
## 
## The following object is masked from 'package:base':
## 
## as.Date, as.Date.numeric
## 
## Loading required package: TTR Version 0.4-0 included new data defaults.
## See ?getSymbols.
```

```r
japanReserves <- getSymbols("TRESEGJPM052N", src = "FRED", auto.assign = FALSE)
```

```
## As of 0.4-0, 'getSymbols' uses env=parent.frame() and auto.assign=TRUE by
## default.
## 
## This behavior will be phased out in 0.5-0 when the call will default to
## use auto.assign=FALSE. getOption("getSymbols.env") and
## getOptions("getSymbols.auto.assign") are now checked for alternate
## defaults
## 
## This message is shown once per session and may be disabled by setting
## options("getSymbols.warning4.0"=FALSE). See ?getSymbol for more details
```

```r

p1 <- xyplot(japanReserves, scales = list(y = list(rot = 1)), lattice.options = theEconomist.opts(), 
    par.settings = theEconomist.theme(box = "transparent"), main = "Japan Foreign Reserves excluding Gold")

p1
grid.export("")$svg
```

```
## Warning: one of more grobs overwritten (grab WILL not be faithful; try
## 'wrap = TRUE')
```

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="504px" height="504px" viewBox="0 0 504 504" version="1.1">
  <metadata xmlns:gridsvg="http://www.stat.auckland.ac.nz/~paul/R/gridSVG/">
    <gridsvg:generator name="gridSVG" version="1.3-0" time="2013-08-05 09:50:00"/>
    <gridsvg:argument name="name" value=""/>
    <gridsvg:argument name="exportCoords" value="none"/>
    <gridsvg:argument name="exportMappings" value="none"/>
    <gridsvg:argument name="exportJS" value="none"/>
    <gridsvg:argument name="res" value="72"/>
    <gridsvg:argument name="prefix" value=""/>
    <gridsvg:argument name="addClasses" value="FALSE"/>
    <gridsvg:argument name="indent" value="TRUE"/>
    <gridsvg:argument name="htmlWrapper" value="FALSE"/>
    <gridsvg:argument name="usePaths" value="vpPaths"/>
    <gridsvg:argument name="uniqueNames" value="TRUE"/>
    <gridsvg:separator name="id.sep" value="."/>
    <gridsvg:separator name="gPath.sep" value="::"/>
    <gridsvg:separator name="vpPath.sep" value="::"/>
  </metadata>
  <g transform="translate(0, 504) scale(1, -1)">
    <g id="gridSVG" fill="none" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="0.75" font-size="12" font-family="Helvetica, Arial, FreeSans, Liberation Sans, Nimbus Sans L, sans-serif" opacity="1" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-opacity="1" fill-opacity="0" font-weight="normal" font-style="normal">
      <defs/>
      <g id="plot_01.background.1">
        <rect id="plot_01.background.1.1" x="0" y="0" width="504" height="504" fill="none" stroke="none" stroke-opacity="0" fill-opacity="0"/>
      </g>
      <g id="plot_01.toplevel.vp.1" font-size="12">
        <g id="plot_01.toplevel.vp::plot_01.main.vp.1">
          <g id="plot_01.main.1">
            <g id="plot_01.main.1.1" transform="translate(14.17, 492.97)" stroke-width="0.1">
              <g id="plot_01.main.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.main.1.1.text" text-anchor="start" opacity="1" stroke="rgb(0,0,0)" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="14.4" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.main.1.1.tspan.1" dy="5.03" x="0">Japan Foreign Reserves excluding Gold</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.xlab.vp.1">
          <g id="plot_01.xlab.1">
            <g id="plot_01.xlab.1.1" transform="translate(242.77, 16.31)" stroke-width="0.1">
              <g id="plot_01.xlab.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.xlab.1.1.text" text-anchor="middle" opacity="1" stroke="rgb(0,0,0)" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="12" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.xlab.1.1.tspan.1" dy="4.31" x="0">Time</tspan>
                </text>
              </g>
            </g>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.figure.vp.1"/>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.1.clipPath">
            <rect x="65.55" y="50.8" width="354.45" height="408.14" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.1" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.1.vp.1.clipPath)"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.1.1.off.vp.1"/>
        <g id="plot_01.toplevel.vp::plot_01.strip.left.1.1.off.vp.1"/>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.off.vp.1">
          <g id="plot_01.ticks.bottom.panel.1.1.1">
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.1" points="84.38,50.8 84.38,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.2" points="147.22,50.8 147.22,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.3" points="210.05,50.8 210.05,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.4" points="272.89,50.8 272.89,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.5" points="335.71,50.8 335.71,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.6" points="398.55,50.8 398.55,45.13" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.7" points="71.83,50.8 71.83,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.8" points="96.96,50.8 96.96,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.9" points="109.52,50.8 109.52,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.10" points="122.09,50.8 122.09,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.11" points="134.65,50.8 134.65,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.12" points="159.78,50.8 159.78,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.13" points="172.36,50.8 172.36,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.14" points="184.91,50.8 184.91,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.15" points="197.49,50.8 197.49,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.16" points="222.62,50.8 222.62,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.17" points="235.18,50.8 235.18,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.18" points="247.75,50.8 247.75,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.19" points="260.31,50.8 260.31,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.20" points="285.44,50.8 285.44,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.21" points="298.02,50.8 298.02,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.22" points="310.58,50.8 310.58,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.23" points="323.15,50.8 323.15,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.24" points="348.28,50.8 348.28,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.25" points="360.84,50.8 360.84,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.26" points="373.42,50.8 373.42,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.27" points="385.97,50.8 385.97,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.ticks.bottom.panel.1.1.1.28" points="411.11,50.8 411.11,47.97" stroke="rgb(0,0,0)" opacity="1" stroke-dasharray="none" stroke-width="0.75" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.ticklabels.bottom.panel.1.1.1">
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.1" transform="translate(84.38, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.1.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.1.tspan.1" dy="7.18" x="0">1960</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.2" transform="translate(147.22, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.2.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.2.tspan.1" dy="7.18" x="0">1970</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.3" transform="translate(210.05, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.3.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.3.tspan.1" dy="7.18" x="0">1980</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.4" transform="translate(272.89, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.4.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.4.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.4.tspan.1" dy="7.18" x="0">1990</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.5" transform="translate(335.71, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.5.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.5.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.5.tspan.1" dy="7.18" x="0">2000</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.6" transform="translate(398.55, 39.47)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.6.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.6.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.6.tspan.1" dy="7.18" x="0">2010</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.7" transform="translate(71.83, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.7.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.7.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.7.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.8" transform="translate(96.96, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.8.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.8.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.8.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.9" transform="translate(109.52, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.9.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.9.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.9.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.10" transform="translate(122.09, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.10.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.10.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.10.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.11" transform="translate(134.65, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.11.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.11.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.11.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.12" transform="translate(159.78, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.12.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.12.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.12.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.13" transform="translate(172.36, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.13.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.13.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.13.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.14" transform="translate(184.91, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.14.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.14.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.14.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.15" transform="translate(197.49, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.15.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.15.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.15.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.16" transform="translate(222.62, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.16.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.16.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.16.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.17" transform="translate(235.18, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.17.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.17.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.17.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.18" transform="translate(247.75, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.18.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.18.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.18.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.19" transform="translate(260.31, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.19.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.19.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.19.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.20" transform="translate(285.44, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.20.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.20.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.20.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.21" transform="translate(298.02, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.21.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.21.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.21.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.22" transform="translate(310.58, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.22.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.22.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.22.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.23" transform="translate(323.15, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.23.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.23.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.23.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.24" transform="translate(348.28, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.24.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.24.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.24.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.25" transform="translate(360.84, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.25.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.25.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.25.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.26" transform="translate(373.42, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.26.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.26.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.26.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.27" transform="translate(385.97, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.27.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.27.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.27.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.bottom.panel.1.1.1.28" transform="translate(411.11, 42.3)" stroke-width="0.1">
              <g id="plot_01.ticklabels.bottom.panel.1.1.1.28.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.bottom.panel.1.1.1.28.text" text-anchor="middle" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.bottom.panel.1.1.1.28.tspan.1" dy="7.18" x="0"> </tspan>
                </text>
              </g>
            </g>
          </g>
          <g id="plot_01.ticklabels.right.panel.1.1.1">
            <g id="plot_01.ticklabels.right.panel.1.1.1.1" transform="translate(425.67, 115.2)" stroke-width="0.1">
              <g id="plot_01.ticklabels.right.panel.1.1.1.1.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.right.panel.1.1.1.1.text" transform="rotate(-1)" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.right.panel.1.1.1.1.tspan.1" dy="3.59" x="0">2.0e+11</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.right.panel.1.1.1.2" transform="translate(425.67, 179.82)" stroke-width="0.1">
              <g id="plot_01.ticklabels.right.panel.1.1.1.2.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.right.panel.1.1.1.2.text" transform="rotate(-1)" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.right.panel.1.1.1.2.tspan.1" dy="3.59" x="0">4.0e+11</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.right.panel.1.1.1.3" transform="translate(425.67, 244.45)" stroke-width="0.1">
              <g id="plot_01.ticklabels.right.panel.1.1.1.3.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.right.panel.1.1.1.3.text" transform="rotate(-1)" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.right.panel.1.1.1.3.tspan.1" dy="3.59" x="0">6.0e+11</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.right.panel.1.1.1.4" transform="translate(425.67, 309.08)" stroke-width="0.1">
              <g id="plot_01.ticklabels.right.panel.1.1.1.4.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.right.panel.1.1.1.4.text" transform="rotate(-1)" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.right.panel.1.1.1.4.tspan.1" dy="3.59" x="0">8.0e+11</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.right.panel.1.1.1.5" transform="translate(425.67, 373.71)" stroke-width="0.1">
              <g id="plot_01.ticklabels.right.panel.1.1.1.5.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.right.panel.1.1.1.5.text" transform="rotate(-1)" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.right.panel.1.1.1.5.tspan.1" dy="3.59" x="0">1.0e+12</tspan>
                </text>
              </g>
            </g>
            <g id="plot_01.ticklabels.right.panel.1.1.1.6" transform="translate(425.67, 438.34)" stroke-width="0.1">
              <g id="plot_01.ticklabels.right.panel.1.1.1.6.scale" transform="scale(1, -1)">
                <text x="0" y="0" id="plot_01.ticklabels.right.panel.1.1.1.6.text" transform="rotate(-1)" text-anchor="start" stroke="rgb(0,0,0)" opacity="1" fill="rgb(0,0,0)" stroke-opacity="1" fill-opacity="1" font-size="9.6" font-weight="normal" font-style="normal">
                  <tspan id="plot_01.ticklabels.right.panel.1.1.1.6.tspan.1" dy="3.59" x="0">1.2e+12</tspan>
                </text>
              </g>
            </g>
          </g>
          <g id="plot_01.abline.h.panel.1.1.1">
            <polyline id="plot_01.abline.h.panel.1.1.1.1" points="65.55,115.2 420,115.2" stroke="rgb(170,170,170)" stroke-dasharray="none" stroke-width="1.31" opacity="1" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.abline.h.panel.1.1.1.2" points="65.55,179.82 420,179.82" stroke="rgb(170,170,170)" stroke-dasharray="none" stroke-width="1.31" opacity="1" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.abline.h.panel.1.1.1.3" points="65.55,244.45 420,244.45" stroke="rgb(170,170,170)" stroke-dasharray="none" stroke-width="1.31" opacity="1" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.abline.h.panel.1.1.1.4" points="65.55,309.08 420,309.08" stroke="rgb(170,170,170)" stroke-dasharray="none" stroke-width="1.31" opacity="1" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.abline.h.panel.1.1.1.5" points="65.55,373.71 420,373.71" stroke="rgb(170,170,170)" stroke-dasharray="none" stroke-width="1.31" opacity="1" stroke-opacity="1" fill="none"/>
            <polyline id="plot_01.abline.h.panel.1.1.1.6" points="65.55,438.34 420,438.34" stroke="rgb(170,170,170)" stroke-dasharray="none" stroke-width="1.31" opacity="1" stroke-opacity="1" fill="none"/>
          </g>
          <g id="plot_01.abline.h.panel.1.1.2">
            <polyline id="plot_01.abline.h.panel.1.1.2.1" points="65.55,50.8 420,50.8" stroke="rgb(0,0,0)" stroke-dasharray="none" stroke-width="1.13" opacity="1" stroke-opacity="1" fill="none"/>
          </g>
        </g>
        <defs>
          <clipPath id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.2.clipPath">
            <rect x="65.55" y="50.8" width="354.45" height="408.14" fill="none" stroke="none"/>
          </clipPath>
        </defs>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.vp.2" clip-path="url(#plot_01.toplevel.vp::plot_01.panel.1.1.vp.2.clipPath)">
          <g id="plot_01.xyplot.lines.group.1.panel.1.1.1">
            <polyline id="plot_01.xyplot.lines.group.1.panel.1.1.1.1" points="65.55,50.95 66.08,50.93 66.56,50.9 67.1,50.89 67.61,50.86 68.15,50.83 68.66,50.81 69.19,50.81 69.73,50.8 70.24,50.81 70.78,50.82 71.29,50.83 71.83,50.83 72.36,50.84 72.84,50.86 73.37,50.81 73.89,50.82 74.42,50.83 74.94,50.84 75.47,50.85 76.01,50.85 76.52,50.86 77.06,50.89 77.57,50.89 78.11,50.84 78.64,50.87 79.12,50.86 79.65,50.87 80.17,50.89 80.7,50.89 81.22,50.9 81.75,50.89 82.29,50.92 82.8,50.93 83.33,50.95 83.85,50.96 84.38,50.96 84.92,50.96 85.42,50.97 85.95,50.98 86.47,50.99 87,51 87.51,51.02 88.05,51.04 88.58,51.06 89.1,51.08 89.63,51.1 90.15,51.12 90.68,51.14 91.21,51.15 91.7,51.17 92.23,51.19 92.74,51.16 93.28,51.15 93.79,51.12 94.33,51.09 94.86,51.06 95.38,51.02 95.91,51.02 96.43,51.01 96.96,51.02 97.49,51.02 97.97,51.04 98.51,51.04 99.02,51.05 99.56,51.06 100.07,51.06 100.61,51.06 101.14,51.09 101.66,51.12 102.19,51.11 102.7,51.13 103.24,51.14 103.77,51.13 104.25,51.13 104.79,51.14 105.3,51.14 105.84,51.15 106.35,51.14 106.88,51.15 107.42,51.15 107.93,51.15 108.47,51.15 108.98,51.14 109.52,51.13 110.05,51.11 110.55,51.12 111.08,51.11 111.6,51.1 112.13,51.1 112.65,51.09 113.18,51.1 113.71,51.1 114.23,51.09 114.76,51.1 115.28,51.12 115.81,51.13 116.35,51.14 116.83,51.14 117.36,51.13 117.88,51.13 118.41,51.12 118.93,51.11 119.46,51.11 119.99,51.11 120.51,51.12 121.04,51.15 121.56,51.16 122.09,51.15 122.62,51.16 123.11,51.16 123.64,51.15 124.16,51.15 124.69,51.16 125.21,51.14 125.74,51.14 126.27,51.14 126.79,51.13 127.32,51.14 127.84,51.15 128.37,51.14 128.9,51.14 129.39,51.15 129.92,51.15 130.43,51.15 130.97,51.14 131.48,51.13 132.02,51.11 132.55,51.12 133.07,51.11 133.6,51.1 134.12,51.11 134.65,51.1 135.18,51.11 135.68,51.1 136.21,51.08 136.73,51.09 137.26,51.1 137.78,51.13 138.31,51.18 138.85,51.22 139.36,51.28 139.9,51.36 140.41,51.39 140.95,51.41 141.48,51.45 141.96,51.49 142.49,51.46 143.01,51.45 143.54,51.46 144.06,51.44 144.59,51.47 145.13,51.51 145.64,51.52 146.17,51.59 146.69,51.61 147.22,51.64 147.76,51.65 148.24,51.73 148.77,51.75 149.29,51.74 149.82,51.73 150.34,51.69 150.87,51.7 151.4,51.69 151.92,51.76 152.45,51.83 152.97,51.96 153.5,52 154.04,52.11 154.52,52.3 155.05,52.33 155.57,52.66 156.1,52.88 156.62,52.98 157.15,54.39 157.68,54.67 158.2,54.9 158.73,55.14 159.25,55.29 159.78,55.49 160.31,55.64 160.81,55.69 161.35,55.65 161.86,55.49 162.4,55.43 162.91,55.44 163.45,55.6 163.98,55.64 164.49,56.06 165.03,56.26 165.54,56.24 166.08,56.08 166.61,56.46 167.09,56.14 167.63,55.72 168.14,55.41 168.68,55.19 169.19,55.18 169.72,55.17 170.26,55.06 170.77,54.82 171.31,54.54 171.82,54.24 172.36,54.02 172.89,54.12 173.37,54.29 173.9,54.39 174.42,54.53 174.95,54.62 175.47,54.55 176,54.45 176.54,54.54 177.05,54.63 177.59,54.72 178.1,54.64 178.64,54.64 179.17,54.78 179.65,54.84 180.18,54.9 180.7,54.97 181.23,54.99 181.75,55.01 182.28,54.84 182.82,54.58 183.33,54.55 183.86,54.48 184.38,54.43 184.91,54.54 185.45,54.8 185.95,54.87 186.48,55.12 187,55.21 187.53,55.27 188.04,55.44 188.58,55.56 189.11,55.62 189.63,55.65 190.16,55.7 190.68,55.66 191.21,55.69 191.74,55.8 192.23,55.85 192.76,55.96 193.27,55.97 193.81,56.01 194.32,56.09 194.86,56.16 195.39,56.19 195.91,56.74 196.44,57.57 196.96,57.79 197.49,57.96 198.02,58.22 198.5,59.81 199.04,59.27 199.55,59.33 200.09,59.2 200.6,59.85 201.14,59.8 201.67,59.81 202.19,59.78 202.72,60.8 203.23,61.04 203.77,61.07 204.3,60.93 204.78,59.68 205.32,58.75 205.83,58.12 206.37,58.37 206.88,58.42 207.41,58.45 207.95,58.5 208.46,57.84 209,56.83 209.51,56.88 210.05,57.1 210.58,57.03 211.08,56.32 211.61,56.46 212.13,57.24 212.66,57.66 213.18,57.71 213.71,57.79 214.24,58.02 214.76,58.34 215.29,58.42 215.81,58.53 216.34,58.94 216.88,59.02 217.36,59.13 217.89,59.27 218.41,59.38 218.94,59.44 219.46,59.34 219.99,59.39 220.52,59.5 221.04,59.65 221.57,59.8 222.09,59.68 222.62,59.63 223.15,59.59 223.64,59.33 224.17,59.24 224.69,59.16 225.22,58.79 225.73,58.84 226.27,58.46 226.8,58.33 227.32,57.95 227.85,58 228.37,58.11 228.9,58.21 229.43,58.3 229.92,58.38 230.45,58.5 230.96,58.61 231.5,58.67 232.01,58.72 232.55,58.54 233.08,58.63 233.6,58.64 234.13,58.59 234.65,58.52 235.18,58.57 235.71,58.68 236.21,58.72 236.74,58.78 237.26,58.8 237.79,58.75 238.31,58.72 238.84,58.81 239.38,58.84 239.89,58.92 240.43,59.04 240.94,59.11 241.48,59.19 242.01,59.09 242.49,59.19 243.02,59.29 243.54,59.43 244.07,59.5 244.59,59.67 245.12,59.79 245.66,59.5 246.17,59.12 246.7,59.12 247.22,59.2 247.75,59.35 248.29,59.55 248.77,59.65 249.3,60.68 249.82,61.12 250.35,61.57 250.87,63 251.4,63.92 251.93,63.99 252.45,64.05 252.98,64.15 253.5,64.22 254.03,67.2 254.57,67.28 255.05,69.4 255.58,72.7 256.1,72.8 256.63,72.88 257.15,73.04 257.68,73.31 258.21,73.76 258.73,74.05 259.26,75.65 259.78,76.73 260.31,77.36 260.84,77.48 261.34,77.79 261.88,78.41 262.39,78.53 262.93,78.65 263.44,79.03 263.98,79.46 264.51,79.74 265.02,80.16 265.56,81.65 266.07,81.82 266.61,82 267.14,82.19 267.62,82.37 268.16,82.69 268.67,81.2 269.21,79.18 269.72,78.97 270.25,78.81 270.79,78.08 271.3,77.49 271.84,77.63 272.35,77.7 272.89,76.99 273.42,76.56 273.9,74.33 274.43,74.26 274.95,74.43 275.48,74.53 276,74.91 276.53,75.15 277.07,75.24 277.58,75.53 278.12,75.69 278.63,75.93 279.17,76.12 279.7,76.27 280.18,74.09 280.71,73.45 281.23,73.53 281.76,73.42 282.28,73.31 282.81,73.11 283.35,73.14 283.86,73.23 284.39,73.47 284.91,73.85 285.44,73.74 285.98,73.56 286.48,73.56 287.01,73.53 287.53,73.52 288.06,73.35 288.57,73.53 289.11,73.91 289.64,73.95 290.16,73.62 290.69,73.65 291.21,73.71 291.74,73.89 292.27,73.88 292.75,74.17 293.29,76.41 293.8,77.23 294.34,79.46 294.85,79.5 295.39,82.35 295.92,82.49 296.44,82.3 296.97,82.36 297.49,82.4 298.02,82.53 298.55,83.34 299.03,84.42 299.57,85.34 300.08,86.09 300.62,87.59 301.13,88.31 301.67,89 302.2,89.56 302.72,90.55 303.25,91.02 303.76,91.24 304.3,91.58 304.83,91.81 305.31,96.95 305.85,100.79 306.36,100.99 306.9,101.71 307.41,102.14 307.94,104.71 308.48,108.97 308.99,109.3 309.53,109.41 310.04,109.78 310.58,109.75 311.11,115.25 311.61,116.07 312.14,116.65 312.66,117.51 313.19,118.1 313.71,118.75 314.24,119.33 314.77,119.66 315.29,120.04 315.82,120.32 316.34,120.58 316.87,120.35 317.41,120.72 317.89,121.07 318.42,121.25 318.94,121.85 319.47,122.02 319.99,122.01 320.52,122.54 321.05,123.08 321.57,123.91 322.1,123.99 322.62,121.55 323.15,121.78 323.68,122.3 324.17,122.45 324.7,116.69 325.22,117.08 325.75,116.73 326.26,117.33 326.8,117.92 327.33,118.8 327.85,119.41 328.38,119.64 328.9,120.2 329.43,122.22 329.96,121.98 330.45,122.1 330.98,122.28 331.49,122.47 332.03,129.82 332.54,134.43 333.08,134.64 333.61,138.2 334.13,138.33 334.66,138.07 335.18,143.28 335.71,144.93 336.24,145.36 336.74,148.92 337.27,157.82 337.79,158.67 338.32,159.75 338.84,159.82 339.37,159.81 339.91,161.16 340.42,161.26 340.96,163.01 341.47,165.25 342,166.16 342.54,165.98 343.02,165.33 343.55,165.65 344.07,165.39 344.6,165.61 345.12,167.27 345.65,168.68 346.19,176.53 346.7,179.45 347.23,178.89 347.75,178.26 348.28,177.86 348.82,178.59 349.3,177.92 349.83,179.54 350.35,183.59 350.88,192.22 351.4,194.56 351.93,195.46 352.46,196.87 352.98,197.01 353.51,196.83 354.03,199.6 354.56,202.3 355.1,204.61 355.58,208.24 356.11,209.28 356.63,223.19 357.16,224.13 357.68,227.68 358.21,226.96 358.74,242.94 359.26,249.87 359.79,255.71 360.31,264.9 360.84,286.92 361.37,298.46 361.87,314.3 362.41,310.83 362.92,311.4 363.46,311.73 363.97,312.17 364.51,314.88 365.04,315.79 365.55,317.94 366.09,318.43 366.6,320.03 367.14,318.97 367.67,318.73 368.15,317.87 368.69,319.71 369.2,319.51 369.74,319.67 370.25,318.39 370.78,321.07 371.32,319.4 371.83,318.84 372.37,319.12 372.88,320.16 373.42,321.25 373.95,320.84 374.43,321.27 374.96,323.43 375.48,324.61 376.01,325.17 376.53,327.3 377.06,329.57 377.6,330.58 378.11,331.93 378.65,335.27 379.16,334.83 379.7,334.73 380.23,337.75 380.71,339.03 381.24,341.06 381.76,339.75 382.29,340.61 382.81,343.77 383.34,346.44 383.88,350.22 384.39,352.72 384.92,357.85 385.44,358.45 385.97,365.09 386.51,368.56 387.01,371.32 387.54,368.02 388.06,365.69 388.59,366.81 389.1,367.92 389.64,366.03 390.17,365.35 390.69,360.7 391.22,368.15 391.74,376.74 392.27,369.96 392.8,369.16 393.28,372.42 393.82,370.39 394.33,373.71 394.87,372.48 395.38,373.57 395.92,379.79 396.45,382.79 396.97,383.79 397.5,388.18 398.02,380.89 398.55,382.28 399.08,381.4 399.56,378.64 400.1,379.48 400.61,377.46 401.15,380.05 401.66,384.94 402.2,386.47 402.73,398.73 403.25,401.17 403.78,395.36 404.29,393.58 404.83,393.2 405.36,392.05 405.84,399.76 406.38,405.3 406.89,406.58 407.43,406.27 407.94,409.51 408.47,429.9 409.01,425.65 409.52,427.84 410.06,458.31 410.57,457.14 411.11,458.94 411.64,457.51 412.14,453.78 412.67,454.13 413.19,451.05 413.72,448.41 414.24,448.95 414.77,448.89 415.3,449.09 415.82,448.62 416.35,447.5 416.87,447.11 417.4,446.84 417.94,444.7 418.42,443.18 418.95,445.38 419.47,443.47 420,441.37" stroke-dasharray="none" stroke="rgb(0,82,109)" stroke-width="1.88" opacity="1" stroke-opacity="1" fill="none"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01.panel.1.1.off.vp.2">
          <g id="plot_01.border.panel.1.1.1">
            <rect id="plot_01.border.panel.1.1.1.1" x="65.55" y="50.8" width="354.45" height="408.14" stroke="none" stroke-dasharray="none" stroke-width="0.75" opacity="1" fill="none" stroke-opacity="0" fill-opacity="0"/>
          </g>
        </g>
        <g id="plot_01.toplevel.vp::plot_01..1"/>
      </g>
    </g>
  </g>
</svg> 

