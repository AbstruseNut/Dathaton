A = read.csv("emi1.csv")
product_subsets <- split(A, A$ProductType)

combined_data <- do.call(rbind, product_subsets)

# Calculate the average 'Quantity' for each month
library(dplyr)
monthly_averages <- combined_data %>%
  group_by(STD_month) %>%
  summarise(Average_Quantity = mean(Quantity, na.rm = TRUE))

# Convert the results into a data frame with month and average
results_table <- data.frame(Month = monthly_averages$STD_month, Average_Quantity = monthly_averages$Average_Quantity)

# Print the table
print(results_table)
