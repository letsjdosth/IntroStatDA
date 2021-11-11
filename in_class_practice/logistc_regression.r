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
# 2. residual deviance (df : rel to #class). only intercept model(null) vs our model now(alternative)
# 3. AIC, ... (for model comparison)

anova(M1) #analysis of 'deviance'

M2 = glm(hyp.table ~ obesity + snoring, family = binomial("logit"))
summary(M2)
anova(M2)
anova(M2, test="Chisq")

# Terms added sequentially (first to last)


#         Df Deviance Resid. Df Resid. Dev Pr(>Chi)
# NULL                        7    14.1259
# obesity  1   6.8260         6     7.2999 0.008984 ** # null vs intercept+obesity
# snoring  1   5.6218         5     1.6781 0.017738 *  # intercept+obesity vs intercept+obesity+snoring


#Odds-estimates
exp(cbind(Or = coef(M2), confint(M2)))
# 'odds ratio per unit change in the covariate'


