Timothy Miller  
Homework VII  
16 Nov 2011  

### Question 6.
The file HW7_2.csv (renamed seal-weight.csv) contains the data of
body weight (kg) and heart weight (g) for Cape fur seals.  
Is there a relationship between body weight and heart weight for Cape fur seals?  
If so what is that relationship?
*estimate the model parameters with 95 % confidence intervals and provide the model*  
Be sure to check assumptions, make any appropriate adjustments,
and perform diagnostics for linear regression.

1. Visualize the data
    ```
    plot(Body.weight.kg.~Heart.weight.g.)
    ```

2. Determine significance of correlation
    ```
    cor.test(Body.weight.kg.,Heart.weight.g.)#$p.value
    ```  
    With a p-value less than 2.2 x 10^-16, the correlation is significant

3. Create linear model of data
    ```
    model.seal <- lm(Body.weight.kg.~Heart.weight.g.)
    summary(model.seal)
    ```
4. Check y values and error values are independent
    ```
    plot(resid(model.seal))
    hist(resid(model.seal),xlab = "residuals", main = "Histogram of residuals")
    ```
5. Check homogeneity of variance
    ```
    plot(resid(model.seal),Heart.weight.g.)
    ```
6. Determine correlation
    ```
    cor(Body.weight.kg.,Heart.weight.g.)
    ```
7. Check for normal distribtion of error
    ```
    qqnorm(Body.weight.kg.)
    qqnorm(Heart.weight.g.)
    ```
8. Run Diagnostics
    ```
    ls.diag(model.seal)
    ```
9. Creat Linear Model
    ```
    model.seal
    summary(model.seal)
    fitted(model.seal)
    ```

10. Visualize linear model
    ```
    plot(Body.weight.kg.~ Heart.weight.g.);
    abline(model.seal);
    ```

11. t Test
    ```
    t.test(Body.weight.kg.,Heart.weight.g.)
    ```
    95 percent confidence interval:
    -355.5802 -167.1131 
