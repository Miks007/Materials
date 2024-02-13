### BOX PLOTS
## tested on continuous variables only
# Calculate the number of plots needed
num_plots <- ceiling(ncol(df) / 5)

# Set up the plotting area
par(mfrow = c(1, min(5, ncol(df))), mar = c(5, 4, 2, 1))

# Loop through each group of five columns
for (i in seq(1, ncol(df), by = 5)) {
  # Subset the data frame to include only the next five columns
  subset_df <- df[, i:min(i+4, ncol(df))]
  
  # Loop through each column in the subset
  for (col in names(subset_df)) {
    # Check if the column contains numeric data
    if (is.numeric(subset_df[[col]])) {
      # Plot a boxplot for the current column
      boxplot(subset_df[[col]], main = col, ylab = "Value")
    }
  }
}