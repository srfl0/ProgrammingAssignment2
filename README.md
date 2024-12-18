Instructions for use:
1. Ensure this version of the file "cachematrix.R" is within your working directory through dir()
2. Apply functions present in the script through source("cachematrix.R")
3. Create a variable (e.g. cache or foo) for purposes of working with the functions, 'cache' will be used in these instructions.
4. Work with the functions by calling makeCacheMatrix() and storing it in the variable created in step 3.
5. Perform cache$set(matr), where matr is the matrix to be inverted (skip this step if you have already called matr as an argument to makeCacheMatrix() in step 4).
6. Perform cacheSolve(cache) to obtain the inverse matrix of matr, and to store the result.
7. Perform cache$getmatr() to retrive the value of the inverse matrix, elements of this matrix will be presented as fractions.

NOTE:
Do not attempt to use setmatr() outside the bounds of cacheSolve, or matr will have to be re-entered.
This script is written in R version 4.4.1
