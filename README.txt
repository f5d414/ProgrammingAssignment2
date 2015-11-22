I don't understand what to do about this assignment. So all I do for this assignment is copy the example codes and change some variable names and functions.

In my opinion, this assignment is to ask the concept of lexical scoping. So I attached comment about how the lexical scoping is used in my code.

And here I test my code.

## s is a list(s) containing 2 lists each for 10 2by2 matrices of x and i.
> ## x is the list of input matrices for makeCacheMatrix and i is the list of computed inverse matrices. 
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
[1,] 2.080082 1.982208
[2,] 9.738966 4.615139

$x[[2]]
         [,1]     [,2]
[1,] 9.289381 4.731514
[2,] 8.170685 1.511859

$x[[3]]
         [,1]     [,2]
[1,] 4.325257 9.549648
[2,] 3.254144 6.942813

$x[[4]]
         [,1]     [,2]
[1,] 1.288259 5.141845
[2,] 5.861396 1.697006

$x[[5]]
         [,1]     [,2]
[1,] 9.527974 1.354559
[2,] 3.493272 4.034291

$x[[6]]
         [,1]     [,2]
[1,] 8.282763 8.878923
[2,] 2.918321 6.503295

$x[[7]]
         [,1]     [,2]
[1,] 8.117880 5.825405
[2,] 5.641919 9.064322

$x[[8]]
         [,1]     [,2]
[1,] 2.229873 7.288947
[2,] 4.383277 6.899367

$x[[9]]
         [,1]     [,2]
[1,] 5.024674 3.992672
[2,] 2.418409 2.062391

$x[[10]]
         [,1]     [,2]
[1,] 4.782051 7.651442
[2,] 8.556825 5.593949


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



> ## one_shot function : combine makeCacheMatrix and cacheSolve in one function.
> ## cacheSolve is used 2 times because the first cacheSolve computes the inverse matrices and the second is used to verify if the result is cached or not.
> ## So you can see "getting cached data" when the function is  .... [TRUNCATED] 

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

> ## test if the computes are corrent or not.
> ## a result of matrix product x and inverse of x should be [1 0; 0 1].
> for (k in seq_along(s$x)) {
+     print(s$x[[k]] %*% s$i[[k]])
+ }
     [,1] [,2]
[1,]    1    0
[2,]    0    1
             [,1] [,2]
[1,] 1.000000e+00    0
[2,] 1.110223e-16    1
     [,1] [,2]
[1,]    1    0
[2,]    0    1
     [,1]         [,2]
[1,]    1 5.551115e-17
[2,]    0 1.000000e+00
     [,1] [,2]
[1,]    1    0
[2,]    0    1
             [,1] [,2]
[1,] 1.000000e+00    0
[2,] 1.110223e-16    1
             [,1] [,2]
[1,] 1.000000e+00    0
[2,] 2.220446e-16    1
     [,1]         [,2]
[1,]    1 1.110223e-16
[2,]    0 1.000000e+00
     [,1] [,2]
[1,]    1    0
[2,]    0    1
     [,1]         [,2]
[1,]    1 1.110223e-16
[2,]    0 1.000000e+00
