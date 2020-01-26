

##
print('Question 6.')
#Import and prepare data
seal.dat <- read.csv("seal-weight.csv")
names(seal.dat)
attach(seal.dat)
summary(seal.dat)

#Visualize data
plot(Body.weight.kg.~Heart.weight.g.)

#Determine significance of correlation
cor.test(Body.weight.kg.,Heart.weight.g.)#$p.value
#With a p-value less than 2.2 x 10^-16, the correlation is significant

#Create linear model of data
model.seal <- lm(Body.weight.kg.~Heart.weight.g.)
summary(model.seal)


#Check y values and error values are independent
plot(resid(model.seal))
hist(resid(model.seal),xlab = "residuals", main = "Histogram of residuals")

#Check homogeneity of variance
plot(resid(model.seal),Heart.weight.g.)

#Determine correlation
cor(Body.weight.kg.,Heart.weight.g.)

#Check for normal distribtion of error
qqnorm(Body.weight.kg.)
qqnorm(Heart.weight.g.)

#Run Diagnostics
ls.diag(model.seal)

#Linear Model
model.seal
summary(model.seal)
fitted(model.seal)

#Visualize linear model
plot(Body.weight.kg.~ Heart.weight.g.);
abline(model.seal);

t.test(Body.weight.kg.,Heart.weight.g.)
#95 percent confidence interval:
# -355.5802 -167.1131 

#Detach data
detach(seal.dat)
