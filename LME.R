chloride <- read.table('chloride.txt',header=T)
str(chloride)

install.packages('lme4')
library(lme4)

chloride.fit1 <- lmer(Cl~Month+Type+(1|Marsh), data=chloride)
summary(chloride.fit1)

chloride.fit2 <- lmer(Cl~Month+Type+(1+Type|Marsh), data=chloride)
summary(chloride.fit2)

anova(chloride.fit1,chloride.fit2)
