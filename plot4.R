library(dplyr)

#loading in manipulating dataframe - same for all plots

power_raw <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)

power_short <- power_raw[power_raw$Date %in% c('1/2/2007', '2/2/2007'),]

power_short[,3:ncol(power_short)] <- power_short[,3:ncol(power_short)] %>% unlist %>% as.numeric() #weiss nicht, warum man 'unlist' machen muss, aber so geht es super!

power_short$date_time <- paste(power_short$Date,' ', power_short$Time) %>% strptime('%j/%m/%Y %T')

power_short$Date <- as.Date(power_short$Date, '%j/%m/%Y')


###############


#plot4

png('plot4.png', width = 480, height = 480, units = 'px') 
par(mfrow = c(2,2), cex = 0.75)
plot(x = power_short$date_time, y = power_short$Global_active_power, type = 'l',
     xlab = '',     
     ylab = 'Global Active Power (kilowatts)'
)
with(power_short, plot(date_time, Voltage, type = 'l' ))
plot(x = power_short$date_time, y = power_short$Sub_metering_1, type = 'l',  xlab = '', ylab = 'Energy sub metering')
lines(power_short$date_time, power_short$Sub_metering_2, col = 'red')
lines(power_short$date_time, power_short$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')
with(power_short, plot(date_time, Global_reactive_power, type = 'l' ))
dev.off() 