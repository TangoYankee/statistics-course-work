volume_data <- read.csv("volume.csv", header=TRUE)

chisq.test(volume_data)

## Result
#         Pearson's Chi-squared test

# data:  volume_data
# X-squared = 3.2453, df = 4, p-value = 0.5176

# Warning message:
# In chisq.test(volume_data) : Chi-squared approximation may be incorrect
