## s is a list containing 2 lists each for 10 2by2 matrices of x and i.
## x is the list of input matrices for makeCacheMatrix and i is the list of computed inverse matrices. 
x <- vector("list", 10)
i <- vector("list", 10)
for (k in seq_along(x)) {
    x[[k]] <- matrix(runif(4, 1, 10), nrow = 2)
}
s <- list(x = x, i = i)
s

## one_shot function combines makeCacheMatrix and cacheSolve in one function.
## cacheSolve is used 2 times because the first cacheSolve computes the inverse matrices and the second is used to verify if the result is cached or not.
## So you can see "getting cached data" when the second function is running.
one_shot <- function(x) {
    mCMx <- makeCacheMatrix(x)
    i <- cacheSolve(mCMx)
    cacheSolve(mCMx)
}

## compute inverse matrix
s$i <- lapply(s$x, one_shot)

## test if the computes are corrent or not.
## A result of matrix product x and inverse of x should be [1 0; 0 1].
for (k in seq_along(s$x)) {
    print(s$x[[k]] %*% s$i[[k]])
}

