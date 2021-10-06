# H0 : all probabilities for each day are the same.

accidents <- c(20, 20, 22, 22, 29, 36, 31)
sum(accidents) # 180
expected_accidents <- rep(180 / 7, 7)
expected_accidents

chi_statistic <- sum((accidents - expected_accidents)^2 / expected_accidents)
chi_statistic

p_val <- 1 - pchisq(chi_statistic, 7 - 1)
p_val


# ====

chisq.test(accidents) #default p : uniform
#syntax: chisq.test(x, p, ...)
