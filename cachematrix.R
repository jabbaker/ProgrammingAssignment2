
## instructions 

## 
## Load this file (cachematrix.R) into RStudio, then run the file to load the functions into the env
## How to create a sample 10x10 random matrix: matrixName <- matrix(sample.int(15, 10*10, TRUE), 10, 10)
## Type: myMatrix <- makeCacheMatrix(matrixName) into RStudio
## Type: cacheSolve(myMatrix) once to cache the inverse of MatrixName
## Type: cacheSolve(myMatrix) a 2nd time to retrieve MatrixName from the cache

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
                set <- function(y) {
                        x <<- y
                        m <<- NULL                                      
                }
        get <- function() x                               
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
        setsolve = setsolve,
        getsolve = getsolve)       
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
