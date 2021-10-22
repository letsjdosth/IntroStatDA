
flicker <- read.table("Rx-data/flicker.txt", header=TRUE)
head(flicker)
names(flicker)
flicker$Colour <- as.factor(flicker$Colour)
plot(flicker)
meansd <- function(x) c(mean = mean(x), sd = sd(x))
by(flicker$Flicker, flicker$Colour, FUN = meansd)

oneway.test(Flicker ~ Colour, data = flicker)
oneway.test(Flicker ~ Colour, data = flicker, var.equal = TRUE)

L <- lm(Flicker ~ Colour, data = flicker)
summary(L) #now, baseline model is 'blue eyes'
#model: y = mu + delta_i + epsilon_i,j
# mu(intercept) : mean of blue
# delta_1 : difference in means of blue and brown
# delta_2 : difference in means of blue and green

# t-test: H0: delta_i=0 vs H1: delta_i!=0, for i=1,2
# f-test : H0: delta_1=delta_2=0, H1: otherwise
# f test == oneway.test(var.equal=TRUE)

#X matrix of L
model.matrix(L)

#anova table (for F test/p-value)
anova(L) #residual standard error = sqrt(MSE)


par(mfrow=c(2,2))
plot(L)

#testing
pairwise.t.test(flicker$Flicker, flicker$Colour, p.adjust.method = "bonferroni")
?pairwise.t.test
?p.adjust

TukeyHSD(aov(flicker$Flicker ~ flicker$Colour))
par(mfrow = c(1,1))
plot(TukeyHSD(aov(flicker$Flicker ~ flicker$Colour)))

# without intercept
L1 <- lm(Flicker ~ Colour - 1, data = flicker)
summary(L1)
# y_ij = mu_i + epsilon_ij
# mu_i : each group's mean

# t test: H0: mu_i=0, H1: mu_i!=0, i=1,2,3
# Careful with the interpretation of the F test, the R-square results
# (what is baseline model of F-test??? <- unknown...
# (why R^2 is too high??? <- because R calculate the value wrongly


