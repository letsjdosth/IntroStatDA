#t-test

?t.test

# 2-sample t tests
?var.test #equal varlaince?

?t.test
# default t.test assumes unequal variances between two groups
# (welch two sample t-test)
t.test(x, y) # (estimate 2 variance paratmeters) 

t.test(x, y, var.equal = TRUE) #equal variance #(estimate 1 common variance)
# unequal variance case's df is often smaller than var.equal case's.


# paired 2 test (non indep, paired data case)
t.test(x, y, paired = TRUE)



# proportions / nonparametric / permutation based two-sample infernce
# -> read book
