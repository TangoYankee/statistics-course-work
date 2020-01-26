
##
print('Question 5.')
#input the data
lawn.dat <- read.csv("lawn-depression.csv")
names(lawn.dat)
summary(lawn.dat)
attach(lawn.dat)
#Visualize the data: check if the data has a linear shape
plot(depression.mm.~weight.ton.);
#Run Statistical Tests:
#	Correlation:
cor(depression.mm.,weight.ton.)
#	Linear Regression
model.lawn <-lm(depression.mm.~weight.ton.)
model.lawn
summary(model.lawn)
fitted(model.lawn)
plot(depression.mm.~weight.ton.)
abline(model.lawn)
#	95% Confidence Interval
t.test(depression.mm.,weight.ton.)
#Run Diagnostics 
#	Test the significance of the correlation of the data
cor.test(weight.ton.,depression.mm.)$p.value
#	Perform diagnostic tests
ls.diag(model.lawn)
#Check Assumptions
#	Check y values and error values are independent
plot(resid(model.lawn))
hist(resid(model.lawn),xlab = "residuals", main = "Histogram of residuals")
#	Check homogeneity of variance
plot(fitted(model.lawn),resid(model.lawn))
plot(lm(depression.mm.~weight.ton.))
#	Check for normality of error
qqnorm(resid(model.lawn))

#---------------------------------------------------------------------------#
#Return to step one. Use transformed data with the outlier- point ten removed
lawn.dat
?-c
#Transformm data and recheck shape
plot(log(weight.ton.)~log(depression.mm.))
#Test the significance of the transformed data
cor.test(log(weight.ton.),log(depression.mm.))$p.value
#Perform a linear regression on transformed data
model.ln <-lm(log(weight.ton.)~log(depression.mm.))
#Run Diagnostics
ls.diag(model.ln)
#According to cook's test, point ten has a great influence
#Remove point ten and re-model data
lawn.dat.2<- lawn.dat[-c(21)]
lawn.dat.2
lawn.dat
plot(lawn.dat.2)
plot(lawn.dat)
#Linear Model
model.ln
plot(model.ln)
summary(model.ln)
fitted(model.ln)
#Updated linear model with out point 10
model.ln.2 <-update(model.ln,subset = (depression.mm. !=10))
plot(model.ln.2)
summary(model.ln.2)
fitted(model.ln.2)
#Check y values and error values are independent
plot(resid(model.ln.2))
hist(resid(model.ln.2),xlab = "residuals", main = "Histogram of residuals")
#Check homogeneity of variance
plot(resid(model.lawn),fitted(model.lawn))
plot(resid(model.lawn),weight.ton.)
#Check for normality of error
qqnorm(weight.ton.)
qqnorm(depression.mm.)
qqnorm(resid(model.lawn))
#Determine the correlation of transformed data. 
cor(log(weight.ton.),log(depression.mm.))
#Linear Model
model.ln
summary(model.ln)
fitted(model.ln)
#Visualize linear model
plot(log(weight.ton.)~log(depression.mm.))
abline(model.ln)
detach(lawn.dat)
