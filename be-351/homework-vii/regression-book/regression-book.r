library(ISwR)

##
print('Answer 6.1')
attach(rmr)
#Plot of metobolic rate versus body weight
plot(metabolic.rate ~ body.weight)
#Fit of linear regression model 
fit <- lm(metabolic.rate ~ body.weight)
summary(fit)
# Predicted metobolic rate for a body wieght of 70kg
predict(fit, newdata=data.frame(body.weight=70))
#95% condfidence interval for the slope of the line
confint(fit)
detach(rmr)

##
print('Answer 6.2')
attach(juul)
#Plot the data to visualize it
plot(sqrt(igf1)~age, subset= age>25)
#fit a linear regression model
summary(lm(sqrt(igf1)~age,subset=age>25))
detach(juul)

##
print('Answer 6.3')
attach(malaria)
#Linear fit to log transformed data
summary(lm(log(ab)~age))
#Pre-transformation plot
plot(ab~age)
#Post-Transformation Plot
plot(log(ab)~age)
detach(malaria)

##
print('Answer 6.4')
rho <- .90 ; n <- 100
x <- rnorm(n)
y <- rnorm(n, rho * x, sqrt(1 - rho^2))
plot(x, y)
cor.test(x, y)
cor.test(x, y, method="spearman")
cor.test(x, y, method="kendall")
