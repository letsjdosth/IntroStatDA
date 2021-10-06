ls() #all objects
rm(list=ls())

x=c("hi",3,TRUE)
x #all string
x=c(3,"hi",TRUE)
x
is.character(x)

y = vector("logical",3)
print(y)
y = vector("numeric",4)
print(y)
y = seq(1,8,by=2)
print(y)
y = 3:8
print(y)
y = rep(TRUE,6)
print(y)
y = rep(seq(1,3),2)
print(y)
y = rep(seq(1,3),each=2)
print(y)

is.numeric(y) #work to vectors
is.logical(y)
is.character(y)

length(y)


z = c(0,1,2,3,4,5)
as.logical(z)

z = c(NA, 4, 3, NA, 1)
is.numeric(z)
is.na(z)

0/0 #NAN
Inf #Inf

w = c(1.3, -2.2, 1.15, 0.23, -1.1)
sort(w)
order(w)
rank(w)
?rank
w[order(w)]
w[rank(w)]

#vectors
