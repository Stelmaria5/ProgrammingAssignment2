## Put comments here that give an overall description of what your
## functions do:

## Write a short comment describing this function:
# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL #creates the variable "m", in the environment of the "makeCacheMatrixr" function
            # set to null. called i for inverse.
  
  set <- function(y) { # creates function "set" inside the same environment as variable "m"
    x <<- y            # the environment of this function is therefore a "child" of the function "makeCacheMatrix" environment
    i <<- NULL         # the input of "x" is assigned a new value (y). not sure where this comes from..
  }                    # "m" is reset to NULL in this function. I don't really understand the purpose of this function.
  get <- function() { 
    x # this puts the input of makeCacheMatrix into "get"
  }
  
  setinverse <- function(solve) { 
    i <<- solve # the variable "i" is assigned the the value passed into the "setinverse" function.
    #because the <<- is used, the parent environment of this function is used. Therefore variable "i" in the makeCache
    # environment is set to "solve".
  }
  getinverse <- function() {
    i  # above function put the inverse into "i", this... gets i? why not just getmean <- m?
    # this function prints out the value of i which it finds in its parent environ.
  }
  list(set = set, get = get,   # this puts all the variables made within the function 
       setinverse = setinverse,      # makeVector into a list. This allows these variables to be accessed
       getinverse = getinverse)      # outside of this environment. This list is the output of makeVector

}


## Write a short comment describing this function:
# This function computes the inverse of the special "matrix" returned
# by makeCacheMatrix above. If the inverse has already been calculated
# (and the matrix has not changed), then the cachesolve should retrieve
# the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse() # uses the function "getmean", defined in the "makeVector"
                      # environ to get mean of input (x). puts it into variable "m"
  if(!is.null(i)) {   # if the value stored in "i" is not NULL
    message("getting cached data")
    return(i) # gets the value stored in i from the cache.
  }
  data <- x$get() # stores the value from "get" defined in makeCacheMatrix function into "data".
  i <- solve(data) # takes the mean of "data" and puts it into "i"
  x$setinverse(i) # stores this new i value in "setinverse" variable.
  i # prints the inverse of the matrix
}
