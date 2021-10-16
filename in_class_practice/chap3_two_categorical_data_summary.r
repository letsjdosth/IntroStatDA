# Q : How much will an additional year of schooling raise one's income?
# they are independent?

twn <- read.table("Rx-data/twins.dat.txt", header=TRUE, sep=",", na.strings=".")
c.EDUCL = cut(twn$EDUCL, breaks=c(0, 12, 15, 16, 24), labels=c("High School", "Some College", "College Degree", "Graduate School"))
c.EDUCH = cut(twn$EDUCH, breaks=c(0, 12, 15, 16, 24), labels=c("High School", "Some College", "College Degree", "Graduate School"))
c.wage = cut(twn$HRWAGEL, c(0, 7, 13, 20, 150))

#barplot
#mosicplot
#table : contingency table


#H0 : indep or same dist

T2 <- table(c.EDUCL, c.wage)
T2 
chisq.test(T2) #too low expected values make the warning message (recomm: >5)

A <- matrix(rep(rowSums(T2), 4), 4, 4, byrow = T)
A
B <- matrix(rep(colSums(T2), 4), 4, 4)
B
Expected <- t(A * B / sum(T2)) # rowTotal * columnTotal / grandTotal
Expected

chisq_stat <- sum((T2 - Expected)^2 / Expected)
p_val <- 1 - pchisq(chisq_stat, df = (4 - 1) * (4 - 1))


residuals <- (T2 - Expected) / sqrt(Expected)
residuals
# approximately normal.
# abs>2 ? less p