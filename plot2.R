
## plot2.R - Coursera Expl Data Anal project 1

## Load and convert data
library(dplyr)
data1 <- subset(read.csv("./Project_Data/household_power_consumption.txt",
                sep=";", na.strings="?", stringsAsFactors=FALSE),
                Date=="1/2/2007" | Date=="2/2/2007")
data1 <- mutate(data1, DateTime = as.POSIXct(paste(Date, Time, sep=" "),
                format = "%d/%m/%Y %H:%M:%S"))

## Plot 2
png(filename="plot2.png", width=480, height=480)
plot(data1$DateTime, data1$Global_active_power, typ="l",
     ylab="Global Active Power (kilowatts)", xlab=" ")
dev.off()
