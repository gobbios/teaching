set.seed(123)

pred1a <- rnorm(50, -3)
pred1b <- rnorm(50, -1.5)
pred1c <- rnorm(50, 0)
pred1d <- rnorm(50, 1.5)
pred1e <- rnorm(50, 3)

pred2a <- sort(rnorm(50, 3, 0.5))
pred2b <- sort(rnorm(50, 1.5, 0.5))
pred2c <- sort(rnorm(50, 0, 0.5))
pred2d <- sort(rnorm(50, -1.5, 0.5))
pred2e <- sort(rnorm(50, -3, 0.5))


xdata <- data.frame(pred1 = c(pred1a, pred1b, pred1c, pred1d, pred1e), pred2 = c(pred2a, pred2b, pred2c, pred2d, pred2e))

xdata$resp <- xdata$pred1 * (-0.5) + xdata$pred2 * (-2) + rnorm(nrow(xdata))

xdata <- round(xdata, 2)

write.table(xdata, file = "data_files/multipleregressionextreme.txt", sep = "\t", row.names = FALSE, quote = FALSE)
