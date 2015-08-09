# Load data
file_name<-"household_power_consumption.txt"
dat<-read.csv(file_name,header=T,sep=";", na.strings = "?")
# Subset data
exdat<-dat[(dat$Date=="1/2/2007"|dat$Date=="2/2/2007"),]
# Adding column in format with date and time
exdat$DateTime<-paste(exdat$Date, exdat$Time)
# Convert to time type
exdat$DateTime<-strptime(exdat$DateTime, format = "%d/%m/%Y %H:%M:%S")
# Plot data
png("plot3.png")
y_text<-"Energy sub metering"
with(exdat, plot(DateTime, Sub_metering_1, ylab =y_text, xlab = "", type = "l"))
with(exdat, points(DateTime, Sub_metering_2, col = "red", type = "l" ))
with(exdat, points(DateTime, Sub_metering_3, col = "blue", type = "l" ))
legend<-c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" )
legend("topright", pch = "_____", col = c("black", "red", "blue"), legend = legend)
dev.off()