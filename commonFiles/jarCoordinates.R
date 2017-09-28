#Function whose output is the coordinates of the jars

#Author: Juan Gabriel Garcia
#Date: July 21 2016
#email: jggarcia@sfu.ca

#Modifications:
	#March 3 2017: Moved the folder 




jarCoordinates=function(njars){
	#Returns a data frame with the x and y 
	#coordinates in its columns
	set.seed(4)
	x=runif(njars,0,1000)
	y=runif(njars,0,1000)
	coord=data.frame(xcoord=x,ycoord=y)
	
	return(coord)
}

