# data description
# https://www.kaggle.com/sagarnildass/worldbank-economicsdemographics-data

demo <- read.csv("WorldbankEconomicsDemographics2020/final_demographics_data.csv")
demo$Region <- factor(demo$Region)

names(demo)

# country
# Region
# Adults (ages 15+) and children (ages 0-14) newly infected with HIV
# Adults (ages 15-49) newly infected with HIV
# Age dependency ratio (% of working-age population)
# "Age dependency ratio, old (% of working-age population)"
# "Age dependency ratio, young (% of working-age population)"
# Arms exports (SIPRI trend indicator values)
# Arms imports (SIPRI trend indicator values)
# "Automated teller machines (ATMs) (per 100,000 adults)"
# Average transaction cost of sending remittances from a specific country (%)
# Average transaction cost of sending remittances to a specific country (%)
# Bank capital to assets ratio (%)
# Bank liquid reserves to bank assets ratio (%)
# Bank nonperforming loans to total gross loans (%)
# "Charges for the use of intellectual property, payments (BoP, current US$)"
# "Charges for the use of intellectual property, receipts (BoP, current US$)"
# "Commercial bank branches (per 100,000 adults)"
# "Computer, communications and other services (% of commercial service exports)"
# "Computer, communications and other services (% of commercial service imports)"
# Consumer price index (2010 = 100)
# Domestic credit provided by financial sector (% of GDP)
# Domestic credit to private sector (% of GDP)
# Domestic credit to private sector by banks (% of GDP)
# "Employment to population ratio, 15+, female (%) (national estimate)"
# "Employment to population ratio, 15+, male (%) (national estimate)"
# "Employment to population ratio, 15+, total (%) (national estimate)"
# "Employment to population ratio, ages 15-24, female (%) (national estimate)"
# "Employment to population ratio, ages 15-24, male (%) (national estimate)"
# "Employment to population ratio, ages 15-24, total (%) (national estimate)"
# Final consumption expenditure (% of GDP)
# Final consumption expenditure (annual % growth)
# Final consumption expenditure (constant 2010 US$)
# Final consumption expenditure (constant LCU)
# Final consumption expenditure (current LCU)
# Final consumption expenditure (current US$)
# Fixed broadband subscriptions
# Fixed broadband subscriptions (per 100 people)
# Fixed telephone subscriptions
# Fixed telephone subscriptions (per 100 people)
# GDP (constant 2010 US$)
# GDP growth (annual %)
# GDP per capita (constant 2010 US$)
# GNI (constant 2010 US$)
# GNI growth (annual %)
# GNI per capita (constant 2010 US$)
# High-technology exports (current US$)
# Human capital index (HCI) (scale 0-1)
# Individuals using the Internet (% of population)
# "Labor force, total"
# Military expenditure (% of GDP)
# Population density (people per sq. km of land area)
# Population growth (annual %)
# "Population, female"
# "Population, male"
# "Population, total"
# Ratio of female to male labor force participation rate (%) (national estimate)
# "Total reserves (includes gold, current US$)"
# "Unemployment, total (% of total labor force) (modeled ILO estimate)"
# Urban population
# Women Business and the Law Index Score (scale 1-100)


summary(demo)
pairs(demo[,-1])
