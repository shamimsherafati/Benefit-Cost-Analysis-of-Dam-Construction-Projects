# load the package
library(extraDistr)

# Define benefits and costs for Dam 1
B1 <- c(1.1, 2, 2.8)
B2 <- c(8, 12, 14.9)
B3 <- c(1.4, 1.4, 2.2)
B4 <- c(6.5, 9.8, 14.6)
B5 <- c(1.7, 2.4, 3.6)
B6 <- c(0, 1.6, 2.4)
C1 <- c(13.2, 14.2, 19.1)
C2 <- c(3.5, 4.9, 7.4)

# Define benefits and costs for Dam 2
B1_d2 <- c(2.1, 3, 4.8)
B2_d2 <- c(8.7, 12.2, 13.6)
B3_d2 <- c(2.3, 3, 3)
B4_d2 <- c(5.9, 8.7, 15)
B5_d2 <- c(0, 3.4, 3.4)
B6_d2 <- c(0, 1.2, 1.8)
C1_d2 <- c(12.8, 15.8, 20.1)
C2_d2 <- c(3.8, 5.7, 8)

# Perform simulation for Dam 1
d1_benefit_params = list(B1, B2, B3, B4, B5, B6)
d1_cost_params = list(C1, C2)
a1 <- c()
benefits_dam1 <- c()
costs_dam1 <- c()


for (i in 1:1e4) {
  benefits <- sapply(d1_benefit_params, function(params) {rtriangle(1e4, params[1], params[3], params[2])})
  costs <- sapply(d1_cost_params, function(params) {rtriangle(1e4, params[1], params[3], params[2])})
  ratio <- sum(benefits) / sum(costs)
  benefits_dam1 <- c(benefits_dam1, sum(benefits))
  costs_dam1 <- c(costs_dam1, sum(costs))
  a1 <- c(a1, ratio)
}
# Convert a1 to data frame format
a1_df <- as.data.frame(a1)
# Print the data frame
print(a1_df)

# Perform simulation for Dam 2
d2_benefit_params = list(B1_d2, B2_d2, B3_d2, B4_d2, B5_d2, B6_d2)
d2_cost_params = list(C1_d2, C2_d2)
a2 <- c()
benefits_dam2 <- c()
costs_dam2 <- c()

for (i in 1:1e4) {
  benefits2 <- sapply(d2_benefit_params, function(params) {rtriangle(1e4, params[1], params[3], params[2])})
  costs2 <- sapply(d2_cost_params, function(params) {rtriangle(1e4, params[1], params[3], params[2])})
  ratio2 <- sum(benefits2) / sum(costs2)
  benefits_dam2 <- c(benefits_dam2, sum(benefits2))
  costs_dam2 <- c(costs_dam2, sum(costs2))
  a2 <- c(a2, ratio2)
}

# Convert a2 to data frame format
a2_df <- as.data.frame(a2)
# Print the data frame
print(a2_df)

# get the summary for a1 and a2 to get information about the range of the simulation
summary(a1)
summary(a2)

# Create graphical frequency distribution plot for Dam 1:
# Frequency distribution for a1
hist(a1, breaks = 200,col = "yellow",  main = "Frequency Distribution for a1", xlab = "a1 values", ylab = "Frequency")

# Create graphical frequency distribution plot for Dam 2:
# Frequency distribution for a2
hist(a2, breaks = 200,col = "purple",  main = "Frequency Distribution for a2", xlab = "a2 values", ylab = "Frequency")

# Frequency distribution for a1
freq_table_a1 <- table(a1)

# Convert freq_table_a1 to data frame format
freq_table_a1 <- as.data.frame(freq_table_a1)
# Print the data frame
print(freq_table_a1)


# Frequency distribution for a2
freq_table_a2 <- table(a2)

# Convert freq_table_a2 to data frame format
freq_table_a2 <- as.data.frame(freq_table_a2)
# Print the data frame
print(freq_table_a2)


d1_benefit_params = list(B1, B2, B3, B4, B5, B6)
d1_cost_params = list(C1, C2)
ratios_dam1 <- c()
benefits_dam1 <- c()
costs_dam1 <- c()

for (i in 1:1e4) {
  benefits <- sapply(d1_benefit_params, function(params) {rtriangle(1, params[1], params[3], params[2])})
  costs <- sapply(d1_cost_params, function(params) {rtriangle(1, params[1], params[3], params[2])})
  ratio <- sum(benefits) / sum(costs)
  benefits_dam1 <- c(benefits_dam1, sum(benefits))
  costs_dam1 <- c(costs_dam1, sum(costs))
  ratios_dam1 <- c(ratios_dam1, ratio)
}

mean(benefits_dam1)
mean(costs_dam1)

# Dam1
B1 <- c(1.1, 2, 2.8)
B2 <- c(8, 12, 14.9)
B3 <- c(1.4, 1.4, 2.2)
B4 <- c(6.5, 9.8, 14.6)
B5 <- c(1.7, 2.4, 3.6)
B6 <- c(0, 1.6, 2.4)
C1 <- c(13.2, 14.2, 19.1)
C2 <- c(3.5, 4.9, 7.4)

d1_benefit_params = list(B1, B2, B3, B4, B5, B6)
d1_cost_params = list(C1, C2)
ratios_dam1 <- c()
benefits_dam1 <- c()
costs_dam1 <- c()

for (i in 1:1e4) {
  benefits <- sapply(d1_benefit_params, function(params) {rtriangle(1, params[1], params[3], params[2])})
  costs <- sapply(d1_cost_params, function(params) {rtriangle(1, params[1], params[3], params[2])})
  ratio <- sum(benefits) / sum(costs)
  benefits_dam1 <- c(benefits_dam1, sum(benefits))
  costs_dam1 <- c(costs_dam1, sum(costs))
  ratios_dam1 <- c(ratios_dam1, ratio)
}

# Observed: 

# Total Observed Benefits for Dam1 
Obs_Benefit_D1 = sum(B1) + sum(B2) + sum(B3) + sum(B4) + sum(B5) + sum(B6)
Obs_Benefit_D1 = mean(benefits_dam1)
# Total Observed Cost for Dam1
Obs_Cost_D1 = sum(C1) + sum(C2)
Obs_Cost_D1 = mean(costs_dam1)

# Mean of the Total Observed Benefits for Dam1 
mean_Obs_Benefit_D1 = mean(benefits_dam1)
## Standard Deviation of the Total Observed Benefits for Dam1 
SD_Obs_Benefit_D1 = sd(benefits_dam1)

# Mean of the Total Observed Cost for Dam1 
mean_Obs_Cost_D1 = mean(costs_dam1)
## Standarad Deviation of the Total Observed Cost for Dam1 
SD_Obs_Cost_D1 = sd (costs_dam1)

#Mean of Observed Benefit-Cost Ratio for Dam1
mean_Obs_Ratio = mean(ratios_dam1)
#SD of Observed Benefit-Cost Ratio for Dam1
SD_Obs_Ratio = sd (ratios_dam1)


# Theoretical: 

# Total Theoretical Benefits for Dam1 
Theo_Benefit_D1 = mean(B1) + mean(B2) + mean(B3) + mean(B4) + mean(B5) + mean(B6)
# Total Theoretical Cost for Dam1
Theo_Cost_D1 = mean(C1) + mean(C2)

# Mean of the Total Theoretical Benefits for Dam1 
mean_Theo_Benefit_D1 = sum(mean(B1), mean(B2), mean(B3), mean(B4), mean(B5), mean(B6))
## Standard Deviation of the Total Theoretical Benefits for Dam1 
SD_Theo_Benefit_D1 <- sd(c(sd(B1), sd(B2), sd(B3), sd(B4), sd(B5), sd(B6)))

# Mean of the Total Theoretical Cost for Dam1 
mean_Theo_Cost_D1 = sum( mean(C1) , mean(C2))
## Standarad Deviation of the Total Theoretical Cost for Dam1 
SD_Theo_Cost_D1 <- sd(c(sd(C1), sd(C2)))



# Print results
cat("The Mean of the Total Observed Benefits for Dam1 ", mean_Obs_Benefit_D1, "\n")
cat("The Standarad Deviation of the Total Observed Benefits for Dam1  is", SD_Obs_Benefit_D1 , "\n")

cat("The Mean of the Total Observed Cost for Dam1  is", mean_Obs_Cost_D1, "\n")
cat("The Standarad Deviation of the Total Observed Cost for Dam1  is", SD_Obs_Cost_D1, "\n")

cat("The Mean of the Total Theoretical Benefits for Dam1 ", mean_Theo_Benefit_D1, "\n")
cat("The Standarad Deviation of the Total Theoretical Benefits for Dam1  is", SD_Theo_Benefit_D1 , "\n")

cat("The Mean of the Total Theoretical Cost for Dam1  is", mean_Theo_Cost_D1, "\n")
cat("The Standarad Deviation of the Total Theoretical Cost for Dam1  is", SD_Theo_Cost_D1, "\n")

cat("The Mean of Observed Benefit-Cost Ratio for Dam1 is", mean_Obs_Ratio, "\n")
cat("The SD of Observed Benefit-Cost Ratio for Dam1 is", SD_Obs_Ratio, "\n")


df <- data.frame(
  Dam1 = c("Mean.of.the.Total.Benefits", "SD.of.the.Total.Benefits", "Mean.of.the.Total.Cost", "SD.of.the.Total.Cost", "Mean.of.Benefit.Cost.Ratio", "SD.of.Benefit.Cost.Ratio"),
  "Observed" = c(mean_Obs_Benefit_D1, SD_Obs_Benefit_D1, mean_Obs_Cost_D1, SD_Obs_Cost_D1, mean_Obs_Ratio, SD_Obs_Ratio ),
  "Theoretical" = c(mean_Theo_Benefit_D1, SD_Theo_Benefit_D1, mean_Theo_Cost_D1, SD_Theo_Cost_D1, mean_Theo_Ratio, SD_Theo_Ratio)
  
)
df


# Dam 2
B1_d2 <- c(2.1, 3, 4.8)
B2_d2 <- c(8.7, 12.2, 13.6)
B3_d2 <- c(2.3, 3, 3)
B4_d2 <- c(5.9, 8.7, 15)
B5_d2 <- c(0, 3.4, 3.4)
B6_d2 <- c(0, 1.2, 1.8)
C1_d2 <- c(12.8, 15.8, 20.1)
C2_d2 <- c(3.8, 5.7, 8)

d2_benefit_params = list(B1_d2, B2_d2, B3_d2, B4_d2, B5_d2, B6_d2)
d2_cost_params = list(C1_d2, C2_d2)
ratios_dam2 <- c()
benefits_dam2 <- c()
costs_dam2 <- c()

for (i in 1:1e4) {
  benefits2 <- sapply(d2_benefit_params, function(params) {rtriangle(1, params[1], params[3], params[2])})
  costs2 <- sapply(d2_cost_params, function(params) {rtriangle(1, params[1], params[3], params[2])})
  ratio2 <- sum(benefits2) / sum(costs2)
  benefits_dam2 <- c(benefits_dam2, sum(benefits2))
  costs_dam2 <- c(costs_dam2, sum(costs2))
  ratios_dam2 <- c(ratios_dam2, ratio2)
}

# Observed:

# Total Observed Benefits for Dam2
Obs_Benefit_D2 = sum(B1_d2) + sum(B2_d2) + sum(B3_d2) + sum(B4_d2) + sum(B5_d2) + sum(B6_d2)
# Total Observed Cost for Dam2
Obs_Cost_D2 = sum(C1_d2) + sum(C2_d2)

# Mean of the Total Observed Benefits for Dam2 
mean_Obs_Benefit_D2 = mean(benefits_dam2)
## Standard Deviation of the Total Observed Benefits for Dam12
SD_Obs_Benefit_D2 = sd (benefits_dam2)

# Mean of the Total Observed Cost for Dam2
mean_Obs_Cost_D2 = mean(costs_dam2)
## Standarad Deviation of the Total Observed Cost for Dam2
SD_Obs_Cost_D2 = sd (costs_dam2)

#Mean of Observed Benefit-Cost Ratio for Dam2
mean_Obs_Ratio_D2 = mean(ratios_dam2)
#SD of Observed Benefit-Cost Ratio for Dam2
SD_Obs_Ratio_D2 = sd (ratios_dam2)


## Theoretical for Dam2:

# Total Theoretical Benefits for Dam2
Theo_Benefit_D2 = mean(B1_d2) + mean(B2_d2) + mean(B3_d2) + mean(B4_d2) + mean(B5_d2) + mean(B6_d2)
# Total Theoretical Cost for Dam2
Theo_Cost_D2 = mean(C2_d2) + mean(C2_d2)

# Mean of the Total Theoretical Benefits for Dam2
mean_Theo_Benefit_D2 = sum(mean(B1_d2), mean(B2_d2), mean(B3_d2), mean(B4_d2), mean(B5_d2), mean(B6_d2))
## Standard Deviation of the Total Theoretical Benefits for Dam2
SD_Theo_Benefit_D2 <- sd(c(sd(B1_d2), sd(B2_d2), sd(B3_d2), sd(B4_d2), sd(B5_d2), sd(B6_d2)))

# Mean of the Total Theoretical Cost for Dam2
mean_Theo_Cost_D2 = sum( mean(C1_d2) , mean(C2_d2))
## Standarad Deviation of the Total Theoretical Cost for Dam2
SD_Theo_Cost_D2 <- sd(c(sd(C1_d2), sd(C2_d2)))



# Print results
cat("The Mean of the Total Observed Benefits for Dam2 ", mean_Obs_Benefit_D2, "\n")
cat("The Standarad Deviation of the Total Observed Benefits for Dam2  is", SD_Obs_Benefit_D2 , "\n")
cat("The Mean of the Total Observed Cost for Dam2  is", mean_Obs_Cost_D2, "\n")
cat("The Standarad Deviation of the Total Observed Cost for Dam2 is", SD_Obs_Cost_D2, "\n")

cat("The Mean of the Total Theoretical Benefits for Dam2 ", mean_Theo_Benefit_D2, "\n")
cat("The Standarad Deviation of the Total Theoretical Benefits for Dam2  is", SD_Theo_Benefit_D2 , "\n")
cat("The Mean of the Total Theoretical Cost for Dam2  is", mean_Theo_Cost_D2, "\n")
cat("The Standarad Deviation of the Total Theoretical Cost for Dam2  is", SD_Theo_Cost_D2, "\n")

cat("The Mean of Observed Benefit-Cost Ratio for Dam2 is", mean_Obs_Ratio_D2, "\n")
cat("The SD of Observed Benefit-Cost Ratio for Dam2 is", SD_Obs_Ratio_D2, "\n")


df2 <- data.frame(
  Dam2 = c("Mean.of.the.Total.Benefits", "SD.of.the.Total.Benefits", "Mean.of.the.Total.Cost", "SD.of.the.Total.Cost", "Mean.of.Benefit.Cost.Ratio", "SD.of.Benefit.Cost.Ratio"),
  "Observed" = c(mean_Obs_Benefit_D2, SD_Obs_Benefit_D2, mean_Obs_Cost_D2, SD_Obs_Cost_D2, mean_Obs_Ratio_D2, SD_Obs_Ratio_D2 ),
  "Theoretical" = c(mean_Theo_Benefit_D2, SD_Theo_Benefit_D2, mean_Theo_Cost_D2, SD_Theo_Cost_D2, mean_Theo_Ratio_D2, SD_Theo_Ratio_D2)
  
)
df2

# Fit a gamma distribution to a1
fit_a1 <- fitdist(a1, "gamma")
simulated_a1 <- rgamma(n = 10000, shape = fit_a1$estimate[1], 
                       scale = fit_a1$estimate[2])

# Create intervals to bin the data
intervals <- cut(a1, breaks = 10)

# Calculate observed frequencies for each interval
observed_freq1 <- table(intervals)

# Calculate expected frequencies for each interval
intervals_sim <- cut(simulated_a1, breaks = 10)
expected_freq1 <- table(intervals_sim)

# Conduct a chi-squared goodness-of-fit test to compare the observed and simulated a1 values
test_result1 <- chisq.test(observed_freq1, p = expected_freq1/sum(expected_freq1))

# Print the results of the goodness-of-fit test for a1
cat("Results of chi-squared goodness-of-fit test for a1:\n")
cat("Chi-squared statistic:", test_result1$statistic, "\n")
cat("P-value:", test_result1$p.value, "\n")


# Fit a gamma distribution to a2
fit_a2 <- fitdist(a1, "gamma")
simulated_a2 <- rgamma(n = 10000, shape = fit_a2$estimate[1], 
                       scale = fit_a2$estimate[2])

# Create intervals to bin the data
intervals <- cut(a2, breaks = 10)

# Calculate observed frequencies for each interval
observed_freq2 <- table(intervals)

# Calculate expected frequencies for each interval
intervals_sim <- cut(simulated_a2, breaks = 10)
expected_freq2 <- table(intervals_sim)
test_result2 <- chisq.test(observed_freq2, p = expected_freq2/sum(expected_freq2))

# Print the results of the goodness-of-fit test for a2
cat("Results of chi-squared goodness-of-fit test for a2:\n")
cat("Chi-squared statistic:", test_result2$statistic, "\n")
cat("P-value:", test_result2$p.value, "\n")

proportion_check <- function(a_list, x_i) {
prop <- sum(a_list > x_i) / length(a_list)
return(prop)
}

get_metrics <- function(a_list) {
minimum <- min(a_list)
maximum <- max(a_list)
mean <- mean(a_list)
median <- median(a_list)
var <- var(a_list)
std <- sd(a_list)
skewness <- sum(((a_list - mean) / var) ^ 3) * length(a_list) / ((length(a_list) - 1) * (length(a_list) - 2))
prop_2 <- proportion_check(a_list, 2)
prop_1_8 <- proportion_check(a_list, 1.8)
prop_1_5 <- proportion_check(a_list, 1.5)
prop_1_2 <- proportion_check(a_list, 1.2)
prop_1 <- proportion_check(a_list, 1)

return(list(minimum, maximum, mean, median, var, std, skewness, prop_2, prop_1_8, prop_1_5, prop_1_2, prop_1))
}

a1_metrics <- get_metrics(a1)
a2_metrics <- get_metrics(a2)

df <- data.frame(Metric = c("Minimum", "Maximum", "Mean", "Median", "Variance", "Standard Deviation", "SKEWNESS", "P(𝛂i > 2)", "P(𝛂i > 1.8)", "P(𝛂i > 1.5)", "P(𝛂i > 1.2)", "P(𝛂i > 1)"),
a1 = unlist(a1_metrics),
a2 = unlist(a2_metrics),
stringsAsFactors = FALSE)

df$check <- df$a1 > df$a2

df

#For showing all the rows once: 
options(knitr.table.format = "html") # set table format to HTML
# your existing code for creating the data frame "df"
knitr::kable(df, align = "c", row.names = FALSE) # show all rows and remove row names


#the probability that  a1 will be greater than  a2:

prop_a1_a2 <- sum(df$check) / nrow(df)
cat("Proportion of values for which a1 is more than a2 is: ", prop_a1_a2)

## NA
