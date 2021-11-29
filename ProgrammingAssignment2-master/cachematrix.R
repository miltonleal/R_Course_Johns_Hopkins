## Written by Milton Leal

## R Programming course on Course - Week 3 Assignment

## The functions serve the purpose of calculating the inverse of a matrix
## and store the result in cache to save time during future computations

## makeCacheMatrix creates a special matrix object that contains
## two states (x and mat_inv) and 4 methods (set, get, setInverse, getInverse)

makeCacheMatrix <- function(x = matrix()) {

        mat_inv <- NULL
        set <- function(y) {
          x <<- y
          mat_inv <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) mat_inv <<- solve
        getInverse <- function() mat_inv
        list(set = set, get = get, 
               setInverse = setInverse, 
               getInverse = getInverse)
}


## When called, cacheSolve checks if there is already an inverse matrix
## stored in cache. If there is not, it calculates and caches it. 

cacheSolve <- function(x, ...) {
  
        mat_inv <- x$getInverse()
        if(!is.null(mat_inv)) {
            message("getting cached data")
            return(mat_inv)
        }
        data <- x$get()
        mat_inv <- solve(data, ...)
        x$setInverse(mat_inv)
        mat_inv
        ## Return a matrix that is the inverse of 'x'
}
