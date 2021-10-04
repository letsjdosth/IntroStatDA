library(MASS)
data(mammals)
summary(mammals) #compare mean - median

which(is.na(x), arr.ind=TRUE) #identifying missing data
?which #arr.ind=FALSE: value, TRUE: index

boxplot(mammals)
plot(mammals)

boxplot(log(mammals), names=c("log(body)", "log(brain)"))
plot(log(mammals), xlab="log(body)", ylab="log(brain)")

cor(mammals)
cor(log(mammals))
cor(, use="pairwise.complete.obs")

?legend
legend("topleft", c("high","low","middle"), 
    pch=1:3, col=1:3, inset=.02)


mean(brain$Weight) #NA
mean(brain$Weight, na.rm=TRUE)
?by
?pair

#time series data
data(nhtemp)
nhtemp
plot(nhtemp)
lines(lowess(nhtemp), lwd=3, col="red")

difftemp = diff(nhtemp)
plot(difftemp)
lines(lowess(difftemp), lwd=3, col="red")
abline(h=0, lty=3, lwd=2, col="blue")
