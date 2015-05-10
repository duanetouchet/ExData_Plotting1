## Project 1 - Plot 2
dat <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("NA","?"))

## Fix Date and Time
dat$Time <- strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")

## Clean up data
validData <- !is.na(dat$Date) & !is.na(dat$Time) & !is.na(dat$Global_active_power)
clndat <- dat[validData,]

## Filter for specific needs
subdat <- clndat[clndat$Date=="2007-02-01" | clndat$Date=="2007-02-02",]

## Generate Plot
png(filename="plot2.png", width=480, height=480);
plot(subdat$Time,subdat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off();
