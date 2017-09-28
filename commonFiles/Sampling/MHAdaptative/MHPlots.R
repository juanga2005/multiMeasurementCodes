###########################################

#File Name : MHPlots.R

#Date : 14-07-2017

#Author: Juan Garcia

#Email: jggarcia@sfu.ca

#Last Modified: mar 15 ago 2017 19:34:38 PDT

#Purpose: Plotting the results from the MH

#Modifications:

###########################################

lambdas=c(5.68984e-08,5.68984e-07,2.84492e-06,5.68984e-06,1.137968e-05,2.655259e-05,4.172549e-05,5.68984e-05)
source('../unitConverter.R')
source('../kg2Ton.R')
source('../setAlpha.R')
#datos=read.csv('oneMillionSamplesnr10.csv');datos=datos[,-1]
#datos=read.csv('sigmaTestcsv');datos=datos[,-1]
#datos=read.csv('sigma1.137968e-05.csv');datos=datos[,-1]
cual=4
print(lambdas[cual])
#datos=read.csv(paste('../optimLambda/samples/sigma',lambdas[cual],'.csv',sep=''));datos=datos[,-1]
#datos=read.csv('../optimLambda/samples/sigmaMinimizer.csv');datos=datos[,-1]
names(datos)=c('gamma','z0','L','q1','q2','q3','q4')
n=dim(datos)[1]
#afterB=datos[(n/2):n,]#After burn data
datos2=datos[(n/2):n,]#After burn data
m=dim(datos2)[1]
thin=seq(1,m,by=100)
afterB=datos2[thin,]
#afterB=datos
#plotting the trace plots

l=1.5
m=1.5
jpeg('../../../../../Tesis/FigChap4/traces.jpg')#,width=1600,height=1200)
par(mfrow=c(3,3))
nn=c("p",expression(z[0]),"L",expression(q[1]),expression(q[2]),expression(q[3]),expression(q[4]))
#
#
for(j in 1:7){
	plot(afterB[,j],type='l',xlab="Sample",ylab="",main=paste("Trace plot for ",nn[j]),cex.lab=l,cex.main=m)
	title(ylab=nn[j],line=1.6,cex.lab=l)
}
dev.off()
jpeg('../../../../../Tesis/FigChap4/histogramsI.jpg')#width=1600,height=1200)
#X11()
par(mfrow=c(2,2))
for(j in 1:4){
	if(j!=4){
		d=density(afterB[,j])
		hist(afterB[,j],xlab=nn[j],main=paste("Histogram for ",nn[j]),cex.lab=1.5,cex.main=1.5,prob=T,ylim=c(0,max(d$y)))
		lines(d,col='blue',lwd=2)
		if(j!=1){
			ind=which(d$y==max(d$y))
			xx=d$x[ind]
			abline(v=xx,col='red',lwd=2,lty=2)
			print(xx)	
		}
		else{
			#dd=d$y[d$x<0.2]
			#ind=which(d$y==max(dd))
			ind=which(d$y==max(d$y))
			xx=d$x[ind]
			abline(v=xx,col='red',lwd=2,lty=2)
			print(xx)	
		}
		#else{
	#		xx=summary(afterB[,j])[3]
	#		abline(v=xx,col='red',lwd=2,lty=2)
	#		print(xx)
		#}
	}
	else{
		plot(0,0,col='white',xaxt='n',yaxt='n',ylab='',xlab='',frame.plot=F)
		legend('topright',c('Density Fit','Point Estimate'),lty=c(1,2),col=c('blue','red'),cex=1.5)
	}
	

}
dev.off()
jpeg('../../../../../Tesis/FigChap4/histogramsII.jpg')#width=1600,height=1200)
#X11()
lista=c(35,80,5,5)
par(mfrow=c(2,2))
for(j in 4:7){
	mu=mean(afterB[,j]);v=var(afterB[,j])
	alpha=mu^2/v;beta=mu/v
	alpha2=setAlpha(0.99,3);beta2=(alpha2-1)/sapply(lista,unitConverter)
	x=seq(0,0.04,length=1000);yy=dgamma(x,alpha,beta);z=dgamma(x,alpha2[j-3],beta2[j-3]);zz=max(z)
	aux=(alpha-1)/beta
	hist(afterB[,j],main=paste("Histogram for Source",j-3),cex.lab=l,cex.main=m,prob=T,ylim=c(0,max(yy,zz)),
	xlab='Source Strength (Kg/s)')
	lines(x,yy,col='blue',lwd=2)
	lines(x,dgamma(x,alpha2[j-3],beta2[j-3]),col='blue',lty=2,lwd=2)
	abline(v=aux,lwd=2,lty=2)
	abline(v=unitConverter(lista[j-3]),col='red',lwd=2,lty=4)
	print(kg2Ton(aux))
	print(aux)
	if(j==4){
		legend('topright',c('Gamma Fit','Prior','Point Estimate','Engineer Estimate'),lty=c(1,2,2,4),col=c('blue','blue','black','red'),cex=0.8)
	}
}
dev.off()
