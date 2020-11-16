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
plot(hpcSubset$DateTime, hpcSubset$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="./ExData_Plotting1/plot2.png", height=480, width=480)
dev.off()