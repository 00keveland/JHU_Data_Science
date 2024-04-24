#Simple function making:
add2 = function(x,y){
    x + y
}

#Try an Example:
add2 (3,5)

#Different kind of function that
above10 = function(x){
      use = x > 10
      x[use]
}

#Third function to use variable instead of numeric 
above = function(x,n = 10){
    use = x > n
    x[use]
}

# Example
x = 1:20 
above(x,12)


# More complex function using a for-loop:
columnmean = function(y, removeNA = TRUE){ # removeNA removes Na values can revert by using FALSE
  nc = ncol(y)
  mean = numeric(nc)
  for(i in 1:nc){
    mean [i] = mean(y[,i], na.rm = removeNA)
  }
  mean
}

#Try it out!
columnmean(airquality) 
# Want to keep the NA values?
columnmean(airquality, FALSE) 



