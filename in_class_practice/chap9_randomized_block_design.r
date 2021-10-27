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
interaction.plot(poison$Poison, poison$Treatment, response=poison$Time, lwd=2)
interaction.plot(poison$Treatment, poison$Poison, response=poison$Time, lwd=2)
#if parallel, then we can expect there is no interaction

M <- aov(Time ~ Poison * Treatment, data = poison) # * model with interaction
anova(M)
#interaction is not significant

M1 <- aov(Time ~ Poison + Treatment, data = poison) # * model without interaction
anova(M1)


model_M <- lm(poison$Time ~ poison$Poison * poison$Treatment)
summary(model_M)
#restriction: poison1, treatA, interaction(pois1,.), interation(.,treat=1) = 0