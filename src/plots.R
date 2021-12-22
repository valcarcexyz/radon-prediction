library(ggplot2)     # plots
library(lubridate)   # datetime parsing

############################### time series load  #############################
serie <- read.csv("../data/radon-data.csv")
serie$time <- as_datetime(serie$time)         # convert the dates

#################################### plots #################################### 
# 1. Complete radon level series
ggplot(serie, aes(x = time, y = radon)) + 
  geom_line() + 
  labs(x = "Time (10 minutes frequency)",
       y = "Radon level (Bq/m³)",
       color = "Legend")
ggsave("../figures/radon_complete_signal.png", width = 10, height = 5)

