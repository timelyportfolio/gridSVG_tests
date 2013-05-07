
htmlfile <- file("index.html", open="w")

htmlstart <- 
  "<html>
  <head></head>
  <body>
  <h1>Some gridSVG tests</h1>"
htmlend <- 
  "</body>
  </html>"
writeLines(htmlstart, con = htmlfile )

filelist <- list.files(pattern = ".svg")
for ( i in 1 : length(filelist) ) {
  embedtext <- paste0(
    "<embed src = '" ,
    filelist[i],
    "' type='image/svg+xml'></embed>")
  writeLines(embedtext, con = htmlfile)
}
writeLines(htmlend, con = htmlfile)

close(htmlfile)