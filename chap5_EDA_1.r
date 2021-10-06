#EDA
# general themes
# - Revelation : display graphic
# - Resistance : robust (methods insensitive to extreme obs)
# - Residual : focus is not on the fitted model but on the deviation from that model
# - Reexpression : transform the data to see patterns that cannot be seen in the original scale

college <- read.table("Rx-data/college.txt", header=TRUE, sep = "\t")
college <- subset(college, complete.cases(college))

stripchart(college$Retention, method="stack", pch=19, xlab="Retention Percentage")
stripchart(Retention ~ Tier, method="stack", pch=19, xlab="Retention Percentage",
    ylab="Tier", xlim=c(50, 100), data=college)

identify(college$Retention, college$Tier, n=2, labels=college$School)

b.output = boxplot(Retention ~ Tier, data=college, horizontal=TRUE, ylab="Tier", xlab="Retention")
b.output$stats #[2, ] 1st quartile, median, 3st quartille
b.output$out #outliers
b.output$group

plot(college$Retention, college$Grad.rate, xlab="Retention", ylab="Graduation Rate")
fit <- line(college$Retention, college$Grad.rate) #Tukey's resistant line
abline(coef(fit))

#non-robust case
coef(lm(college$Grad.rate ~ college$Retention))
abline(lm(college$Grad.rate ~ college$Retention), col="red")

plot(college$Retention, fit$residuals, xlab="Retention", ylab="Residual")
abline(h=0)

identify(college$Retention, fit$residuals, n=2, labels=college$School)
?identify


