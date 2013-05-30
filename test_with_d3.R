require(latticeExtra)
require(rjson)

require(devtools)
setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg/pkg")
load_all()
setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg_tests")


x11( width = 5, height = 10 )
#will need to work through this behavior
#trellis object groups might be in a different order than panel.args
#either fix this in data each time or add a test in the export of the trellis object
barley$year <- factor(barley$year,levels = c("1931","1932"))

p1 <- dotplot(
  variety ~ yield | site,
  data = barley,
  groups = year,
  pch = 19,
  key = simpleKey(levels(barley$year), space = "right"),
  xlab = "Barley Yield (bushels/acre) ",
  aspect=0.5, layout = c(1,6),
  ylab=NULL,
  scales = list(
    x = list(
      tck = c(1,0)
    )
  )
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
#        rapply(
#        data,
#        f=function(x){
#          return(
#            if(is.factor(x)){
#              factor(gsub(x, pattern="[.]", replacement=""))
#            } else x
#          )
#        },
#        how="replace"
#      )
    )
  )
}


setwd("c:/users/kent.tleavell_nt/dropbox/development/r/gridsvg_tests")
p1



htmlbegin <- '
<!DOCTYPE html>
<meta charset="utf-8">
<html>
  <head>
    <style>
    </style>
    <script src = "js/d3.v3.js"></script>
  </head>

  <body>
'

exportlist <- grid.export( "d3test.svg", addClasses = TRUE )

data <- toJSON( getlist( p1 ) )

jscode <- c(
  '
      <script>
        var data = 
    ',
    data
)

htmlend <- '</script>\n</body>\n<html>'


htmlfile <- file("d3test_fromR.html", "wt")
writeLines(
  con = htmlfile,
  text = paste0(c(
    htmlbegin,
    saveXML(exportlist[[1]]),
    jscode,
    readLines("d3testcode.js"),
    htmlend
  ))
)
close(htmlfile)