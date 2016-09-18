setwd("data/makingplots")
inFile <- "household_power_consumption.txt"
pwrconsume <- read.table(inFile, header=T, sep=";", na.strings="?")
## set time variable
pwrconsCut <- pwrconsume[pwrconsume$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <-strptime(paste(pwrconsCut$Date, pwrconsCut$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
pwrconsFin <- cbind(dateTime, pwrconsCut)

hist(pwrconsFin$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
