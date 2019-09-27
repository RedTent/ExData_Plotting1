library(tidyverse)
library(lubridate)

data <- 
  read_delim("data/household_power_consumption.txt", delim = ";", na = "?", 
                   col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                    Time = col_time("%H:%M:%S"))) %>% 
  filter(Date >= ymd("20070201"), Date <= ymd("20070202")) 



data$Global_active_power %>% hist(main = "Global Active Power", 
                                  xlab = "Global Active Power (kilowatts)",
                                  col = "red")


png("plot1.png")

data$Global_active_power %>% hist(main = "Global Active Power", 
                                  xlab = "Global Active Power (kilowatts)",
                                  col = "red")

dev.off()
