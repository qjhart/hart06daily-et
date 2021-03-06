#Rsl<- read.table("Rs.R.dat.summary",header=TRUE)
#attach(Rsl)
H<- read.table("Heliosat.R.dat",header=TRUE)
attach(H)
fm <- lm(GOES ~ ASCE)
fme<- coef(fm)
fm0 <- lm(GOES ~ 0 + ASCE)
fm0e<- coef(fm0)
plot(ASCE,GOES,ylim=range(0,40),xlim=range(0,40),type="p",pch=".",col="gray")
abline(fm0,col="black",lty=1,lwd=1)
abline(fm,col="black",lty=3,lwd=2)
#summary(fm) for R^2 :(
leg<-c(sprintf("%.2f x (R^2=%.2f)",fm0e,0.99),
       sprintf("%.2f x+ %.2f (R^2=%.2f)",fme[2],fme[1],0.93))
legend(0,40,leg,lty=c(1,3),lwd=c(1,2))
