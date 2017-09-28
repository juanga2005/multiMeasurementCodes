###########################################

#File Name : data2Matrix.R

#Date : 09-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: jue 10 ago 2017 14:03:08 PDT

#Purpose:Script to change the data as a matrix

#Modifications:

###########################################
data2Matrix=function(file,pl){

	datos=read.table(file)

	A=matrix(datos[[1]],ncol=50,byrow=T)
	if (pl==1){
		contour(x=seq(-200,1200,length.out=50),
		y=seq(-200,1200,length.out=50),A,nlevels=80)
	}
	return(A)
}
