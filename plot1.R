# Load data
file_name<-"household_power_consumption.txt"
dat<-read.csv(file_name,header=T,sep=";", na.strings = "?")

# Subset data
exdat<-dat[(dat$Date=="1/2/2007"|dat$Date=="2/2/2007"),]

#Plot data
png("plot1.png")
x_text<-"Global active power(kilowatts)"
main_text<-"Global Active Power"
hist(exdat$Global_active_power, col="red",xlab = x_text, main=main_text)
dev.off()