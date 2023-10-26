deliver <- read.table("delivery.txt", header = TRUE, sep = " ")

deliver.model <- lm(time ~ cases + distance, data = deliver)
summary(deliver.model)

yhat <- deliver.model$fit
t <- rstudent(deliver.model)

qqnorm(t)
plot(yhat, t)

plot(deliver$cases, t)
plot(deliver$distance, t)

deliver2 <- cbind(deliver,yhat,t)
write.table(deliver2, "delivery_output.txt", quote = FALSE)
