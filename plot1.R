# plot1.R
if (!"neiData" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Get emissions for each year.
emissions <-  tapply(NEI$Emissions, NEI$year, sum) 

png(filename="plot1.png", width = 480, height = 480, units = "px") # Save file in the default directory

# Plot the emissions Vs. Year
# names(table$NEI$year) gets the name of years in the data sets to plot the data against
# Setting "b" to get both line and dots in the plots for increased interpretability

plot(names(table(NEI$year)), emissions, pch=20, col="red", "b", lwd=2, lty=1,
     xlab="Year",  ylab= expression('Total PM'[2.5]*" Emission"))

dev.off()