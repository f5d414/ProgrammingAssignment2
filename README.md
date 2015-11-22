I don't understand what to do about this assignment. So all I do for this assignment is copy the example codes and change some variable names and functions.

In my opinion, this assignment is to ask the concept of lexical scoping. So I attached comment about how the lexical scoping is used in my code.

And here I test my code.


> ## to make a list(s) containing 2 lists each for 10 2by2 matrices of x and i
> x <- vector("list", 10)
> i <- vector("list", 10)
> for (k in seq_along(x)) {
+     x[[k]] <- matrix(runif(4, 1, 10), nrow = 2)
+ }
> s <- list(x = x, i = i)
> s
$x
$x[[1]]
         [,1]     [,2]
[1,] 7.325061 1.060820
[2,] 2.875197 1.683723

$x[[2]]
         [,1]     [,2]
[1,] 2.070225 7.715990
[2,] 4.227629 1.313658

$x[[3]]
         [,1]     [,2]
[1,] 7.469959 1.227441
[2,] 6.411591 6.857019

$x[[4]]
         [,1]     [,2]
[1,] 5.340915 8.947644
[2,] 4.782291 3.262819

$x[[5]]
         [,1]     [,2]
[1,] 6.072657 6.181755
[2,] 5.510226 8.937571

$x[[6]]
         [,1]     [,2]
[1,] 3.198564 2.023905
[2,] 5.880390 7.327128

$x[[7]]
         [,1]     [,2]
[1,] 9.742089 4.423466
[2,] 7.342432 3.989256

$x[[8]]
         [,1]     [,2]
[1,] 8.149034 6.790976
[2,] 5.994971 7.640640

$x[[9]]
         [,1]     [,2]
[1,] 8.261066 5.370911
[2,] 4.910523 4.591207

$x[[10]]
         [,1]     [,2]
[1,] 7.728086 7.810274
[2,] 1.684318 4.032944


$i
$i[[1]]
NULL

$i[[2]]
NULL

$i[[3]]
NULL

$i[[4]]
NULL

$i[[5]]
NULL

$i[[6]]
NULL

$i[[7]]
NULL

$i[[8]]
NULL

$i[[9]]
NULL

$i[[10]]
NULL

## one_shot function : combine makeCacheMatrix and cacheSolve in one function.

one_shot <- function(x) {
    mCMx <- makeCacheMatrix(x)
    i <- cacheSolve(mCMx)
    cacheSolve(mCMx)
}

## cacheSolve is used 2 times because the first cacheSolve computes the inverse matrices and the second is used to verify if the result is cached or not.
## So you can see "getting cached data" message at the bottom.
> ## compute inverse matrix
> s$i <- lapply(s$x, one_shot)
getting cached data
getting cached data
getting cached data
getting cached data
getting cached data
getting cached data
getting cached data
getting cached data
getting cached data
getting cached data

> ## test if the computes are corrent.
## the result of matrix product x and inverse of x is [1 0; 0 1].
> for (k in seq_along(s$x)) {
+     print(s$x[[k]] %*% s$i[[k]])
+ }
     [,1] [,2]
[1,]    1    0
[2,]    0    1
     [,1] [,2]
[1,]    1    0
[2,]    0    1
     [,1] [,2]
[1,]    1    0
[2,]    0    1
             [,1]          [,2]
[1,] 1.000000e+00 -2.220446e-16
[2,] 1.110223e-16  1.000000e+00
              [,1] [,2]
[1,]  1.000000e+00    0
[2,] -8.881784e-16    1
     [,1]          [,2]
[1,]    1 -1.110223e-16
[2,]    0  1.000000e+00
              [,1] [,2]
[1,]  1.000000e+00    0
[2,] -8.881784e-16    1
     [,1] [,2]
[1,]    1    0
[2,]    0    1
              [,1] [,2]
[1,]  1.000000e+00    0
[2,] -2.220446e-16    1
              [,1] [,2]
[1,]  1.000000e+00    0
[2,] -5.551115e-17    1


