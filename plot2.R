library(tidyverse)
library(lubridate)

data <- 
  read_delim("data/household_power_consumption.txt", delim = ";", na = "?", 
                   col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                    Time = col_time("%H:%M:%S"))) %>% 
  filter(Date >= ymd("20070201"), Date <= ymd("20070202")) 


data <- 
  data %>% 
  mutate(datetime = make_datetime(year(Date), month(Date), day(Date), hour(Time), minute(Time)))


png("plot2.png")

plot(x = data$datetime, 
     y = data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
