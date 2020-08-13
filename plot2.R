#---- Header ----

#---- Name: plot2.R

#---- Purpose: Generate plot2.png

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


#---- Create plot2 -  Time series graph


png("plot2.png", width=480, height=480)

plot(x = household_subset$date_time, y = household_subset$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()



