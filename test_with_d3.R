require(latticeExtra)
require(rjson)

require(devtools)
setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg/pkg")
load_all()

p1 <- dotplot(
  variety ~ yield | site,
  data = barley,
  groups = year,
  key = simpleKey(levels(barley$year), space = "right"),
  xlab = "Barley Yield (bushels/acre) ",
  aspect=0.5, layout = c(1,6),
  ylab=NULL
)

#set up a function to pull the groups
#which lattice calls subscripts
#use with lapply
#l is the 
getgroup <- function(l,p) {
  return(p$panel.args.common$groups[l$subscripts])
}

#set up a function to get the data and add groups
#in one list so we can pass as json
#accepts a trellis object as p
getlist <- function(p) {
  data <- p$panel.args
  
  #use the getgroup function to get groups
  #lattice places the groups in subscripts
  #in the panel.args.common list
  groups <- lapply(
    data,
    FUN=getgroup,
    p=p
  )
  
  for ( i in 1:length(data) ) {
    data[[i]]$groups <- groups[[i]]
  }
  
  names(data) <- unlist(p$condlevels)
  
  return(
    list(
      strips = p$condlevels,
      groups = unique(unlist(groups)),
      data = data
    )
  )
}

setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg_tests")
p1
grid.export( "d3test.svg", addClasses = TRUE )

toJSON( getlist( p1 ) )