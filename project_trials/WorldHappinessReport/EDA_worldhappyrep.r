library(tidyr)
library(dplyr)
library(readr)
library(ggplot2)

# https://www.kaggle.com/unsdsn/world-happiness?select=2019.csv



world_happy2019 <- read_csv("WorldHappinessReport/2019.csv")
names(world_happy2019) <- c("rank", "country", "score",
    "GDPper1", "socialsupp", "healthlife", "lifechoice", "generosity"," corrupt")
dim(world_happy2019)world_happy2019
summary(world_happy2019)
pairs(world_happy2019[, 3:9])


demo <- read_csv("WorldbankEconomicsDemographics2020/final_demographics_data.csv")
setdiff(world_happy2019$country, demo$country)
setdiff(demo$country, world_happy2019$country)

demo$country[which(demo$country == "United States of America")] <- "United States"
demo$country[which(demo$country == "Viet Nam")] <- "Vietnam"

# Overall rank
# Country or region
# Score
# GDP per capita
# Social support
# Healthy life expectancy
# Freedom to make life choices
# Generosity
# Perceptions of corruption

#add?
#pos
# consumption
# Employment
# gdp growth
# Women Business and the Law Index Score



#neg
# arm
# Military
# Unemployment

#?
# Urban population
# Age dependency ratio, old (% of working-age population)"
# Age dependency ratio, young

median(world_happy2019$score)
world_happy2019$score_categ <- cut(world_happy2019$rank,
    c(0, 52, 104, 156), labels = c("high", "middle", "low"))

world_happy2019$score_categ

ggplot(world_happy2019, aes(x = score, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "blue", alpha = 0.2)

ggplot(world_happy2019, aes(x = GDPper1, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "green", alpha = 0.2) +
    facet_wrap(~score_categ, scales = "fixed")

ggplot(world_happy2019, aes(x = socialsupp, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "green", alpha = 0.2) +
    facet_wrap(~score_categ, scales = "fixed")

ggplot(world_happy2019, aes(x = healthlife, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "green", alpha = 0.2) +
    facet_wrap(~score_categ, scales = "fixed")

ggplot(world_happy2019, aes(x = lifechoice, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "green", alpha = 0.2) +
    facet_wrap(~score_categ, scales = "fixed")

ggplot(world_happy2019, aes(x = generosity, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "green", alpha = 0.2) +
    facet_wrap(~score_categ, scales = "fixed")

ggplot(world_happy2019, aes(x = corrupt, after_stat(density))) +
    geom_histogram(bins = 50) +
    geom_density(fill = "green", alpha = 0.2) +
    facet_wrap(~score_categ, scales = "fixed")


ggplot(world_happy2019, aes(x = GDPper1, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)
ggplot(world_happy2019, aes(x = socialsupp, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)
ggplot(world_happy2019, aes(x = healthlife, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)
ggplot(world_happy2019, aes(x = lifechoice, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)
ggplot(world_happy2019, aes(x = generosity, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)
ggplot(world_happy2019, aes(x = corrupt, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)


# =======================================

joined_consumption <- world_happy2019 %>% left_join(demo[,c(1,31:36)], by = "country")
names(joined_consumption)[10:15] <- c("consexp_percGDP","consexp_groth","consexp_2010USD",
    "consexp_constLCU","consexp_currentLCU","consexp_currentUSC")
# joined_consumption[, 10:15]

ggplot(joined_consumption, aes(x = consexp_percGDP, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_consumption, aes(x = consexp_groth, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)


ggplot(joined_consumption, aes(x = consexp_2010USD, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)



joined_employ <- world_happy2019 %>% left_join(demo[,c(1, 27, 30, 59, 50)], by = "country")
names(joined_employ)[10:13] <- c("emp_total", "emp_young", "unemployment", "totallaborf")

ggplot(joined_employ, aes(x = emp_total, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_employ, aes(x = emp_young, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_employ, aes(x = unemployment, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)


ggplot(joined_employ, aes(x = totallaborf, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)



joined_others <- world_happy2019 %>% left_join(demo[,c(1, 42, 48, 61)], by = "country")
names(joined_others)[10:12] <- c("GDPgrowth","HCI","womenscore")


ggplot(joined_others, aes(x = GDPgrowth, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_others, aes(x = HCI, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_others, aes(x = womenscore, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)


joined_arms <- world_happy2019 %>% left_join(demo[,c(1, 8, 9, 51)], by = "country")
names(joined_arms)[10:12] <- c("armexport", "armimport", "military")

ggplot(joined_arms, aes(x = armexport, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_arms, aes(x = armimport, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

ggplot(joined_arms, aes(x = military, y = score)) +
    geom_point() +
    geom_smooth(method = "loess", se = T, col = "red") +
    geom_smooth(method = "lm", se = F)

