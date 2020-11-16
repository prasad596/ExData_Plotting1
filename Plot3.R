#read data
hpc <- read.table("./data/household_power_consumption.txt", 
                  sep = ";", header = TRUE, na.strings="?")

#subset data
hpcSubset <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")


#add datetime
hpcSubset$Date <- as.Date(hpcSubset$Date, "%d/%m/%Y")

hpcSubset$DateTime <- paste(hpcSubset$Date, hpcSubset$Time)
hpcSubset$DateTime <- strptime(hpcSubset$DateTime, "%Y-%m-%d %H:%M:%S")

#plot graph
plot(hpcSubset$DateTime, hpcSubset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpcSubset$DateTime, hpcSubset$Sub_metering_2, type = "l", col = "red")
lines(hpcSubset$DateTime, hpcSubset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="./ExData_Plotting1/plot3.png", height=480, width=480)
dev.off()