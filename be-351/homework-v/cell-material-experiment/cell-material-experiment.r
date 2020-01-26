# Part Two: Cell Material Experiment
library(gplots)
library(ISwR)

# Setup
celldata <- read.csv("cell-results.csv")
attach(celldata)

# One:
names(celldata)
boxplot(alive~cond, main = "Number of Alive Cells on Each Biomaterial", ylab="Number of Cells", xlab ="substrate")

# Two:
#se = s/(n^(1/2))
percent <- dead/(dead+alive)
cell.mean <-tapply(percent, cond, mean)
cell.sd <- tapply(percent, cond, sd)
cell.l <- tapply(percent, cond, length)
se.dead <- cell.sd/(cell.l^(1/2))
percent
se.dead

#Question Three

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

# Results for Questions Four through Seven. 
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
