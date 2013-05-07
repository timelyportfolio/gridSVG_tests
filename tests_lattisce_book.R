require(XML)
require(latticeExtra)

parsed <- htmlParse(
  "http://lmdvr.r-forge.r-project.org/figures/figures.html"
)

#now run tests with lattice examples

#get all code Listings
codeListing <- xpathSApply(
  parsed,
  '//div[@class="codeListing"]/text() | 
  //div[@class="codeListingHidden"]/text()',
  xmlValue)

#unfortunately codeListings are not as well structured as I would like
#many examples will not work
#assignments are stripped for some reason through the parse process
#for example tp1.oats <- ... becomes tp1.oats
for (i in 1:length(codeListing)) {
  #ERROR HANDLING
  possibleError <- tryCatch(
    eval(
      parse(
        text = codeListing[i]
      ),
      environment()
    ),
    error=function(e) e
  )
  print(possibleError)
  
  if(inherits(possibleError, "error")) next
  
  if(length(grid.ls(flatten=FALSE,print=FALSE)) > 1){
    grid.export(paste0("example",i,".svg"))      
    dev.off()
  }
}  #end for
