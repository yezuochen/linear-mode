# Applied Regression Analysis HW1 ####
# NCCU STAT 112354016

library(readxl)
library(magrittr)
library(car)

# Problems 3.17 ####

setwd("C:/Users/zuoch/OneDrive/Desktop/Applied Regression Analysis")
patient <- read_xlsx("patient.xlsx")

## section 2.7 simple lm ####

with(patient,
     plot(Severity, Satisfaction))

aov(Satisfaction ~ Severity, data = patient) %>% 
  summary

md1 <- lm(Satisfaction ~ Severity, data = patient)

anova(md1)
summary(md1)

plot(md1$fitted.values, md1$model[["Satisfaction"]], 
     xlim = c(20,110), ylim = c(20,110),
     xlab = "Satisfaction Predicted", ylab = "Satisfaction Actual",
     main = "Actual by Predicted Plot", sub = "regressor: Severity")
abline(a=0,b=1)
abline(h = mean(patient$Satisfaction), lty = 2)

## Section 3.6 multiple lm ####

aov(Satisfaction ~ Age + Severity, data = patient) %>% 
  summary

md2 <- lm(Satisfaction ~ Age + Severity, data = patient)

anova(md2)
summary(md2)

plot(md2$fitted.values, md2$model[["Satisfaction"]], 
     xlim = c(20,110), ylim = c(20,110),
     xlab = "Satisfaction Predicted", ylab = "Satisfaction Actual",
     main = "Actual by Predicted Plot", sub = "using Age, Severity")
abline(a=0,b=1)
abline(h = mean(patient$Satisfaction), lty = 2)

# Poblem 3.25 ####

md.f <- lm(Satisfaction ~ ., data = patient)
summary(md.f)

# use car package
linearHypothesis(md.f, c("Age = Severity", 
                         "Severity = `Surgical-Medical`", 
                         "`Surgical-Medical` = Anxiety"))

md.a <- lm(Satisfaction ~ I(Age+Severity+`Surgical-Medical`+Anxiety), data = patient)
summary(md.a)
anova(md.a)

linearHypothesis(md.f, c("Age = Severity", 
                 "Severity = `Surgical-Medical`"))

md.b <- lm(Satisfaction ~ I(Age+Severity) + I(`Surgical-Medical`+Anxiety), data = patient)
summary(md.b)
anova(md.b)

linearHypothesis(md.f, c("Age - 2*Severity = 4*`Surgical-Medical`", 
                         "Age + 2*Severity = 0"))

md.c <- lm(Satisfaction ~ I(2*Age-Severity+`Surgical-Medical`) + Anxiety, data = patient)
summary(md.c)
anova(md.c)

                 