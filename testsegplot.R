#documentation of seqplot

#markers don't show on 5

testList <- list()

testList[[1]] <- segplot(factor(1:10) ~ rnorm(10) + rnorm(10), level = runif(10))

data(USCancerRates)

testList[[2]] <- segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"))

testList[[3]] <- segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"),
        draw.bands = FALSE, centers = rate.male)

testList[[4]] <- segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"),
        level = rate.female, col.regions = terrain.colors)

testList[[5]] <- segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"),
        draw.bands = FALSE, centers = rate.male, 
        segments.fun = panel.arrows, ends = "both", 
        angle = 90, length = 1, unit = "mm")


for(i in 1:length(testList)) {
  print(testList[[i]])
  grid.export(paste0("testsegplot",i,".svg"))
}