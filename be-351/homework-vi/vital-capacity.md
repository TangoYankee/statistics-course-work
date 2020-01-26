Timothy Miller  
Homework VI  
03 Nov 2011

### 5.1 
Do the values of the react data set look reasonably normally distributed?  
*(notice that this is a single vector and not a data frame)*  
Does the mean differ significantly from zero according to a t test?

- **visualize the data** ```qqnorm(react)```  
The data follow a normal distribution relatively well
- **perform statistical test** ```t.test(react)```  
With a p-value of 1.11 * 10^-13, there is a significant difference between the mean and zero. 

### 5.2 
In the data set vitcap, use a t test to compare the vital capacity for the two groups. 
Calculate a 99% confidence interval for the difference.  
The result of this comparison may be misleading. Why?  
- **Test variable of interest for two groups** ```t.test(vital.capacity ~ group, conf=0.99)```  
A p-value of .0087 suggests that there is significant difference between the vital capacities of the two groups.
- **Test variable that is a characteristic for each of the groups** ```t.test(age ~ group, conf = 0.99)```  
However, with a p-value of 4.058 * 10^-7, there is also a significant difference in the mean age of each group.  
This could be a confounding variable

### 5.3
Perform the analyses of the react and vitcap data using nonparametric techniques.  
```
wilcox.test(react)
wilcox.test(vital.capacity~group)
```

### 5.4 
Perform graphical checks of the assumptions for a paired t test in the intake data set.
```
opar <- par(mfrow=c(2, 2))
plot(post~pre) 
abline(0,1)
plot(
    (post + pre)/2,
    post - pre,
    ylim=range(0, post-pre)
    )
abline(h=0)
hist(post-pre)
qqnorm(post-pre)
par(opar)
```

### 5.5
The function shapiro.test computes a test of normality based on the degree of linearity of the QQ plot.  
Apply it to the react data.  
Does it help to remove the outliers?
- The shapiro test calculates p-value. Additionally in a sorted data set,
any outliers will be listed at the beginning and end of the list.
Combining these two ideas, one may remove values from the edges of the data
and then re-run the shapiro test to see how the p-value changed. One may also compare
how removing randomly selected values affects the p-value, versus data at the edges.
In this data set, the edges greatly affect the p-value when compared to 
randomly selected values. This suggests that they are outliers.

```
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
```

### 5.6
The crossover trial in ashina can be analyzed for a drug effect in a simple way (how?) if you ignore a potential period effect. 
However, you can do better.  
**Hint: Consider the intra-individual differences; if there
were only a period effect present, how should the differences behave in the
two groups?**  
Compare the results of the simple method and the improved method.
- A simple test finds a difference in the means of vas.active and vas.plac  
```t.test(vas.active, vas.plac, paired=TRUE)```  
However, it fails to measure changes in each person. 

- A more sophisticated test finds the mean of the difference experienced by each individial  
```t.test((vas.active-vas.plac)[grp==2],(vas.plac-vas.active)[grp==1])```  
It then compares the means of these groups.
This takes into account the intra-individual differences

### 5.7
Perform 10 one-sample t tests on simulated normally distributed data sets of 25 observations each.  
Repeat the experiment, but instead simulate samples from a different distribution;
try the t distribution with 2 degrees of freedom and the exponential distribution
(in the latter case, test for the mean being equal to 1).  
Can you find a way to automate this so that you can have a larger number of replications?
- Initial Values
```
reps<-10
n<-25
pnts<-2500
```
- Normal distribution
```
replicate(reps, t.test(rnorm(n))$p.value)
```
- t distribution
```
replicate(reps, t.test(rt(n,df=2))$p.value)
```
- exponential distribution with mean equal to 1
```
replicate(reps, t.test(rexp(n), mu=1)$p.value)
```
- plot of exponential distribution
```
x <- replicate(pnts, t.test(rexp(n), mu=1)$p.value)
qqplot(sort(x),ppoints(pnts),type="l",log="xy")
```
