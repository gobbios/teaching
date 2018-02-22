set.seed(123)
pred1 <- round(rnorm(n = 500), 2)
pred2 <- round(rnorm(n = 500), 2)
resp <-  round(1.5 * pred1 - 1 * pred2 + rnorm(n = 500, sd = 10), 2)
xdata <- data.frame(pred1, pred2, resp)
xdata$pred1[sample(1:length(pred1), 3)] <- NA
xdata$pred2[sample(1:length(pred2), 2)] <- NA

write.table(xdata, file="data_files/exampledata01.txt", sep = "\t", row.names = FALSE, quote = FALSE)
