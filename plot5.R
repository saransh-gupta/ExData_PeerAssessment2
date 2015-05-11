# plot5.R

if (!"neiData" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}


# Find cases where pollution occurs due to motor vehicles 
motor <- grep("motor", SCC$Short.Name, ignore.case = T)
# Subset data
motor <- SCC[motor, ]
motor <- baltimore[baltimore$SCC %in% motor$SCC, ]
# Find emissions due to motor vehicles
motorEmission <- tapply(motor$Emissions, motor$year, sum)

png(filename = "plot5.png", width = 480, height = 480, units = "px")

# Plot Emissions due to motors Vs year

plot(motorEmission, type = "l", xlab = "Year", lwd=2,
     main = "Total Emissions From Motor Vehicle Sources \n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()