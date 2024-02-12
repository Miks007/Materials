#### PLOT LINE PLOTS Y vs Xs (Dual independent axes)

# Add extra space to right margin of plot within frame
par(mar=c(5, 4, 4, 6) + 0.1)

# Plot each column in the list
for (col_name in colnames(df)[-2]) { # Exclude the first column 'Date'
  # Plot the data
  plot(df$Date, df$Y, pch=16, xlab="", ylab="", 
       type="l", col="black", main=paste("Plot of Y vs", col_name))
  
  # Add y-axis label
  mtext(col_name, side=2, line=2.5)
  
  # Allow a second plot on the same graph
  par(new=TRUE)
  
  # Plot the second plot and put axis scale on right
  plot(df$Date, df[[col_name]], pch=15,  xlab="", ylab="", ylim=c(min(df[[col_name]]),max(df[[col_name]])), 
       axes=FALSE, type="l", col="red")
  
  # Add y-axis label for the second plot
  mtext(col_name, side=4, col="red", line=4) 
  
  # Draw the second y-axis
  axis(4, ylim=c(min(df[[col_name]]),max(df[[col_name]])), col="red", col.axis="red", las=1)
  
  # Draw the time axis
  mtext("Date", side=1, col="black", line=2.5)  
  # Add legend
  legend("top", legend=c("Y", col_name),
         text.col=c("black","red"), pch=c(16,15), col=c("black","red"))}
