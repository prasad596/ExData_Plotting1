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
par(mfrow = c(2, 2))
mar=c(4,4,2,1)
oma=c(0,0,2,0)
plot(hpcSubset$DateTime, hpcSubset$Global_active_power, type="l",
     ylab="Global Active Power", xlab = "")

plot(hpcSubset$DateTime, hpcSubset$Voltage, type="l",
     ylab="Voltage", xlab = "datetime")

plot(hpcSubset$DateTime, hpcSubset$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering" ,xlab = "")
lines(hpcSubset$DateTime, hpcSubset$Sub_metering_2, type = "l", col = "red")
lines(hpcSubset$DateTime, hpcSubset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, cex = 0.7, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       box.lty=0, inset = 0.01)

plot(hpcSubset$DateTime, hpcSubset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file="./ExData_Plotting1/plot4.png", height=480, width=480)
dev.off()