
#function to create a special matrix object that caches its inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
#function to set the matrix
  
  
  set <- function(y) {
    x <<- y    
#assign the matrix to the parent environment
    inverse <<- NULL  
#reset the inverse cache
  }
  
#function to get the matrix
  
  get <- function() {
    x  
#return the matrix
  }
  
  
#function to set the inverse of the matrix
  
  setinverse <- function(inv) {
    inverse <<- inv
  }
  
  
#function to get the inverse of the matrix
  
  getinverse <- function(){
    inverse  #return the inverse
  }
  
  
#create a list of functions to be returned

  list(set = set,
      get = get,
      setinverse = setinverse
      getinverse = getinverse)
      
}


#function to compute the inverse of the special "matrix" object

cacheSolve <- function(x, ...) {
#check if the inverse is already cached
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("Getting cached inverse")
    return(inv) 
    
   }
   
   
#if inverse is not cached, compute it  
   
   mat <- x$get()
   inv <- solve(mat, ...)
   
   
#cache the inverse
   x$setinverse(inv)
   
   
#returntheinverse
   inv
   
}
