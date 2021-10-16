bgsu <- read.table("Rx-data/bgsu.txt", header=TRUE)
plot(bgsu)
attach(bgsu)
lmfit <- lm(Enrollment ~ Year)
abline(lmfit)
plot(Year, lmfit$residuals)
abline(h=0) #do not satisfy the assumption on residuals


#transformation

log_Enrollment <- log(Enrollment)
plot(log_Enrollment ~ Year)
loglmfit <- lm(log_Enrollment ~ Year)
abline(loglmfit)
plot(Year, loglmfit$residuals)
abline(h=0) #do not satisfy the assumption on residuals
