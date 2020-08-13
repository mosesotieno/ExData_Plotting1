#---- Header ----

#---- Name: plot4.R

#---- Purpose: Generate plot4.png

#---- Aurthor: Moses Otieno

#---- Date : 13 Aug 2020


#---- Libraries

library(tidyverse)


#---- Import and prepare data

household_power_consumption <- read_delim("data/household_power_consumption.txt",
                                          ";", escape_double = FALSE, trim_ws = TRUE,
                                          na = c("", "NA", "?"))

household_subset <- household_power_consumption %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date >= "2007-02-01", Date<= "2007-02-02")



summary(household_subset)
str(household_subset)


household_subset <- household_subset %>%
  mutate(date_time = as.POSIXct(paste(Date, Time))
  )


#---- Create plot3 -  Time series graph


png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))


#---- First plot

plot(x = household_subset$date_time, y = household_subset$Global_active_power,
     type="l", xlab="", ylab="Global Active Power")

#---- Second plot

plot(x = household_subset$date_time,y = household_subset$Voltage,
     type="l", xlab="datetime", ylab="Voltage")

#---- Third plot


plot(x = household_subset$date_time, y = household_subset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x = household_subset$date_time, y = household_subset$Sub_metering_2, col="red")
lines(x = household_subset$date_time, y = household_subset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), bty="n", cex=.5)

#---- Forth plot

plot(x = household_subset$date_time, y = household_subset$Global_reactive_power,
     type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

