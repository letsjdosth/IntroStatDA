data(randu)
randu #400 triples~ U(0,1), mean 1/2, var 1/12
apply(randu, 2, mean) #2: col-wise
apply(randu, 2, var)
cor(randu)

library(lattice)
cloud(z~x+y, data=randu) #not very random...


#assume that each row is a sample of size 3 from U(0,1)
means = apply(randu, 1, mean)
truehist(means, col="lightblue") #is it N(1/2, 1/36)?
curve(dnorm(x, 1/2, sqrt(1/36)), add=TRUE)

qqnorm(means)
qqline(means)


#for categorical data
x = scan(what="characters")
table(x)
barplot(table(x))
as.factor(x)


