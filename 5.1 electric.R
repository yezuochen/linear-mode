#### Applied Linear Regression ####
### Introduction to Linear Regression Analysis ####

library(magrittr)
library(MASS)

### ch5 Transformations and Weighting to Correct Model Inadequacies ####

## Example 5.1 The Electric Utility Data ####

setwd("C:/Users/zuoch/OneDrive/Desktop/Applied Regression Analysis")

electric <- read.table("electric.txt", header = TRUE, row.names = "Customer",
                       col.names = c("Customer", "Usage", "Demand"))

md1 <- lm(Demand ~ Usage, data = electric) 
summary(md1)

# table 5.3
anova(md1)

# Figure 5.1 ####

with(electric, plot(Usage, Demand, 
                    main = "Scatter diagram of the energy demand (kW) versus energy usage (kWh)",
                    pch = 19))

# square root transformation ####
electric$Demand_root <- (electric$Demand)^0.5

md2 <- lm(Demand_root ~ Usage, data = electric)
summary(md2)
anova(md2)

MASS::studres(md1)

# Figure 5.2 ####
plot(md1$fitted.values, rstudent(md1), pch = 19, 
     xlab = expression(hat(y[i])), ylab = expression(t[i]),
     main = expression(paste("Plot of R - student values ",t[i]," versus fitted values ",hat(y[i]))))
abline(h = c(-2,2), lwd = 2, lty = 2)

# Figure 5.3 ####
plot(md2$fitted.values, rstudent(md2), pch = 19, 
     xlab = expression(hat(y[i]^{"*"})), ylab = expression(t[i]),
     main = expression(paste("Plot of R - student values ",t[i]," versus fitted values ",hat(y[i])," for the transformed data")))
abline(h = c(-2,2), lwd = 2, lty = 2)
expression(beta)


plot(md2$fitted.values, rstudent(md2), pch = 19, 
     xlab = "fitted demand", ylab = expression(beta+hat(y[i])))
