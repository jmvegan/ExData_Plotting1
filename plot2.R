# Read  the data from a .txt file
rawdata  <- read.table  ("./household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)

# select the needed data
sub <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")

#Add a DateTime to the data
sub$DateTime <- strptime(paste(sub$Date , sub$Time , sep=" ") , format="%d/%m/%Y %H:%M:%S")

#Create a plot and save it to a .png file
png(filename="plot2.png" , height=480 , width=480 , units="px" , bg = "white")

plot(sub$DateTime,sub$Global_active_power, xlab="", ylab="Global Active Power (Kilowatts)",type="l")

# close the output device
dev.off()