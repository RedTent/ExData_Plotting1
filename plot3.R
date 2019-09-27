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


png("plot3.png")

plot(x = data$datetime, 
     y = data$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = data$datetime, 
      y = data$Sub_metering_2,
      col = "red")

lines(x = data$datetime, 
      y = data$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
