#making grid

x <- seq(-2, 2, length = 50)
y <- seq(-2, 2, length = 50)
grid <- expand.grid(x, y)
added_grid <- outer(x, y, "+")
#avoid 'for'. use vectorize version or builtin functions


#if
#if/then/else statements are not vectorized,
#but ifelse(condition, when_true, when_false) is vectorized.
x <- c(1, 3, -1)
ifelse(x < 2, "hello", "bye")
ifelse(x < 2, ifelse(x < 0, "hello", ""), "bye")


#save
#whole session
save.image("test.Rdata")
#objects
save(x, files="")

#merge dataframe
merge()
?merge
