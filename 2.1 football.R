football <- read.table("b.1 football.txt", header = TRUE)

# y : Games won (per 14 - game season)
# x1 : Rushing yards (season)
# x2 : Passing yards (season)
# x3 : Punting average (yards/punt)
# x4 : Field goal percentage (FGs made/FGs attempted 2season)
# x5 : Turnover differential (turnovers acquired – turnovers lost)
# x6 : Penalty yards (season)
# x7 : Percent rushing (rushing plays/total plays)
# x8 : Opponents ’ rushing yards (season)
# x9 : Opponents ’ passing yards (season)

library(stringr)
library(magrittr)

# football$x5 <- as.numeric(str_replace(football$x5, "−", "-"))
str(football)

md2.1 <- lm(y ~ x8, data = football)
print(md2.1)
# summary(md2.1)

anova(md2.1)

b1 <- md2.1$coefficients["x8"]
se.b1 <- summary(md2.1)$coefficients["x8","Std. Error"]
df <- md2.1$df.residual

c(b1 + qt(c(0.025, 0.975), df)*se.b1) %>% 
  round(4)

summary(md2.1)$r.squared %>% 
  round(4)

predict.lm(md2.1, newdata = list("x8" = c(2000)), interval = "confidence")

           