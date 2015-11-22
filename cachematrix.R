## makeCacheMatrix creates a special 'vector', which is really a list containing a function 
## 1. set the input matrix
## 2. get the input matrix
## 3. set the inverse matrix of input matrix
## 4. get the inverse matrix of input matrix

## The return of this function is a list contianing functions.
## Each function shold look up the upper environment to access x and i_1.
## So set and setinv use <<- instead of <-.
makeCacheMatrix <- function(x = matrix()) {
    i_1 <- NULL

    ## 1. set the input matrix
    set <- function(y) {
        x <<- y
        i_1 <<- NULL
    }

    ## 2. get the input matrix
    get <- function() x

    ## 3. set the inverse matrix of input matrix    
    setinv <- function(inv) i_1 <<- inv

    ## 4. get the inverse matrix of input matrix
    getinv <- function() i_1

    ## return a list containing functions
    list(set = set,
         get = get,
         setinv = setinv,
         getinv = getinv)
}

## computing the inverse matrix of the input of makeCacheMatrix.
## Matrix data is in the environment of makeCacheMatrix function.
## So when using get(), getinv() and setinv(), lexical scoping takes place.
## An input mCM is a returned list of makeCacheMatrix
cacheSolve <- function(mCM, ...) {
    ## retrieve the inverse matrix
    i_2 <- mCM$getinv()

    ## if the inverse matrix already exists in the cache then return this inverse matrix
    if (!is.null(i_2)) {
        message("getting cached data")
        return(i_2)
    }

    ## if the inverse doesn't exist than compute the invers matrix from data.
    ## To return x(the input of makeCacheMatrix), get() looks up the upper environment to find x, lexical scoping.
    data <- mCM$get()
    i_2 <- solve(data, ...)

    ## set the computed inverse matrix to the cache.
    ## To access i_1, setinv() looks up the upper environment.
    ## So, lexical scoping takes place.
    mCM$setinv(i_2)
    
    i_2
}
