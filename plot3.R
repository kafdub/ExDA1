t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

t$Date <- as.Date(t$Date, "%d/%m/%Y") # Format date

t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2")) #Filter dataset

t <- t[complete.cases(t),] # Removing incomplete observation 

dateTime <- paste(t$Date, t$Time) #Combine dat and time

dateTime <- setNames(dateTime, "DateTime") #Vector naming
 
t <- t[ ,!(names(t) %in% c("Date","Time"))] #Removing date and time col.
 
t <- cbind(dateTime, t) # Adding time col.
 
t$dateTime <- as.POSIXct(dateTime) #Format date and time col.

#PLOT3
with(t, {
+     plot(Sub_metering_1~dateTime, type="l",
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~dateTime,col='Red')
+     lines(Sub_metering_3~dateTime,col='Blue')
+   })
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
+          c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, file="plot3.png", height=480, width=480)
#dev.off()
