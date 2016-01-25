library(dplyr)

#loading in manipulating dataframe - same for all plots

power_raw <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, stringsAsFactors = FALSE)

power_short <- power_raw[power_raw$Date %in% c('1/2/2007', '2/2/2007'),]

power_short[,3:ncol(power_short)] <- power_short[,3:ncol(power_short)] %>% unlist %>% as.numeric() #weiss nicht, warum man 'unlist' machen muss, aber so geht es super!

power_short$date_time <- paste(power_short$Date,' ', power_short$Time) %>% strptime('%j/%m/%Y %T')

power_short$Date <- as.Date(power_short$Date, '%j/%m/%Y')


###############


#plot2


png('plot2.png', width = 480, height = 480, units = 'px')    
plot(x = power_short$date_time, y = power_short$Global_active_power, type = 'l',
     xlab = '',     
     ylab = 'Global Active Power (kilowatts)'
     )
dev.off()

