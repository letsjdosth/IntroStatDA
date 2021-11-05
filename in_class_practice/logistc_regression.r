no.yes = c("No", "Yes")
smoking = gl(2, 1, 8, no.yes)
obesity = gl(2, 2, 8, no.yes)
snoring = gl(2, 4, 8, no.yes)
?gl

n.tot = c(60, 17, 8, 2, 187, 85, 51, 23)
n.hyp = c(5, 2, 1, 0, 35, 13, 15, 8)
hypertension = data.frame(smoking, obesity, snoring, n.tot, n.hyp)
#total number / the number of caess
hypertension

#yes-hyp vs no-hyp table
hyp.table = cbind(hypertension$n.hyp, hypertension$n.tot - hypertension$n.hyp)
hyp.table

M1 = glm(hyp.table ~ smoking + obesity + snoring, family=binomial("logit"))
# family: link function

summary(M1)
# 1. parameters (odds-ratio)
# intercept: basic reference case
#   (in this case, no-smoking, no-obesity, no-snoring)
# t-test : same as lin.model
# 2. residual deviance (df : rel to #class)
# 3. AIC, ... (for model comparison)

anova(M1)

M2 = glm(hyp.table ~ obesity + snoring, family = binomial("logit"))
