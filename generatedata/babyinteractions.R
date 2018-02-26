library(babynames)
xdata <- as.data.frame(babynames)

tail(xdata)
xdata <- xdata[xdata$year == 2015, ]
xdata <- xdata[order(xdata$n, decreasing = TRUE), ]
xdata <- xdata[1:20, ]
xdata
xdata$name <- as.character(xdata$name)

set.seed(123)

babyages <- data.frame(subject = xdata$name, sex = xdata$sex)
babyages <- babyages[-c(sample(1:nrow(babyages), 1)), ]; rownames(babyages) <- NULL

babyages$age = as.numeric(babyages$sex) + round(runif(nrow(babyages), -1, 2), 2)

wilcox.test(age ~ sex, babyages, paired = F)

xd <- matrix(ncol = 3, nrow = 200)
for(i in 1:nrow(xd)) {
  foc <- sample(xdata$name, 1)
  xd[i, 1] <- foc
  partner <- sample(xdata$name, 1)
  if(runif(1) > 0.5) {
    xd[i, 2] <- foc
    xd[i, 3] <- partner
  } else {
    xd[i, 2] <- partner
    xd[i, 3] <- foc
  }
  if(runif(1) > 0.98) xd[i, 2] <- xd[i, 3]
  if(runif(1) > 0.97) xd[i, 1] <- sample(xdata$name, 1)
}
xdata <- as.data.frame(xd)
colnames(xdata) <- c("focal", "actor", "receiver")
xdata$duration <- rpois(nrow(xdata), lambda = 10)
head(xdata)


table(xdata$duration)

write.table(xdata, file = "data_files/babyinteractions.txt", sep = "\t", row.names = FALSE, quote = FALSE)
write.table(babyages, file = "data_files/babyages.txt", sep = "\t", row.names = FALSE, quote = FALSE)







