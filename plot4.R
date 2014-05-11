#This R script is used to produce the plot4 for the Assignment 1

#Load data from current working directory
Data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", 
                   stringsAsFactors=FALSE,
                   colClasses=c("character","character","numeric", "numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings="?")


#Select relevant data for analysis
SubData <- Data[Data[,1]=="1/2/2007" | Data[,1]=="2/2/2007",]  



#Convert date and time variables
SubData$Time <- strptime(paste(SubData[,1], SubData[,2]), format='%d/%m/%Y %H:%M:%S')
SubData$Date<- as.Date(SubData$Date, format="%d/%m/%Y");

#Set background color to transparent
par(bg=NA)

# Setup output with a given size
png("plot4.png", width=480, height= 480)

# Set layout: two rows and two columns
par(mfcol=c(2,2)) 
# plot 1,1
plot(SubData$Time, SubData$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power", xlab="")
# plot 2,1
plot(SubData$Time, SubData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(SubData$Time, SubData$Sub_metering_2, type="l", col="red")
lines(SubData$Time, SubData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))
#legend("topright", lty = 1, bty = "n", cex = 0.5, col = c("Black", "Red", "Blue"),
#       legend = c("Sub_metering_1        ", "Sub_metering_2        ", "Sub_metering_3        "))
#plot 1,2
plot(SubData$Time, SubData$Voltage, type="l", xlab="datetime", ylab="Voltage")   
#Plot 2,2
plot(SubData$Time, SubData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
