#PART ONE
#4.1 
#Explore the possibilities for different kinds of line and point plots.
#Vary the plot symbol, line type, line width, and colour.
x<-rnorm(25)
plot(sort(x),type = "p",pch=22,col="green")
plot(sort(x),type = "l",lty = 2, lwd = 10, col="blue")
plot(sort(x),type = "p",pch=2,col="red")
plot(sort(x),type = "l",lty = 6, lwd = 9, col="yellow")

#4.2
#If you make a plot like plot(rnorm(10),type="o") with overplotted
#lines and points, the lines will be visible inside the plotting
#symbols. How can this be avoided?
plot(rnorm(10),type="o")
plot(rnorm(10),type="o", pch=22, col="red")
plot(rnorm(10),type="o", pch=22) #, bg="red")
plot(rnorm(10),type="o", pch=22, bg="yellow")
plot(rnorm(10),type="o", pch=21,bg="white")
#Using the pch argument creates an object at each point. 
#While the col argument will turn the whole graph that color,
#using the bg argument will simply color in the object. Coloring
#the object white will create the illusion that the line does not
#pass through it. 

#4.3 
#How can you overlay two qqnorm plots in the same plotting area?
#What goes wrong if you try to generate the plot using type="l", and
#how do you avoid that?
x1 <- rnorm(20)
x2 <- rnorm(10)+1
q1 <- qqnorm(x1, plot.it=F)
q2 <- qqnorm(x2, plot.it=F)
xr <- range(q1$x, q2$x)
yr <- range(q1$y, q2$y)
qqnorm(x1, xlim=xr, ylim=yr)
points(q2, col="red")

#4.4 
#Plot a histogram for the react data set. Since these data are highly
#discretized, the histogram will be biased. Why? You may want to try
#truehist from the MASS package as a replacement.

#The histogram will be biased because R will automically set the axes properties
#to values that are efficient but ultimately misrepresent the data. 

library(MASS)
library(ISwR)
data(react)
hist(react)
truehist(react,h=1,x0=.5)

#4.5 
#Generate a sample vector z of five random numbers from the uniform
#distribution, and plot quantile(z,x) as a function of x (use
#curve, for instance).
z <- runif(5)
curve(quantile(z,x), from=0, to=1)

#PART TWO
#Question One:
#Produce a boxplot of the lab data showing the number of cells alive on each of the
#substrates.
library(gplots)
library(ISwR)

celldata <- read.csv("C:/Users/tm/Documents/BE-351-R/CellResults.csv")
attach(celldata)
names(celldata)
boxplot(alive~cond, main = "Number of Alive Cells on Each Biomaterial",ylab="Number of Cells", xlab ="substrate")


#Question Two:
#Compute the percent of cells dead on each of the substrates along with the standard
#error.

#se = s/(n^(1/2))

percent <- dead/(dead+alive)
cell.mean <-tapply(percent,cond,mean)
cell.sd <- tapply(percent,cond, sd)
cell.l <- tapply(percent,cond, length)

se.dead<- cell.sd/(cell.l^(1/2))

#QUESTION TWO ANSWER:
percent
se.dead

#Question Three
#Produce a barplot showing the percent of cells dead on each of the substrates along
#with standard error error bars.

stderr <- se.dead

barplot2(cell.mean, beside = FALSE, 
   col = c("gray40"),
   legend = c("percent dead"),
   main = "Percent Dead on Each Substrate (with standard errors)", font.main = 3,
   cex.names = 1.2,
   plot.ci = TRUE, 
   ci.l = cell.mean - stderr, 
   ci.u = cell.mean + stderr, 
        plot.grid = FALSE,
        xlab = "Substrate", ylab = "Percent Dead")

#Raw data to which questions four through seven refer. 
al.a<-celldata[cond=="al",1]
brass.a<-celldata[cond=="brass",1]
orig.a<-celldata[cond=="original",1]
ss.a<-celldata[cond=="ss",1]
tcp.a<-celldata[cond=="tcp",1]
teflon.a<-celldata[cond=="teflon",1]

summary(al.a)
summary(brass.a)
summary(orig.a)
summary(ss.a)
summary(tcp.a)
summary(teflon.a)


t.test(al.a,brass.a)
t.test(al.a,orig.a)
t.test(al.a,ss.a)
t.test(al.a,tcp.a)
t.test(al.a,teflon.a)
t.test(brass.a,orig.a)
t.test(brass.a,ss.a)
t.test(brass.a,tcp.a)
t.test(brass.a,teflon.a)
t.test(orig.a,ss.a)
t.test(orig.a,tcp.a)
t.test(orig.a,teflon.a)
t.test(tcp.a,teflon.a)

cell.mean*100


#Question Four:
#Identify which substrates facilitated cellular attachment?

#QUESTION FOUR ANSWER
#It is difficult to infer from a data taken over a short period of time which
#materials will support long term growth. For this reason, the term 'facilitated'
#has been interpreted to ask which materials had the highest average number of cells 
#alive. In this data set, tissue culture plastic had both the highest mean and median, 
#with a mean of 312.4 and median of 306.0 cells.Any other material whose mean has 
#no significant difference from tcp is also considered to facilitate cell growth. 
#The only material to fit this criteria is the original plating with a p-value of .89.

#Question Five:
#Identify which substrates substrates prevented cellular attachment?

#QUESTION FIVE ANSWER
#The substrate with the lowest mean number of cells alive and any substrate
#whose mean had no significant difference were considered to prevent cellular
#attachment. The substrate with the lowest mean was teflon, with a mean of 24.2. 
#Brass, with a p-value of .3 had no significant difference in its mean.  


#Question Six
#Which substrates resulted in a large proportion of cell death?

#QUESTION SIX ANSWER
#Brass and teflon had the highest proportions of cell death with 
#36.0% and 37.0% dead, respectively


#Question Seven

#QUESTION SEVEN ANSWER
#Which substrates resulted in a small proportion of cell death?
#The original plating and tcp had the lowest proportions of cell death with 1.5% and 
#3.0%, respectively.   


#Question Eight
#Explain the results of the cell viability lab using your knowledge of cellular interactions
#with substrates and the details of the experiment that was performed.

#QUESTION EIGHT ANSWER
#Each material either facilitated or prevented cell growth because of its surface 
#and chemical compositions. The tissue culture plastic (tcp) most facilitated 
#cell growth. Tcp�s performance was likely due to a plating which is biomimetically 
#designed to encourage cell adhesion. Brass and Teflon most prevented cell growth. 
#Brass� poor performance was most likely due to its composition of zinc and copper. 
#Ions from copper disrupt the natural potential difference across the cell membrane 
#and weaken it. Teflon�s poor performance was most likely due to its fluorine 
#composition and resulting hydrophobic properties. This hydrophobic quality reduces 
#the strength of London Dispersion forces and prevents cell attachment. Aluminum did 
#a good job of facilitating cell growth, relative to brass and Teflon. However, this 
#is most likely due to the short duration of the experiment.  Over a long period of time,
#aluminum will become cytotoxic to cells and suppress necessary ion release, 
#within cells. This will lead to a high mortality rate.  Finally, stainless steel 
#performed moderately well. This performance is sustainable because of its properties 
#as an alloy. This artificial composition prevents corrosion and release of toxic ions 
#which may disrupt cell function. 




