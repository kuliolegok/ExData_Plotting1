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
png("plot4.png")
par(mfrow=c(2,2))
# Plot 1
y_text1<-"Global Active Power (kilowatts)"
with(exdat, plot(DateTime,Global_active_power,type="l", ylab=y_text1, xlab=""))
# Plot 2
y_text2<-"Voltage"
x_text2<-"datetime"
with(exdat, plot(DateTime,Voltage,type="l", ylab=y_text2, xlab=x_text2))
# Plot 3
y_text3<-"Energy sub metering"
with(exdat, plot(DateTime, Sub_metering_1, ylab =y_text3, xlab = "", type = "l"))
with(exdat, points(DateTime, Sub_metering_2, col = "red", type = "l" ))
with(exdat, points(DateTime, Sub_metering_3, col = "blue", type = "l" ))
legend<-c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" )
legend("topright", pch = "_____", col = c("black", "red", "blue"), legend = legend)
#Plot 4
y_text4<-"Global_reactive_power"
x_text4<-"datetime"
with(exdat, plot(DateTime,Global_reactive_power,type="l", ylab=y_text4, xlab=x_text4))
dev.off()