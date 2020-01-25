variety_data <- read.csv("variety.csv", header=TRUE)

chisq.test(variety_data)

## Result
#       Pearson's Chi-squared test

# data:  variety_data
# X-squared = 2.9569, df = 4, p-value = 0.5651

# Warning message:
# In chisq.test(variety_data) : Chi-squared approximation may be incorrect
