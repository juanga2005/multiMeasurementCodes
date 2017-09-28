#Script that contains the experimental zinc measurements

#Author:Juan Gabriel Garcia
#Date: July 25 2016
#email: jggarcia@sfu.ca

#Modifications:


zinc=function(){
	a=read.table('~/Documents/SFU_files/Research/multiMeasurementCodes/commonFiles/commonData/zincNumTest.txt')
	return(as.numeric(a))
}
