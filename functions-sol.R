# a)
set.seed(20141012)
x <- sample(c(1:10, NA), 20, replace = TRUE)
y <- runif(20, min = 0, max = 1)
cor(x, y, use = "p", method = "k")
# [1] -0.186491


# b)
# returns 3, name masking of y
f1 <- function(x = {
    y <- 1
    2
  }, y = 0) {
  x + y
}
f1()
# [1] 4

# c)
# returns 100 due to lazy evaluation of default argument
# z is assigned the value 100
# and x is later lazily evaluated to have the same value as z.
f2 <- function(x = z) {
  z <- 100
  x
}
f2()
# [1] 100

# d)
# %xor%: infix implementation of the xor operation
`%xor%` <- function(a, b) {
  checkmate::assert_logical(a)
  checkmate::assert_logical(b)
  xor(a, b)
}

# e)
# using and exit handler
# example adapted from the book.
cleanup <- function(dir, code) {
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par), add = TRUE)

  old_opt <- options(stringsAsFactors = FALSE)
  on.exit(options(old_opt), add = TRUE)
}

# f)
f <- function(arg) {
  on.exit(dev.off(), add = TRUE)
  dev.set()
  plot(arg)
}
f(1:10)

# g)
c <- 10
# the first c is the normal variadic function to create vectors
# the second function is the name given the the first variadic argument
# the third c is the the value c <- 10
c(c = c)
#  c
# 10
