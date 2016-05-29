## The first function, makeCacheMatrix, creates a matrix object, 
## which is really a list containing a function to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse. If it has already been calculated, it will 
## return it from the cach??

makeCacheMatrix <- function(x = matrix()) {
    inverse_x <- NULL
    set <- function(y) {
        x <<- y
        inverse_x <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inverse_x <<- inverse
    getinverse <- function() inverse_x
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## cacheSolve calculates the inverse of the matrix created with
## the above function.
## If the inverse is available in the cache, the function retrieves it. If
## not, it calculates the inverse and returns it.

cacheSolve <- function(x, ...) {
    inverse_x <- x$getinverse()
    if (!is.null(inverse_x)) {
        message("getting cached data")
        return(inverse_x)
    } else {
        data <- x$get()
        inverse_x <- solve(data, ...)
        x$setinverse(inverse_x)
        inverse_xs
    }
}