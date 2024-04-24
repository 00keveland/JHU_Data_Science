# This is an introductory script on basic uses of a "For" loop using the tidyverse 
# starwars dataset 

library(tidyverse)

#Print the first five names of starwars characters. 
#Use an i to start at one then increase in increments
for (i in 1:5) {
   print(starwars$name[i]) 
}

# Print the height of starwars characters 
for (i in 1:length(starwars$height)){
    print(starwars$height[i])
}


# Output of loop puts data into a vector 

#create empty vector
tallness=vector(
  mode = "numeric",
  length = 5)

# Add in data points to new vector 
for(i in 1:5){
  tallness[i] = starwars$height[i]/100 # we want height in meters not cm
}

#Check new vector has data 
tallness



#Creating a break in your loop
for(x in starwars$name){
  print(x)
  if(x=="Darth Vader"){
    break
  }
}



#Use "Next" to skip a data point
for(x in starwars$name){
  if (x== "C-3PO"){       # the double == is asking if it is T/F 
    next                  # if you just put one = then it would equate the variable with one input
  }
  print(x)
  if(x=="Darth Vader"){
    break
  }
}


#Using the concatenate function to pool data together!
for (i in 1:5){
    cat("The height of", starwars$name[i],"is",
        tallness[i], "meters. \n")    # \n makes a new line
}
  

