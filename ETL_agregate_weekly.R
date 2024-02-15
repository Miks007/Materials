# Get the distinct dates (they must be no gaps)
distinct_dates <- data.frame(unique(df$Data))

start_date <- as.Date("2024-01-01")
distinct_dates$count <- as.integer((as.numeric(distinct_dates$unique.df.Data. - start_date) %%7) + 1)
week_start_dates <- as.Date(rep(NA, nrow(distinct_dates)))

head(distinct_dates)
names(distinct_dates)
head(df)
# Add count column to df
df <- left_join(df, distinct_dates, by = c("Data" = "unique.df.Data."))

# Calculate week start dates
current_week_start_date <- start_date
# Iterate over rows
for (i in 1:nrow(df)) {
  # Check if count is 1
  if (df$count[i] == 1) {
    current_week_start_date <- distinct_dates[distinct_dates$unique.df.Data. == df$Data[i], "unique.df.Data."]
  }
  # Update week start date for the current row
  week_start_dates[i] <- current_week_start_date
}
df$week_start_date <- week_start_dates
head(df)

# agregate the datea weekly
df_weekly <- df_weekly %>%
  rename("Date" = "week_start_date") %>%
  group_by(Date, Other_Column) %>%
  summarise(Value_sum = sum(Value), .groups = "drop")

head(df_weekly)