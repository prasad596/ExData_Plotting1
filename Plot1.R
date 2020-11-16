#read data
hpc <- read.table("./data/household_power_consumption.txt", 
                  sep = ";", header = TRUE, na.strings="?")

#subset data
hpcSubset <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")


#plot histogram
hist(hpcSubset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file="./ExData_Plotting1/plot1.png", height=480, width=480)
dev.off()