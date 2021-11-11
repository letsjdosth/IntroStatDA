#dose 1,2,4,8,16,32 levels
#sex M,F levels
# batches: 20 for each combination

# y_{i,j} ~ binomial(n_{ij}, \theta_{ij})
# i=1,2
# j=1,2,3,4,5,6
# logit(\theta_{ij}) = log(\theta_{ij}/(1-\theta_{ij}))
#                    = \mu + \delta_i + (\beta + \gamma_i) x_j
#                                                   interaction

ldose <- rep(0:5, 2)
numdead <- c(1, 4, 9, 13, 18, 20, 0, 2, 6, 10, 12, 16)
sex <- factor(rep(c("M", "F"), c(6, 6)))

SF <- cbind(numdead, numalive = 20 - numdead)

M1 <- glm(SF ~ sex * ldose, family = binomial)

summary(M1)
#baseline: sexF (\delta_{female}=0, \gamma_{female}=0)
#sexF : intercept ( 0.9060 )*ldose
#sexM : intercept + 1* 0.1750 + ( 0.9060 + 0.3529 * 1)*ldose

#sexM:ldose and sexM are not statistically significant 
# -> slope and intercept are not different for each sex.

#deviance df : N-p = 12-p. null: only intercept model(p=1) vs alt: 4 params (mu, \delta_M, \beta, \gamma_M)


#plot : dose vs prob, two curves(for M and F)


#no interaction effect model
# y_{i,j} ~ binomial(n_{ij}, \theta_{ij})
# i=1,2
# j=1,2,3,4,5,6
# logit(\theta_{ij}) = log(\theta_{ij}/(1-\theta_{ij}))
#                    = \mu + \delta_i + \beta * x_j
#baseline: sexF (\delta_{female}=0)

M2 <- glm(SF ~ sex + ldose, family = binomial)
summary(M2)
