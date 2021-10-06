#matrices

S = matrix(c(1, 0.5, 1.3, 0.4, -1, 0.2, 0.5, -1, 0.6), 3, 3)
S
apply(S,2,sum) #col
apply(S,1,sum) #row
S
S[,3]

#solve
solve(S) #inverse
x = c(0,1,2)
solve(S,x) # solution of Sb=x


#apply
?apply
mat1 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), 3, 3)
mat1
apply(mat1, MARGIN = 1, sum)
apply(mat1, MARGIN = 2, sum) #col wise

addfunc <- function(x, y) {
    sum(x) + y
}

apply(mat1, MARGIN = 1, sum)
apply(mat1, MARGIN = 1, addfunc, 10)
apply(mat1, MARGIN = 1, addfunc, c(10,20,30))


#sweep
?sweep
mat2 <- matrix(1:16, 4, 4)
require(stats)
sweep(mat2, MARGIN=1, STATS="m", fun="-") #?????

# list script
testlist <- list("california", c(1,3,5,1), 92, TRUE)
testlist[[1]]
testlist[[c(2, 4)]]
testlist[[2]][4]

testlist2 <- list(state = "CA", co = c(1, 3, 5, 1), loc = 92)
testlist2
testlist2$state
testlist2[["state"]]
testlist2["state"]


data(faithful)
strver <- str(faithful)
list(strver) #not working
hist_faithful <- hist(faithful$waiting)
names(hist_faithful)

#factor : for categorical variable
testfactor <- factor(c("CA","NE","OR","CA","OR","CA"))
testfactor
table(testfactor)


testfactor2 = factor(c(1,4,3,5,4,2,4), levels=c(1,2,3,4,5,6), 
    labels=c("one","two","three","four","five","six"))
testfactor2
table(testfactor2)


#str
?paste
?substr


#stack/unstack
x = data.frame(matrix(seq(1, 120), ncol = 2))
x
w = stack(x)
w
unstack(w)
