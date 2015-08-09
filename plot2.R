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
png("plot2.png")
y_text<-"Global Active Power (kilowatts)"
with(exdat, plot(DateTime,Global_active_power,type="l", ylab=y_text, xlab=""))
dev.off()