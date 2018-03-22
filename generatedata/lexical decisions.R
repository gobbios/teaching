library(languageR)
data("lexdec")
xdata <- lexdec
head(xdata)

xd <- xdata[xdata$Trial < 0, ]
xdata <- xdata[xdata$FreqSingular < 500, ]
xdata <- xdata[xdata$RT < 7.31, ]

set.seed(123)
for(i in 1:nlevels(xdata$Subject)) {
  temp <- xdata[xdata$Subject == levels(xdata$Subject)[i] & xdata$PrevCorrect == "correct", ]
  # temp <- xdata[xdata$Subject == levels(xdata$Subject)[i] & xdata$PrevType == "word", ]
  xline <- sample(which(temp$Class == "animal"), 1)
  xd <- rbind(xd, temp[xline, ])
  xline <- sample(which(temp$Class == "plant"), 1)
  xd <- rbind(xd, temp[xline, ])
  temp <- xdata[xdata$Subject == levels(xdata$Subject)[i] & xdata$PrevCorrect == "incorrect", ]
  # temp <- xdata[xdata$Subject == levels(xdata$Subject)[i] & xdata$PrevType == "nonword", ]
  xline <- which(temp$Class == "animal")
  if(length(xline) == 1) {
    xd <- rbind(xd, temp[xline, ])
  }
  if(length(xline) > 1) {
    xd <- rbind(xd, temp[sample(xline, 1), ])
  }

  xline <- which(temp$Class == "plant")
  if(length(xline) == 1) {
    xd <- rbind(xd, temp[xline, ])
  }
  if(length(xline) > 1) {
    xd <- rbind(xd, temp[sample(xline, 1), ])
  }
}

xdata <- xd[, c("Subject", "RT", "Sex", "NativeLanguage", "PrevType", "Class", "FreqSingular", "Word", "Length")]
xdata$RT <- round(exp(xdata$RT))
head(xdata)

colnames(xdata) <- c("subject", "rt", "sex", "native", "prevtype", "wordclass", "freq", "word", "length")
write.table(xdata, file = "data_files/lexicaldecisions.txt", quote = FALSE, sep = "\t", row.names = FALSE)
