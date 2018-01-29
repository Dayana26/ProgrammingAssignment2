## writing a pair of functions that cache the inverse of a matrix

## Creating a "special Matrix" that is in fact a list containing 4 functions

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  setmatrix<- function(y){
    x<<-y
    inv<<-NULL
  }
  getmatrix<-function()x
  setinv<-function(i){
    inv<<-i
  }
  getinv<-function()inv
  list(setmatrix=setmatrix, getmatrix=getmatrix, setinv=setinv, getinv=getinv)
}


## This function computes the inverse of the matrix (returned by makeCacheMatrix) 
#If the inverse has already been calculated, this function just retrieves it 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<-x$getinv()
  if(is.null(inv)){
    matr<- x$getmatrix()
    i<-solve(matr)
    x$setinv(i)
    i
  } else {
    message("getting cached data")
    inv
  }
}
