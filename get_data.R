# get_data.R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2) # load required library

str(NEI)      
summary(NEI)
head(NEI)

summary(SCC)
str(SCC)
head(SCC)