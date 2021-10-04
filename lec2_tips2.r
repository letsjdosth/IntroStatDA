#pseudo-random number generation
# d (density) /p (prob dist)/q (quantile, inverse cdf)/r (rand)
# if needed, use log-scale

#sample

#seed
set.seed(13) #for reproducing/debugging


#a function is object in R
#lazy evaluation
lazy_f <- function(a, b) {
    return(a) #b is not used
}

lazy_f(3) #no error occurs.

#scope
# R allows free variable (global variable can be used in local scope) 
# BUT YOU SHOULD AVOID FREE VARIABLES.
# (lexical scoping : free variables are searched for in the environment in which the function is 'defined')

b = 4
test_func <- function(...,x=6){ # arguments after .... are only positional
    b=5 #local
    return(x)
}
test_func() #6
test_func(10) #6
b #4

# for
#R vector is very slow to change size/dim. Before loop, allocate the vector's memory first.
# you should always choose a vector operation or 'apply' funtion instead of a 'for' loop
?apply
?lapply
?tapply
?sapply
#apply does NOT guarantee that the code is faster than for-loop
#only improved for rowwise-columnwise operation
# tip: scale / recycle (auto rep, like numpy) are fast but...
?scale
#your code becomes hard to read

add5 <- function(x){
    return(x+5)
}
lapply(c(1,2,3,4,5), add5) #return: list
sapply(c(1,2,3,4,5), add5) #return: vec
