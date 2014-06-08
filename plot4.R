# Read  the data from a .txt file
rawdata  <- read.table  ("./household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)

# select the needed data
sub <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

#Add a DateTime to the data
sub$DateTime <- strptime(paste(sub$Date , sub$Time , sep=" ") , format="%d/%m/%Y %H:%M:%S")

#Create a .png file with 4 plots

png(filename="plot4.png" , height=480 , width=480 , units="px" , bg = "white")

par(mfrow=c(2,2))

# plot (Global_active_power, t)
plot(sub$DateTime,sub$Global_active_power, xlab="", ylab="Global Active Power (Kilowatts)",type="l")

# plot  (Voltage, t)
plot(sub$DateTime,sub$Voltage, xlab="datetime", ylab="Voltage",type="l")

# plot Series  (Sub_metering_i, t)
plot(sub$DateTime,sub$Sub_metering_1, xlab="", ylab="Energy Sub Metering",type="l",col="black")
points(sub$DateTime,sub$Sub_metering_2, xlab="", ylab="",type="l",col="red")
points(sub$DateTime,sub$Sub_metering_3, xlab="", ylab="",type="l",col="blue")
legend("topright", col=c("black","red","blue"), lwd=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# plot (Global_reactive_power,t)
plot(sub$DateTime,sub$Global_reactive_power, xlab="", ylab="Global Reactive Power (Kilowatts)",type="l")

# close the output device
dev.off()
