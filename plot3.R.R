
## plot3.R - Coursera Expl Data Anal project 1

## Load and convert data
library(dplyr)
data1 <- subset(read.csv("./Project_Data/household_power_consumption.txt",
                sep=";", na.strings="?", stringsAsFactors=FALSE),
                Date=="1/2/2007" | Date=="2/2/2007")
data1 <- mutate(data1, DateTime = as.POSIXct(paste(Date, Time, sep=" "),
                format = "%d/%m/%Y %H:%M:%S"))

## Plot 3
png(filename="plot3.png", width=480, height=480)
plot(data1$DateTime, data1$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab=" ")
points(data1$DateTime, data1$Sub_metering_2, type="l", col="red")
points(data1$DateTime, data1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
