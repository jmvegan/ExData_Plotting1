# Read  the data from a .txt file
rawdata  <- read.table  ("./household_power_consumption.txt", sep=";", header=T, stringsAsFactors=F)

# select the needed data
sub <- subset(rawdata, Date == "1/2/2007" | Date == "2/2/2007")
sub$Global_active_power <- as.numeric(sub$Global_active_power)

#Create a plot and save it to a .png file
png(filename = "plot1.png", width = 480, height = 480)
with(
  sub, 
  hist((sub$Global_active_power), col="red",
               xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))

# close the output device
dev.off()