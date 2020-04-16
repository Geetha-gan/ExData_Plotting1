

data_electric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))


Sys.Date()

data_electric$Date <- as.Date(data_electric$Date, "%d/%m/%Y")



req_data_electric <- subset(data_electric, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

req_data_electric$Time <- strptime(req_data_electric$Time, "%H:%M:%S")

dim(req_data_electric)

head(req_data_electric)

colnames(req_data_electric)

hist(req_data_electric$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()