 ## This file consists of two functions.
 ## function makeCacheMatrix and function cacheSolve
 
-## makeCacheMatrix creates a list containing a function to
-
-## 1.set the value of the Matrix
-## 2.get the value of the Matrix
-## 3.set the value of the inverse Matrix
-## 4.get the value of the inverse Matrix
-
+## makeCacheMatrix creates creates a special "matrix" object that can cache its inverse.
 makeCacheMatrix <- function(x = matrix()) {
   inverse <- matrix()
+## set the value of the Matrix
   set <- function(y){
     x <<- y
     inverse <<- matrix()
   }
+## get the value of the Matrix
   get <- function() x
+## set the value of the inverse Matrix  
   setinverse <- function(in2) inv <<- in2
+## get the value of the inverse Matrix  
   getinverse <- function() inv
+## Return a list of cached data
   list(set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
 }
 
-## makeCacheMatrix creates the  inverse of the matrix created with the above function. 
+## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
+## If the inverse has already been calculated (and the matrix has not changed). 
+## Then the cachesolve should retrieve the inverse from the cache.
 ## It checks to see if the inverse has already been created at first.
 
 cacheSolve <- function(x, ...) {
-  ## Return a matrix that is the inverse of 'x'
+## Return a matrix that is the inverse of 'x'
   inverse <- x$getinverse()
+## check if the inverse has already been created at first.
+## If "Yes", return cached Matrix.
   if(!is.null(inv)){
     message("getting cached data")
     return(inverse)
   }
+## If "No", compute the inverse and return that.
   data <- x$get()
   inverse <- solve(data, ...)
   x$setinverse(inv)
