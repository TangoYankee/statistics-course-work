Timothy Miller
Homework III
11 Oct 2011

**Problem 3.1**  
Calculate the probability for each of the following events:  
(a) A standard normally distributed variable is larger than 3.
- ```1-pnorm(3)```

(b) A normally distributed variable with mean 35 and standard deviation 6 is larger than 42.
- ```1-pnorm(42,mean=35,sd=6)```
 
(c) Getting 10 out of 10 successes in a binomial distribution with probability 0.8 (80%).
- ```1-pbinom(9,size=10,prob=.8)```

(d) X < 0.9 when X has the standard uniform distribution.
- ```punif(.9)```

(e) X > 6.5 in a chi^2 distribution with 2 degrees of freedom.
- ```1-pchisq(6.5, 2, ncp=0, lower.tail= TRUE, log.p = FALSE)```

**Problem 3.2**  
(a) A rule of thumb is that 5% of the normal distribution lies outside an
interval approximately +/-2s about the mean. To what extent is this true?  
- About 95.45% of the distribution lies within 2 standard deviations. About 4.55% of the distribution
lies outside of 2sd. However, the percentages are irrational numbers and their values are uncountable.

(b) Where are the limits corresponding to 1%, 0.5%, and 0.1%?
- The standard deviations of 1%, 0.5%, and 0.1% are +/-2.33, +/-2.58, and +/-3.1, respectively. 

(c) What is the position of the quartiles measured in standard deviation units?  
- The first and third quartiles are located at +/-0.67sd.The second quartile lies at 0.0sd. 

**Problem 3.3**  
For a disease known to have a postoperative complication frequency of 20%,
a surgeon suggests a new procedure. He tests it on 10 patients and there are no complications.  
What is the probability of operating on 10 patients successfully with the traditional method?
- ```1-pbinom(9,size=10,prob=.8)```

**Problem 3.4**
Simulated coin-tossing can be done using rbinom instead of sample.  
How exactly would you do that?
- ```rbinom(10, size=1,prob=.5)``` where 0 is tails and 1 is heads
