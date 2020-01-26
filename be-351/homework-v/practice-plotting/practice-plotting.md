Timothy Miller  
Homework V  
27 Oct 2011  

## Part One: Plotting Practice
### 4.1 
Explore the possibilities for different kinds of line and point plots.  
Vary the plot symbol, line type, line width, and colour.  
```
x<-rnorm(25)
plot(sort(x),type = "p",pch=22,col="green")
plot(sort(x),type = "l",lty = 2, lwd = 10, col="blue")
plot(sort(x),type = "p",pch=2,col="red")
plot(sort(x),type = "l",lty = 6, lwd = 9, col="yellow")
```

### 4.2
If you make a plot like ```plot(rnorm(10),type="o")``` with overplotted
lines and points, the lines will be visible inside the plotting symbols.  
How can this be avoided?
```
plot(rnorm(10),type="o")
plot(rnorm(10),type="o", pch=22, col="red")
plot(rnorm(10),type="o", pch=22) #, bg="red")
plot(rnorm(10),type="o", pch=22, bg="yellow")
plot(rnorm(10),type="o", pch=21,bg="white")
```
- ```pch``` creates an object at each point. 
- ```col``` turns the whole graph that color.
- ```bg``` simply colors in the object.
- Coloring the object white will create the illusion that the line does not pass through it. 

### 4.3 
How can you overlay two ```qqnorm``` plots in the same plotting area?  
What goes wrong if you try to generate the plot using type="l", and how do you avoid that?
```
x1 <- rnorm(20)
x2 <- rnorm(10)+1
q1 <- qqnorm(x1, plot.it=F)
q2 <- qqnorm(x2, plot.it=F)
xr <- range(q1$x, q2$x)
yr <- range(q1$y, q2$y)
qqnorm(x1, xlim=xr, ylim=yr)
points(q2, col="red")
```

### 4.4 
Plot a histogram for the react data set.  
Since these data are highly discretized, the histogram will be biased. Why?  
*You may want to try ```truehist``` from the ``MASS`` package as a replacement.*
- The histogram will be biased because R will automically set the axes properties
to values that are efficient but ultimately misrepresent the data.

```
library(MASS)
library(ISwR)
data(react)
hist(react)
truehist(react,h=1,x0=.5)
```

### 4.5 
Generate a sample vector z of five random numbers from the uniform distribution. 
Then, plot quantile(z,x) as a function of x *(use curve, for instance).*
```
z <- runif(5)
curve(quantile(z,x), from=0, to=1)
```
