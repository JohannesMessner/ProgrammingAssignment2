## The following code can be used to cache the inverse of a given matrix in 
## order to avoid having to recaltulate the inverse

## returns a list containing the matrix, its cached inverse an seters an getters
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() x
  
  getInverse <- function() inverse
  
  setInverse <- function(inv) inverse <<- inv
  
  list(get = get, set = set, getInverse = getInverse, setInverse = setInverse)
}


## gets the cached inverse of the matrix or recalculates the inverse if necessary

cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()
        
        if(!is.null(inverse)) {
          return(inverse)
        }
        
        inverse <- solve(x$get())
        x$setInverse(inverse)
        inverse
}
