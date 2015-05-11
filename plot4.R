# plot4.R

if (!"neiData" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Subset data where pollutant is coal
coal <- grep("coal", SCC$Short.Name, ignore.case = T)
coal <- SCC[coal, ]
coal <- NEI[NEI$SCC %in% coal$SCC, ]

# Find emissions due to coal by the years
coalEmission <- tapply(coal$Emissions, coal$year, sum)

png(filename="plot4.png", width = 480, height = 480, units = "px")

# Plot the emissions due to coal Vs year
plot(coalEmission, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related \n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
