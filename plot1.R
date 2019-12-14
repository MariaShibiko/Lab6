#Лабораторна робота № 6.
#Візуалізація споживання електричної енергії. В цій лабораторній роботі ми будемо аналізувати набор даних з UC Irvine Machine Learning Repository – популярного репозиторію для наборів даних для машинного навчання. • Набір даних: Electric power consumption [20Mb] 

power <- read.table('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
pow <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

pow$DateTime <- paste(pow$Date, pow$Time)
pow$Time <- strptime(paste(pow$Date, pow$Time), '%d/%m/%Y %H:%M:%S')
pow$Date <- as.Date(pow$Date, '%d/%m/%Y')

png('plot1.png', width=480, height=480)
hist(pow$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')
dev.off()
