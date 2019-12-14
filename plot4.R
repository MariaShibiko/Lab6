#Лабораторна робота № 6.
#Візуалізація споживання електричної енергії. В цій лабораторній роботі ми будемо аналізувати набор даних з UC Irvine Machine Learning Repository – популярного репозиторію для наборів даних для машинного навчання. • Набір даних: Electric power consumption [20Mb] 

power <- read.table('E://R//household_power_consumption.txt', sep = ';', header = TRUE, na.strings = '?')
pow <- subset(power, Date == '1/2/2007' | Date == '2/2/2007')

pow$DateTime <- paste(pow$Date, pow$Time)
pow$Time <- strptime(paste(pow$Date, pow$Time), '%d/%m/%Y %H:%M:%S')
pow$Date <- as.Date(pow$Date, '%d/%m/%Y')

png('plot4.png', width=480, height=480)
par(mfrow = c(2, 2))

plot(pow$Time, pow$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')

plot(pow$Time, pow$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(pow$Time, pow$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
lines(pow$Time, pow$Sub_metering_2, type = 'l', col = 'red')
lines(pow$Time, pow$Sub_metering_3, type = 'l', col = 'blue')
colours <- c('black', 'red', 'blue')
leg <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legend('topright', lty = 1, col = colours, legend = leg)

plot(pow$Time, pow$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = 'Global Reactive Power')
dev.off()
