# Read  the data from a .txt file
rawdata  <- read.table  ("./household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)

# select the needed data
sub <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

#Add a DateTime to the data
sub$DateTime <- strptime(paste(sub$Date , sub$Time , sep=" ") , format="%d/%m/%Y %H:%M:%S")

#Create a plot and save it to a .png file
png(filename="plot3.png" , height=480 , width=480 , units="px" , bg = "white")

plot(sub$DateTime,sub$Sub_metering_1, xlab="", ylab="Energy Sub Metering",type="l",col="black")
points(sub$DateTime,sub$Sub_metering_2, xlab="", ylab="",type="l",col="red")
points(sub$DateTime,sub$Sub_metering_3, xlab="", ylab="",type="l",col="blue")
legend("topright", col=c("black","red","blue"), lwd=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# close the output device
dev.off()