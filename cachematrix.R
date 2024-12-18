library(MASS)

## creates a list object that contains functions to set or retrieve information about the matrix to be inverted and the inverted matrix if it has been calculated
## NOTE: setmatr should not be used outside the bounds of cacheSolve

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatr <- function(res) m <<- res
        getmatr <- function() m
        list(set = set, get = get,
                setmatr = setmatr,
                getmatr = getmatr)
}


## A function to check for the presence of a calculated solution and to obtain a solution if no solution is present. Solution is obtained via Gauss-Jordan Elimination (GJE)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatr()
        if (!is.null(m)){
                message("getting cached data")
                return(m)
        }
        res  <- x$get()
        ## calculate inverse

	  ## prepping identity matrix for GJE

	  size <- length(res[1,])
	  I <- matrix(0, size, size)
	  I[col(I)==row(I)] <- 1
	  res <- cbind(res,I)
	  
	  ## executing GJE
	  for(i in 1:(size-1)){
		res[i,] <- res[i,] / res[i,i]
	  	for(j in (i+1):size){
			res[j,] <- res[j,] - (res[j,i]/res[i,i])*res[i,]
		}
	  }
	  res[size,] <- res[size,] / res[size,size]

	  for(i in size:2){
	  	for(j in (i-1):1){
 	  		res[j,] <- res[j,] - (res[j,i]/res[i,i])*res[i,]
	  	}
	  }
	  
	  ##extracting resultant matrix
	  m <- fractions(res[,(size+1):(2*size)])

        fractions(x$setmatr(m))
        m
}
