
 t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
> t$Date <- as.Date(t$Date, "%d/%m/%Y") # Format date
> t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2")) #Filter dataset
> 
> t <- t[complete.cases(t),] # Removing incomplete observation 
> 
> dateTime <- paste(t$Date, t$Time) #Combine dat and time
> 
> dateTime <- setNames(dateTime, "DateTime") #Vector naming
> 
> t <- t[ ,!(names(t) %in% c("Date","Time"))] #Removing date and time col.
> 
> t <- cbind(dateTime, t) # Adding time col.
> 
> t$dateTime <- as.POSIXct(dateTime) #Format date and time col.
> 
>  hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
>
> #PLOT2
> t(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
>
>  #dev.copy(png,"plot2.png", width=480, height=480)
>  #dev.off()
