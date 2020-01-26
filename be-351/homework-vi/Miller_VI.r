library(ISwR)

#5.1
print("5.1")
qqnorm(react)
t.test(react)

#5.2
print("5.2")
attach(vitcap)

tapply(age, group, mean)
tapply(vital.capacity, group, mean)

t.test(vital.capacity ~ group, conf=0.99)
t.test(age ~ group, conf = 0.99)

detach(vitcap)

#5.3
print("5.3")
attach(vitcap)
wilcox.test(react)
wilcox.test(vital.capacity~group)
detach(vitcap)

#5.4
print("5.4")
attach(intake) 
opar <- par(mfrow=c(2,2))
plot(post~pre) 
abline(0,1)
plot((post+pre)/2, post - pre,ylim=range(0,post-pre))
abline(h=0)
hist(post-pre)
qqnorm(post-pre)
par(opar)

detach(intake)

#5.5
print("5.5")
length(react)
334/2
shapiro.test(react)
shapiro.test(react[-c(166,167)])
shapiro.test(react[-c(40,200)])
shapiro.test(react[-c(50,185)])
shapiro.test(react[-c(2,343,66)])
shapiro.test(react[-c(1,344)])
qqnorm(react[-c(1,334)])
qqnorm(react)

#5.6
print("5.6")
# Exploring different analyses and code
# ashina
# grp
# vas.active
# vas.plac
# t.test(vas.active~grp)
# t.test(vas.plac~grp)
# t.test(vas.active, vas.plac)
# t.test(vas.active, vas.plac, paired=TRUE)
# t.test(vas.plac, vas.active, paired=TRUE)
# t.test((vas.active-vas.plac)[grp==1],(vas.plac-vas.active)[grp==2])
# t.test((vas.active-vas.plac)[grp==2],(vas.plac-vas.active)[grp==1])
# vas.active-vas.plac
# t.test((vas.active-vas.plac)[grp==1],(vas.plac-vas.active)[grp==2])
# t.test((vas.plac-vas.active)[grp==1],(vas.plac-vas.active)[grp==2])
# t.test((vas.active-vas.plac),(vas.plac-vas.active))
# (vas.active-vas.plac)[grp==1]
# (vas.plac-vas.active)[grp==1]
# (vas.active-vas.plac)[grp==2]
# (vas.plac-vas.active)[grp==2]

# Answer
attach(ashina)
# Test the difference in the means of vas.active and vas.plac.
t.test(vas.active, vas.plac, paired=TRUE)
# Test intra-individual differences
t.test((vas.active-vas.plac)[grp==2],(vas.plac-vas.active)[grp==1])
detach(ashina)

#5.7 
print("5.7")
# Exploring different analyses and code
# t.test(rnorm(25))
# t.test(rt(25,df=2))
# t.test(rt(25,df=5))$p.value
# t.test(rt(25,df=2))$t
# t.test(rt(25,df=2))$df
# t.test(rt(25,df=2))$mean
# t.test(rexp(25), mu=1)$p.value # repeat 10x
# rexp()
# x <- 0
# replicate(10, x + 1 )
# x
# y=0
# replicate(10, y =+ 1)
# y 
# t.test(rnorm(25))$p.value 
# t.test(rt(25,df=2))$p.value 
# t.test(rexp(25), mu=1)$p.value 
# x <- 0
# replicate(10, x + 1 )
# x
# y=0
# replicate(10, y =+ 1)
# y

# Answer
reps<-10
n<-25
pnts<-2500

replicate(reps, t.test(rnorm(n))$p.value)
replicate(reps,t.test(rt(n,df=2))$p.value)
replicate(reps,t.test(rexp(n), mu=1)$p.value)

x <- replicate(pnts, t.test(rexp(n), mu=1)$p.value)
qqplot(sort(x),ppoints(pnts),type="l",log="xy")
