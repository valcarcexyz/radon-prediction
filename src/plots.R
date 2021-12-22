library(ggplot2)     # plots
library(lubridate)   # datetime parsing

############################### time series load  #############################
serie <- read.csv("../data/radon-data.csv")
serie$time <- as_datetime(serie$time)         # convert the dates

#################################### plots #################################### 
# We fix the color for all the plots:
colors <- c("radon" = "black", "state" = "blue",
            "On" = "red", "Off" = "black")

# 1. Complete radon level series
ggplot(serie, aes(x = time, y = radon)) + 
  geom_line() + 
  labs(x = "Time (10 minutes frequency)",
       y = "Radon level (Bq/m³)",
       color = "Legend")
ggsave("../figures/radon_complete_signal.png", width = 10, height = 5)

# 2. Remaining variables 
p1 <- ggplot(serie, aes(x = time, y = temperature)) + geom_line()
p2 <- ggplot(serie, aes(x = time, y = humidity)) + geom_line()
p3 <- ggplot(serie, aes(x = time, y = pressure)) + geom_line()
p4 <- ggplot(serie, aes(x = time, y = tvoc)) + geom_line()
png("../figures/remaining_variables.png", width = 960, height = 480)
gridExtra::grid.arrange(p1, p2, p3, p4, ncol=2)
dev.off()

# 3. Violin plot of radon levels
ggplot(serie, aes(x = 1, y = radon)) +
  geom_violin(trim = FALSE) + 
  geom_boxplot(width = 0.1) +
  theme(axis.text.x = element_blank()) + 
  labs(x = "Density",
       y = "Radon level (Bq/m³)")
ggsave("../figures/radon_violin.png", width = 10, height = 5)

# 4. Ventilation influence
ggplot(serie[c(40000:40500), ], aes(x = time, 
                                    y = radon,
                                    group = 1,
                                    colour = state
                                    )
       ) + 
  geom_line() + 
  labs(x = "Time (10 minutes frequency)",
       y = "Radon level (Bq/m³)",
       color = "Ventilation status") + 
  scale_color_manual(values = colors)
ggsave("../figures/radon_signal_ventilation_influence.png", width = 10, height = 5)













