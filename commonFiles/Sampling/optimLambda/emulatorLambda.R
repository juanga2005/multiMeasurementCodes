###########################################

#File Name : emulatorLambda.R

#Date : 11-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: vie 11 ago 2017 17:40:09 PDT

#Purpose:Plot J(\lambda) and its emulator

#Modifications:

###########################################
library('DiceKriging')

Xtrain=read.csv('functional.csv');Xtrain=Xtrain[,-1]
lambdas=Xtrain[,1];f=Xtrain[,2]
lambdas=lambdas[6:11];f=f[6:11]



model=km(design=data.frame(x=lambdas),response=data.frame(y=f),covtype='gauss',nugget.estim=T)
lTest=seq(min(lambdas)*0.99,max(lambdas)*1.01,by=abs(min(lambdas)-max(lambdas))/1250)
p=predict(model,newdata=data.frame(x=lTest),type='UK')
jpeg('../../../../../Tesis/FigChap4/lambdaEmul.jpg')
plot(lambdas,f,ylim=c(min(p$lower95),max(p$upper95)),xlab=expression(lambda),ylab=expression(J(lambda)),pch=16)
lines(lTest,p$mean,lwd=2)
#lines(lTest,p$upper95,col='red')
#lines(lTest,p$lower95,col='red')
ind=which(p$mean==min(p$mean))
xx=lTest[ind]
abline(v=xx,col='red',lty=2,lwd=2)

aux=paste(expression(lambda),'=2.8e-5',sep='')
legend('topright',c('Training set','Emulator',aux),lty=c(NA,1,2),pch=c(16,NA,NA),col=c('black','black','red'))
dev.off()
