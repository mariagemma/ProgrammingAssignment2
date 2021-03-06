## Put comments here that give an overall description of what your
## functions do
#
# CacheSolve function retrieves the inverse of a matrix you have passed it as a parameter, 
# calculating it or retrieving it from the cache using functions created previously at makeCacheMatrix function
# Use of scoping rules
# For testing:
# A<-matrix(c(5, 7, 13, 4, 1, 7, 14, 3, 11), nrow=3, ncol=3, byrow=F, dimnames=list(c("Blanco", "Negro", "Rojo"), c("Toyota", "Audi", "Nissan")))  
# B <- matrix(1:4, nrow=2, ncol=2)
# s<-makeCacheMatrix()
# cacheSolve(s, B) and cacheSolve(s, A)

## Write a short comment describing this function
## This function creates a special ("matrix") object that can cache its inverse
## makeCacheMatrix function writes 4 functions (set, get, setInverse, getInverse)
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL  
      set <- function(y) {
            x <<- y 
            m <<- NULL 
      }
      get <- function() x
      
      setInverse <- function(inverse) m <<- inverse  
      getInverse <- function() m
      
      # Returns a list with four created functions
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}

## Write a short comment describing this function
# This function computes the inverse of a "matrix". 
# (Parameters: x is the assignment of makeCacheMatrix and i is a matrix you like calculate its inverse)
# If matrix you have passed at function as a parameter is the same that previous generated by makeCacheMatrix function
# and its inverse has already been calculated, then the cachesolve will retrieve the inverse from the cache.
# Otherwise, it will compute the inverse with the solve function in R and it will save in cache both the new matrix and its inverse.

cacheSolve <- function(x, i= matrix()) {
      ## Try return of the cache the inverse of i matrix       
      data <- x$get()
      if((length(data)== length(i)) && all.equal(data, i)){
            m <- x$getInverse()
            if(!is.null(m)) {
                  message("getting cached data")
                  return(m)
            }
      }     
      message("Calculating inverse")
      x$set(i)
      m <- solve(i)
      x$setInverse(m)
      m
      
}
