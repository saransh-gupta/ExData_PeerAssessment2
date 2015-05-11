# plot2.R

if (!"neiData" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Subset data for Baltimore
baltimore <- NEI[NEI$fips == "24510", ]
# Emissions for Baltimore
balt_emission <- tapply(baltimore$Emissions, baltimore$year, sum)

png(filename="plot2.png", width = 480, height = 480, units = "px")

# Plot Emissions Vs Year For Baltimore
plot( names(table(baltimore$year)), balt_emission, pch=20, col="blue", "b", lwd=2, lty=1,
      xlab="Years", ylab=expression('Total PM'[2.5]*" Emission"), main="Emissions in Baltimore")

dev.off()