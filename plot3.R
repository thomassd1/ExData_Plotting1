setwd("data/makingplots")
inFile <- "household_power_consumption.txt"
pwrconsume <- read.table(inFile, header=T, sep=";", na.strings="?")

pwrconsCut <- pwrconsume[pwrconsume$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <-strptime(paste(pwrconsCut$Date, pwrconsCut$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
pwrconsFin <- cbind(dateTime, pwrconsCut)

plot(pwrconsFin$dateTime, pwrconsFin$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(pwrconsFin$dateTime, pwrconsFin$Sub_metering_2, col="red")
lines(pwrconsFin$dateTime, pwrconsFin$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid", cex = 0.75)

dev.copy(png, file = "plot3.png")
dev.off()
