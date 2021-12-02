?prcomp

(pr.out <- prcomp(USArrests, scale = TRUE))
round(pr.out$rotation, 3) #loadings

pr.out$sdev^2 / (sum(pr.out$sdev^2)) # variance explained by each PC
biplot(pr.out, scale = 0)


# weakness: 
# 1. interpretion
# 2. in prediction, we need to rerun all PCA