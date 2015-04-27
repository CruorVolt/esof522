linetype = c(1:4)
colors = c("red", "blue", "purple", "green")

plot(smooth_cyclo, 
     lty=linetype[1], 
     type='l', 
     col=colors[1], 
     xlab='Timestamp', 
     ylab='Flags')
title(main="OKHTTP Quality Measures")
lines(smooth_npath, 
      lty=linetype[1], 
      col=colors[2])
lines(smooth_abstract, 
      lty=linetype[1], 
      col=colors[3])
lines(smooth_fanout, 
      lty=linetype[1], 
      col=colors[4])
legend("topleft", 
  c("cyclomatic complexity", "npath complexity", "data abstraction coupling", "class fanout"), 
  lty=1,
  col=colors
)