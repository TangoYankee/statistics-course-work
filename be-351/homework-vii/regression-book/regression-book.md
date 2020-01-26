Timothy Miller  
Homework VII  
16 Nov 2011  

### Question 1.
Read CH 6 and do all the problems at the end of the chapter.

### 6.1
With the rmr data set, plot metabolic rate versus body weight.  
Fit a linear regression model to the relation.  
According to the fitted model, what is the predicted metabolic rate for a body weight of 70 kg?  
Give a 95% confidence interval for the slope of the line.

1. Plot of metobolic rate versus body weight
    ```
    plot(metabolic.rate ~ body.weight)
    ```
2. Fit of linear regression model
    ```
    fit <- lm(metabolic.rate ~ body.weight)
    summary(fit)
    ```
3. Predicted metobolic rate for a body wieght of 70kg
    ```
    predict(fit, newdata=data.frame(body.weight=70))
    ```
4. 95% condfidence interval for the slope of the line
    ```
    confint(fit)
    ```

### 6.2
In the juul data set, fit a linear regression model for the square root of
the IGF-I concentration versus age to the group of subjects over 25 years old.

1. Plot the data to visualize it
    ```
    plot(sqrt(igf1)~age, subset= age>25)
    ```
2. fit a linear regression model
    ```
    summary(lm(sqrt(igf1)~age,subset=age>25))
    ```
### 6.3 
In the malaria data set, analyze the log-transformed antibody level versus age.  
Make a plot of the relation. Do you notice anything peculiar?

1. Linear fit to log transformed data
    ```
    summary(lm(log(ab)~age))
    ```
2. Pre-transformation plot
    ```
    plot(ab~age)
    ```
3. Post-Transformation Plot
    ```
    plot(log(ab)~age)
    ```
4. The plot appears to show a cyclic pattern. It is unclear whether it reflects
a significant departure from the model, though.  
Malaria is a disease with epidemic behaviour; cycles are plausible.

### 6.4
One can generate simulated data from the two-dimensional normal distribution
with a correlation of r by the following technique: 
1. Generate X as a normal variate with mean 0 and standard deviation 1; 
2. Generate Y with mean rX and standard deviation sqrt(1-p^2)
Use this to create scatterplots of simulated data with a given correlation.  
Compute the Spearman and Kendall statistics for some of these data sets.

- *This could be elaborated by wrapping the random number generation in a function, etc.*
    ```
    rho <- .90 ; n <- 100
    x <- rnorm(n)
    y <- rnorm(n, rho * x, sqrt(1 - rho^2))
    plot(x, y)
    cor.test(x, y)
    cor.test(x, y, method="spearman")
    cor.test(x, y, method="kendall")
    ```
- In general, the Kendall correlation is moderately smaller than the other two tests. 
