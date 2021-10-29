library(bootstrap)
head(scor)
summary(scor)

scor_long <- stack(scor)
block <- factor(rep(1:88, times = 5))

scor_long <- data.frame(scor_long, block)
names(scor_long) <- c("score", "exam", "student")
head(scor_long)

#y_{i,j} = \mu + \alpha_i + \beta_j + \epsilon{i,j}
#               exam effect  student effect
# i : exam
# j : student

# not full rank X matrix -> 2 restrictions (sum(\alpha_i) = 0, sum(\beta_j) = 0)

L <- aov(score~ exam + student, data = scor_long)
summary(L)

#after F test (if significant)
model.tables(L, cterms = "exam")
model.tables(L, cterms = "exam", type = "mean")

CIs <- TukeyHSD(L, which = 1)
plot(CIs, las = 1)




# 2-way anova
poison <- read.csv("Rx-data/poison.csv")

#EDA
interaction.plot(poison$Poison, poison$Treatment,
    response = poison$Time, lwd = 2)
interaction.plot(poison$Treatment, poison$Poison,
    response = poison$Time, lwd = 2)
#if parallel, then we can expect there is no interaction

M <- aov(Time ~ Poison * Treatment, data = poison) # * model with interaction
anova(M)
#interaction is not significant
#so, delete the interaction term.
M1 <- aov(Time ~ Poison + Treatment, data = poison) # * model without interaction
anova(M1)


#using lm : 
model_M <- lm(poison$Time ~ poison$Poison * poison$Treatment)
# y_{ijk} = \mu + \alpha_i + \beta_j + \gamma_{ij} + \epsilon_{ijk}
#restriction: poison1, treatA, interaction(pois1,.), interation(.,treat=1) = 0

anova(model_M)
# F test for interaction
# H0 : \gamma_{ij} = 0 for all i,j
# H1 : At least one \gamma_{ij} \neq 0
# and, if interaction effect is not significant,
# H0 : \alpha_i = 0 for all i
# H1 : At least \alpha_i \neq 0
# and
# H0 : \beta_j = 0 for all j
# H1 : At least \beta_j \neq 0

summary(model_M)
#Again, restriction: poison1, treatA, interaction(pois1,.), interation(.,treat=1) = 0



model_M1 <- lm(poison$Time ~ poison$Poison + poison$Treatment)
anova(model_M1)
summary(model_M1)

diff_M1 <- TukeyHSD(M1, which = c("Poison", "Treatment")) #for aov object
diff_M1
par(mfrow = c(1, 2))
plot(diff_M1)

par(mfrow = c(2, 2))
plot(model_M1)
# become more variability as fitted value increase
# 3 outliers -> not normal, skewed (actually, the data are about 'survival times'(>0))


#transformation
log_M1 <- lm(log(Time) ~ Poison + Treatment, data=poison)
anova(aov(log_M1))
plot(log_M1)

reci_M1 <- lm(1/Time ~ Poison + Treatment, data=poison)
anova(aov(reci_M1))
plot(reci_M1)
