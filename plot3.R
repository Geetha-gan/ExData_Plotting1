data_electric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


Sys.Date()

data_electric$Date <- as.Date(data_electric$Date, "%d/%m/%Y")



req_data_electric <- subset(data_electric, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


dim(req_data_electric)

head(req_data_electric)

colnames(req_data_electric)

date_time <- paste(as.Date(req_data_electric$Date), req_data_electric$Time)
req_data_electric$date_time <- as.POSIXct(date_time)

with(req_data_electric, { plot(Sub_metering_1 ~ date_time, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(Sub_metering_2 ~ date_time, col = "red")
lines(Sub_metering_3 ~ date_time, col = "blue")
})
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
