CPUspeed <- read.table("Rx-data/CPUspeed.txt", header = TRUE)
names(CPUspeed)
attach(CPUspeed)

# consider transformation /
# identify outliers and influential points
par(mfrow = c(1, 1))
plot(year, speed)
plot(year, sqrt(speed))


# log(speed)~year
plot(year, log(speed))
L <- lm(log(speed) ~ year)
abline(L)
summary(L)
par(mfrow = c(2, 2))
plot(L)


#variable selection
#Backward elimination : all predictors -> remove (with highest p-value/aic/...
?drop1
#Forward elimination : no predictors -> add (with lowest p-value/aic/...
?add1
#stepwise : combination
?step



#============================================================
data(swiss)
head(swiss) #2^6 (2 to the 6) models are possible
names(swiss)
attach(swiss)
swiss_model <- lm(Fertility~1)
add1(swiss_model, .~Agriculture + Examination + Education + Catholic + Infant.Mortality)
