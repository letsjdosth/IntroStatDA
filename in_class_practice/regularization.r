##
## SEE slides!
##

library(glmnet)

# do standardization

swiss
names(swiss)

model_glmnet <- glmnet(swiss[, -1], swiss[, 1])
plot(model_glmnet) # give lamda-Error plot. choose lambda! (1se? min? 0(==LSE)?)
model_glmnet
summary(model_glmnet)


# after lasso selection,
# it is highly recommended to fit LSE with remained variables additionally
# (they give different estimate values)

