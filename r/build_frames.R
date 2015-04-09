library(plotrix)
setwd("~/Documents/esof_522/project")
out <- read.csv("out.csv")

scaled <- data.frame(
  time = out$time,
  commit = out$commit,
  cyclo = rescale(out$cyclo, 0:1),
  abstract = rescale(out$abstract, 0:1),
  npath = rescale(out$npath, 0:1),
  fanout = rescale(out$fanout, 0:1)
)

#plot(range(scaled$commit), range(0:1), type='n')
#lines(scaled$commit, scaled$cyclo, col="red")
#lines(scaled$commit, scaled$npath, col="blue")
#lines(scaled$commit, scaled$abstract, col="green")
#lines(scaled$commit, scaled$fanout, col="purple")