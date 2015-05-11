# plot3.R

if (!"neiData" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

png(filename="plot3.png", width = 480, height = 480, units = "px")

# Create ggplot
g <- ggplot(baltimore, aes(year, Emissions, color = type))

g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")  # Add layers

dev.off()