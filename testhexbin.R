library(hexbin)
library(gridSVG)

data(casualties,package = "ggsubplot")
#calculate our hexbin object
hb <- with(casualties,hexbin(y=lat,x=lon, xbins =20, IDs=TRUE))
plot(hb,style="lattice")

setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridSVG_tests")
grid.export("testhexbin.svg",addClasses=TRUE)

hb@count = zoo::na.fill(hexTapply(hb,!casualties$fatal),0)
hb@count = zoo::na.fill(hexTapply(hb,casualties$fatal),0)
hb@count = floor(hb@count - zoo::na.fill(hexTapply(hb,!casualties$fatal),0)*100)
plot(hb)
grid.export("testhexbin_fatalcount.svg",addClasses=TRUE)


h2 <- hexbinplot(lat~lon|factor(fatal)+factor(year),data=casualties,xbins=10)
grid.export("testhexbin_strips.svg",addClasses=TRUE)


data(movies, package="ggplot2")
hb2 <- with( movies, hexbin (y = rating, x = log(length), xbins =50, IDs = TRUE ) )
plot( hb2 )
plot( smooth.hexbin( hb2 ) )
hexbinplot(  
	rating ~ log( length ) | factor( floor( year / 10 )),
	data = movies,
	panel = function(x, y, ...){
        panel.hexbinplot(x, y, # style = "lattice", #"nested.lattice", 
                      type = c("g", "r"),col='blue', ...)
    }
)
