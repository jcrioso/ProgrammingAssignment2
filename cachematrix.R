## Put comments here that give an overall description of what your
## functions do : My functions 1 and 2 aims to cache the inverse of a matrix.

## Write a short comment describing this function : "makeCacheMatrix" create a matrix object that retrieves 
# and cache the inverse for the input.

makeCacheMatrix = function(x = matrix(sample(1:100,9),3,3)) {
  s = NULL
  set = function(y) {
    x <<- y
    s <<- NULL
  }
  get = function() x
  setsolve = function(solve) s <<- solve
  getsolve = function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function: computes the inverse of "matrix"

cacheSolve = function(x, ...) {
  s = x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix result")
    return(s)
  }
  data = x$get()
  s = solve(data, ...)
  x$setsolve(s)
  s
}


# Using my function:

matriz = matrix(rnorm(10), 2, 2)
matriz1 = makeCacheMatrix(matriz)
cacheSolve(matriz1)
