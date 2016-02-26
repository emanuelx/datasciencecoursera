## Put comments here that give an overall description of what your
## functions do

##I pretty much just repeated / adapted the example we got - I hope I got this right, I have to say the reason for this brain-teasing assignment still isn't really clear to me...

makeCacheMatrix <- function(my_matrix = matrix()) {
  matrix_inverted <- NULL
  matrix <- function() my_matrix
  aufzwingen <- function(mat) matrix_inverted <<- mat
  get_inv_mat <- function() matrix_inverted
  list(matrix = matrix, get_inv_mat = get_inv_mat, force = aufzwingen)
}



## again, very similar to the example, only with the small difference, that the function should check if the inverse matrix is actually correct (ie matrix multiplication gives the identity matrix)

cacheSolve <- function(x) {
  mat <- x$matrix() 
  mat_inv <- x$get_inv_mat()
  
  if(is.matrix(mat_inv)) {
    mat_prod <- mat %*% mat_inv
  } else { 
    mat_prod <- matrix(rep(0,9), nrow = 3)
  }
  
  if(colSums(mat_prod)%>%mean%>%round(0) == 1) {
    message('all good')
    return(mat_inv)
  } else {
    new_mat_inv <- solve(mat)
    message('re-solved')
    x$force(new_mat_inv)
    return(new_mat_inv)
  }
}

