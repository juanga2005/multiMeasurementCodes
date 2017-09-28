###########################################

#File Name : test.R

#Date : 09-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: vie 11 ago 2017 02:31:39 PDT

#Purpose: Test the files in this folder

#Modifications:

###########################################
source('MCintegrate.R')
library('DiceKriging')

#lambdas=c(5.68984e-08,5.68984e-07,2.84492e-06,5.68984e-06,1.137968e-05,1.517291e-05,2.275937e-05,3.413904e-05,2.655259e-05,4.172549e-05,5.68984e-05)
##lambdas=lambdas[c(3,4,5,8)]
##lambdas=lambdas[2:8]
#thin=50
#f=numeric(length(lambdas))
#j=1
#for(lambda in lambdas){
#	print(j)
#	aq=Aq(lambda,thin)
#	f[j]=MCintegrate(aq)
#	j=j+1
#}
bb=read.csv('functional.csv');bb=bb[,-1]
lambdas=bb[,1];f=bb[,2]
lambdas=lambdas[6:10];f=f[6:10]
#lambdas=lambdas*1e6;f=f*1e-6
model=km(design=data.frame(x=lambdas),response=data.frame(y=f),covtype='gauss',nugget.estim=T)
lTest=seq(min(lambdas)*0.99,max(lambdas)*1.01,by=abs(min(lambdas)-max(lambdas))/1250)
p=predict(model,newdata=data.frame(x=lTest),type='UK')
plot(lambdas,f,ylim=c(min(p$lower95),max(p$upper95)))
lines(lTest,p$mean)
#lines(lTest,p$upper95,col='red')
#lines(lTest,p$lower95,col='red')
ind=which(p$mean==min(p$mean))
xx=lTest[ind]
abline(v=xx,col='red',lty=2)
