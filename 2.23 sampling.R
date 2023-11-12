
# Problem 2.23
# Consider the simple linear regression model y = 50 + 10 x + ε where ε is NID
# (0, 16). Suppose that n = 20 pairs of observations are used to fit this model.
# Generate 500 samples of 20 observations, drawing one observation for each
# level of x = 1, 1.5, 2, . . . , 10 for each sample.


result <- replicate(500,{
  x <- seq(1, 10, 0.5)
  y <- 50 + 10*x + rnorm(n=19, 0, 16)
  md <- lm(y ~ x)
  c(md$coefficients, predict.lm(md, newdata = list("x" = 5)))
  })

result <- result %>% 
  t %>% 
  data.frame

colnames(result) <- c("beta0", "beta1", "pred")

hist(result$beta0)
hist(result$beta1)
hist(result$pred)
