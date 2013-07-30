require(quantmod)
require(rCharts)
#now get the US bonds from FRED
USbondssymbols <- paste0("DGS",c(1,2,3,5,7,10,20,30))

ust.xts <- xts()
for (i in 1:length( USbondssymbols ) ) {
  ust.xts <- merge( 
    ust.xts,
    getSymbols( 
      USbondssymbols[i], auto.assign = FALSE,src = "FRED"
    )
  )
}
xtsMelt <- function(data) {
  require(reshape2)
  
  #translate xts to time series to json with date and data
  #for this behavior will be more generic than the original
  #data will not be transformed, so template.rmd will be changed to reflect
  
  
  #convert to data frame
  data.df <- data.frame(cbind(format(index(data),"%Y-%m-%d"),coredata(data)))
  colnames(data.df)[1] = "date"
  data.melt <- melt(data.df,id.vars=1,stringsAsFactors=FALSE)
  colnames(data.melt) <- c("date","indexname","value")
  #remove periods from indexnames to prevent javascript confusion
  #these . usually come from spaces in the colnames when melted
  data.melt[,"indexname"] <- apply(matrix(data.melt[,"indexname"]),2,gsub,pattern="[.]",replacement="")
  return(data.melt)
  #return(df2json(na.omit(data.melt)))
}

ust.melt <- na.omit( xtsMelt( ust.xts["2012::",] ) )

ust.melt$date <- as.Date(ust.melt$date)
ust.melt$value <- as.numeric(ust.melt$value)
ust.melt$indexname <- factor(
  ust.melt$indexname, levels = colnames(ust.xts)
)
ust.melt$maturity <- as.numeric(
  substr(
    ust.melt$indexname, 4, length( ust.melt$indexname ) - 4
  )
)
ust.melt$country <- rep( "US", nrow( ust.melt ))

require(latticeExtra)

#set up height and width
x11( width = 10, height = 6 )

p1 <- xyplot(
  value ~ date | indexname,
  groups = indexname,
  data =  ust.melt,
  type = "l",
  scales = list(
    x = list(
      at = pretty(ust.melt$date,n=3)[c(1,3)],
      format = "%b %Y"
    )),
  layout = c(8,1)
)
p1

require(rjson)
require(gridSVG)

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

exportlist <- grid.export( "", addClasses = TRUE )

data <- rjson::toJSON( getlist( p1 ) )

jscode <- c(
  '
  <script>
  var data = 
  ',
  data
)

htmlend <- '</script>\n</body>\n<html>'


htmlfile <- file("d3test_fromR_multline.html", "wt")
writeLines(
  con = htmlfile,
  text = paste0(c(
    htmlbegin,
    saveXML(exportlist[[1]]),
    jscode,
    readLines("d3mult_line.js"),
    htmlend
  ))
)
close(htmlfile)
