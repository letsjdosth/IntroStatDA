?density

?lines


library(MASS)
?geyser
names(geyser)
attach(geyser)

?kde2d
f1 <- kde2d(duration, waiting, n = 50, lims = c(0.5, 6, 40, 110))
image(f1)
f2 <- kde2d(duration, waiting, h = 0.5, n = 50, lims = c(0.5, 6, 40, 110))
image(f2)


