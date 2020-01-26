#Part One: Plotting Practice
#4.1 
# Run listed commands in shell

#4.2
# Run listed commands in shell

#4.3 
x1 <- rnorm(20)
x2 <- rnorm(10)+1
q1 <- qqnorm(x1, plot.it=F)
q2 <- qqnorm(x2, plot.it=F)
xr <- range(q1$x, q2$x)
yr <- range(q1$y, q2$y)
qqnorm(x1, xlim=xr, ylim=yr)
points(q2, col="red")

#4.4 
library(MASS)
library(ISwR)
data(react)
hist(react)
truehist(react, h=1, x0=.5)

#4.5 
z <- runif(5)
curve(quantile(z,x), from=0, to=1)
