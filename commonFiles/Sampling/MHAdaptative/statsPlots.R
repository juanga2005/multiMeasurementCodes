###########################################

#File Name : statsPlots.R

#Date : 08-08-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 15 ago 2017 20:05:47 PDT

#Purpose:Script to plot the statistics from
#the different results

#Modifications:

###########################################

source('../unitConverter.R')
info=read.csv('parStatistics.csv');info=info[,-1]

##Plotting the results for the sources
#
est=info[4:7,1]
estatus=c(est[1],est[2],est[3],est[4])
estim=sapply(c(35,80,5,5),unitConverter)
#group=1:4
#datos=data.frame(group,estatus,estim)
#
#x=c('q1','q2','q3','q4')
#X=cbind(estatus,estim)
#barplot(datos,beside=T)#,names.arg=x)
#

n=1
A=c(rep('Engineers Estimate',n),rep('Our Estimate',n))
B=c(rep(35,n),rep(est[1],n))
C=c(rep(80,n),rep(est[2],n))
D=c(rep(5,n),rep(est[3],n))
E=c(rep(5,n),rep(est[4],n))

datos=data.frame(A,B,C,D,E)
names(datos)=c('type','q1','q2','q3','q4')

niceData=aggregate(cbind(B,C,D,E)~type,data=datos,mean)
rownames(niceData)=niceData[,1]
niceData=as.matrix(niceData[,-1])
colnames(niceData)=c('Source 1','Source 2','Source 3','Source 4')


jpeg('../../../../../Tesis/FigChap4/qUncertainty.jpg')
barplot(niceData,beside=T,legend=T,ylim=c(0,95),ylab='Source Strength (Ton/yr)')


error.bar <- function(x, y, upper, lower, length=0.1,...){
  arrows(x,upper, x, lower, angle=90, code=3, length=length, ...)
}

error.bar(2.5,est[1],info[4,3],info[4,2])
error.bar(5.5,est[2],info[5,3],info[5,2])
error.bar(8.5,est[3],info[6,3],info[6,2])
error.bar(11.5,est[4],info[7,3],info[7,2])

dev.off()
