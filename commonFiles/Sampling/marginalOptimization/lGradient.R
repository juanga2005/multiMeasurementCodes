###########################################

#File Name : lGradient.R

#Date : 27-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mié 09 ago 2017 23:14:38 PDT

#Purpose: Script for the lambda gradient

#Modifications:

###########################################
source('functionClass.R')

lGradient=function(lambda,aq){
	aux1=log(MCintegrate(aq,lambda,0,1)) #denominator
	aux2=log(MCintegrate(aq,lambda,0,3)) #numerator
	aux3=3*log(lambda)
	aa=aux2-aux1-aux3;aux=exp(aa)

	return(aux-9/lambda)
}


