data <- read.table("C:/SPB_Data/household_power_consumption.txt",header=T,sep = ";",na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date <- as.Date(data$Date,"%d/%m/%Y")
library(dplyr)
fdata <- filter(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
dateTime <- paste(fdata$Date,fdata$Time)
fdata <- cbind(dateTime,fdata)
fdata <- select(fdata,dateTime,Global_active_power,Global_reactive_power,Voltage,
                Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3)
fdata$dateTime <- as.POSIXct(fdata$dateTime)
with(fdata,{plot(dateTime,Sub_metering_1,col="black",type = "l",xlab = "",
                 ylab = "Global Active Power (kilowatts)")
            lines(dateTime,Sub_metering_2,col="red",type = "l")
            lines(dateTime,Sub_metering_3,col="blue",type = "l")
           })
legend("topright",col = c("black","red","blue"),lwd=c(1,1,1),legend = c("Sub_metering_1",
                                                           "Sub_metering_2",
                                                           "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()     