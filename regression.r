data(cars)
#50 data points

attach(cars)
L1 <- lm(dist~speed) #y ~ intercept+ speed
print(L1)
names(L1)


plot(cars, pch=19)
abline(L1)

par(mfrow=c(2,2))
plot(L1)
summary(L1) #for test info
# F test statistic: base model : y = intercept + err
# residual standard error : sigma-hat (~~sd. not square)

mean(speed) #15.4
new_x <- data.frame(speed=c(7, 10))
new_x
predict(L1, new_x, interval = "confidence")
predict(L1, new_x, interval = "prediction")


L2 <- lm(dist ~ 0 + speed) #no intercpet
L2
par(mfrow=c(1,1))
plot(cars, pch=19, xlim=c(0,25))
abline(0, L2$coefficients)


# multiple regression
data(trees) #31
cor(trees)
pairs(trees)

attach(trees)
M1 <- lm(Volume ~ Girth)
summary(M1)

M2 <- lm(Volume ~ Girth + Height)
summary(M2)
#F test hypothesis: H0: beta1=beta2=0, H1: at least one coefficient is zero
#F = 255
#the baseline model in R is y_i = b_0 + \epsilon_i
#F test statistic df : (p-1),(n-p) i.e. 2, 31 - 3 (intercept, girth, height)
par(mfrow=c(2,2))
plot(M2)
# U-shape residual
anova(M2)


M3 <- lm(Volume ~ Girth + I(Girth^2) + Height)
summary(M3)
#F = 383.2
plot(M3)
# no pattern on residual
anova(M3)

#compare
anova(M1, M2, M3)
