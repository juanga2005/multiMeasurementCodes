###########################################

#File Name : MCintegrate.R

#Date : 24-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 09 ago 2017 22:46:50 PDT

#Purpose:Monte Carlo integration script

#Modifications:

###########################################
source('functionClass.R')
source('../setAlpha.R')
source('../unitConverter.R')
MCintegrate=function(aq,l,ind,type){
	#func is the function to integrate
	Q=c(unitConverter(35),unitConverter(80),unitConverter(5),unitConverter(5))
	alpha=setAlpha(0.99,3)
	beta=(alpha-1)/Q
	nsamples=dim(aq[[2]])[3]
	temp=ex(aq,l,ind,type)
	indices=1:4;indices=indices[-ind]
	return(1/nsamples*sum(temp))
}	
