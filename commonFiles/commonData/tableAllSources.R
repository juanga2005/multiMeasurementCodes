###########################################

#File Name : tableAllSources.R

#Date : 14-09-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: dom 17 sep 2017 12:36:00 PDT

#Purpose:Script to create the tables for all the sources

#Modifications:

###########################################
source('~/Documents/SFU_files/Research/multiMeasurementCodes/commonFiles/commonData/inputOutput3VarsGenerator.R')
tableAllSources=function(njars){
	for(j in 1:4){
		inputOutput3VarsGenerator(j,njars)

	}
}
