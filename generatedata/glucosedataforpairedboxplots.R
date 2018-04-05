# data generation
set.seed(123)
xdata <- data.frame(gluc = round(c(rnorm(26, mean = 5), rnorm(26, mean = 7)), 2), sex = c("male", "female")[c(rep(1, 26), rep(2, 26))], cond = c("pre", "post"), subj = rep(letters[1:26], each = 2))
str(xdata)
xloc <- c(2, 4, 7, 35, 27, 9)
xdata$gluc[xloc] <- c(12, 3, 13, 14, 2, 10)

# write.table(xdata, file = "data_files/glucose.txt", sep = "\t", row.names = F, quote = F)
