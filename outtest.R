library(plotrix)
setwd("~/Documents/esof_522/project")
out <- read.csv("out.csv")

scaled_p50 <- data.frame(
  commit = out$commit,
  cyclo = rescale(out$cyclo_p50, 0:1),
  abstract = rescale(out$abstract_p50, 0:1),
  npath = rescale(out$npath_p50, 0:1),
  fanout = rescale(out$fanout_p50, 0:1)
)

scaled_p95 <- data.frame(
  commit = out$commit,
  cyclo = rescale(out$cyclo_p95, 0:1),
  abstract = rescale(out$abstract_p95, 0:1),
  npath = rescale(out$npath_p95, 0:1),
  fanout = rescale(out$fanout_p5, 0:1)
)

#plot(range(scaled$commit), range(0:1), type='n')
#lines(scaled$commit, scaled_p50$cyclo, col="red")
#lines(scaled$commit, scaled_p50$npath, col="blue")
#lines(scaled$commit, scaled_p50$abstract, col="green")
#lines(scaled$commit, scaled_p50$fanout, col="purple")