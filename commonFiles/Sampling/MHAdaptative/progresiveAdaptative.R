###########################################

#File Name : progresiveAdaptative.R

#Date : 16-09-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 27 sep 2017 21:25:41 PDT

#Purpose: To do the convergence study

#Modifications:

###########################################

path="~/Documents/SFU_files/Research/multiMeasurementCodes/commonFiles/commonData/"
path2="~/Documents/SFU_files/Research/multiMeasurementCodes/commonFiles/"
source(paste(path,"tableAllSources.R",sep=""))
source(paste(path2,"depositionAtLocation.R",sep=""))
njars=2^seq(1,8,by=1);
#njars=20

for(j in njars){
	print(paste('Working in the simulation with',j,'jars'))
	tableAllSources(j)
	depositionAtLocation(j)
	source('MHrun.R')
	aux=read.csv('sigmaTest.csv')
	write.csv(aux,paste('./varnjarsTest/njars',j,'.csv',sep=''))
}

