#---- Header ----

#---- Name: plot1.R

#---- Purpose: Generate plot1.png

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

#---- Create plot1 -  Histogram


png("plot1.png", width=480, height=480)

hist(household_subset$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

#---- End---
