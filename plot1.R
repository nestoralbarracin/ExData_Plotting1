data <- read.table("C:/SPB_Data/household_power_consumption.txt",header=T,sep = ";",na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date,"%d/%m/%Y")
library(dplyr)
fdata <- filter(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
hist(fdata$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)"
     ,main="Global Active Power")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()