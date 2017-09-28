###########################################

#File Name : depositionAtLocation.R

#Date : 10-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: sáb 16 sep 2017 13:45:30 PDT

#Purpose: Script to obtain the values of the deposition at
#the points of interest

#Modifications:

###########################################


source('locateJars.R')
source('jarCoordinates.R')
source('data2Matrix.R')
source('zinc.R')
datos=jarCoordinates()

xmin=-200;xmax=1200;ymin=-200;ymax=1200;nx=ny=50;translation=200

coord=locateJars(datos,xmin,xmax,ymin,ymax,nx,ny,translation)
ncoord=dim(coord)[1]
qs=c(748,224.4,625.5,176.7,255,646,251.6,867)
qs=matrix(qs,ncol=2,byrow=T)
A=data2Matrix('dataMinLambda',0)
#for(j in 1:4){
#	A[coord[j,1],coord[j,2]]=10000
#}
contour(x=seq(-200,1200,length.out=50),
y=seq(-200,1200,length.out=50),A,nlevels=20)
deposition=numeric(ncoord)
for(j in 1:ncoord){
	x=coord[j,1];y=coord[j,2]
	#points(datos[j,1],datos[j,2],pch=16,cex=2)
	text(datos[j,1],datos[j,2],labels=j)
	deposition[j]=A[x,y]
}
points(qs[1,1],qs[1,2],pch=16)
points(qs[2,1],qs[2,2],pch=16)
points(qs[3,1],qs[3,2],pch=16)
points(qs[4,1],qs[4,2],pch=16)


print(abs(0.026*deposition-zinc())/zinc()*100)
