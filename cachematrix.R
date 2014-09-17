## The two functions below computes, returns from cache the inverse of a matrix. 

## makeCacheMatrix is a functin that creates a matrix called "inv" that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv=NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) inv <<- solve
    getsolve <- function() inv
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}



## cacheSolve is a function that computes  the inverse of the matrix "inv" returned by the function makeCacheMatrix above. 

cacheSolve <- function(x, ...) {
    inv <- x$getsolve()
    if(!is.null(inv)) {
    message("getting cached inverse matrix")
    return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setsolve(inv)
inv
}
    {
        ## Return a matrix that is the inverse of 'x'
}

inv=makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))  
inv$get()  #Returns original matrix
cacheSolve(inv) #Computes, caches, and returns inverse matrix
inv$getsolve()  #Returns inverse matrix
cacheSolve(inv) #Returns previously computed cached inverse matrix.
inv$set(matrix(c(0, 5, 99, 66), nrow=2, ncol=2)) #Modifying existing matrix
 

inv=makeCacheMatrix(matrix(rnorm(100), nrow=10, ncol=10)) #Test functions above with a larger square matrix.
