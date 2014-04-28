## Using the given examples the code below computes for the inverse of 
## the matrix instead of the mean

## This function creats a vector that is actually a list of functions to:
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    set_inv <- function(solve) m <<- solve
    get_inv <- function() m
    list(set = set, get = get,
        set_inv = set_inv,
        get_inv = get_inv)
}


## this function check if the invverse of the matrix is already available, 
## if not it will calcualte and use the first function to set the value.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$get_inv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_inv(m)
  m
}
