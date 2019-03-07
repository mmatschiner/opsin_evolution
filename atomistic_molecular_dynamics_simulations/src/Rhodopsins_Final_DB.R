specMD_ds<-read.table("../data/deep_sea_medians_noEel.txt",header=T, sep="\t")
View(specMD_ds)
names(specMD_ds)
library(leaps)

specMD_lm<-summary(lm(Spectral_Peak ~ Torsion_1+ Torsion_4+ Torsion_5+ Torsion_7+ Torsion_13+ Torsion_14+ Torsion_15+ Angle_3+ RMSF_ring+ RMSF_AUC_RET_LYS + DisulfideBond, data=specMD_ds))
specMD_lm
specMDds_regs<-regsubsets(Spectral_Peak ~ Torsion_1+ Torsion_4+ Torsion_5+ Torsion_7+ Torsion_13+ Torsion_14+ Torsion_15+ Angle_3+ RMSF_ring+ RMSF_AUC_RET_LYS + DisulfideBond, data=specMD_ds, nbest=7, nvmax=7)
sum_specMDds_Regs<-summary(specMDds_regs)
sum_specMDds_Regs$bic
sum_specMDds_Regs$adjr2
plot(specMDds_regs)

#BEST model by regsubsets there are not enough datapoints for a model with this many covariates
specMD_M2<-lm((Spectral_Peak ~ Torsion_4+ Torsion_5+ Torsion_7+ Torsion_15+ Angle_3+ RMSF_AUC_RET_LYS + DisulfideBond), data=specMD_ds)
sum_specMD_M2<-summary(specMD_M2)
plot(fitted(specMD_M2), resid(specMD_M2),xlab="Predicted Values", ylab="Residuals",main="Residual by Predicted plot")
qqnorm(resid(specMD_M2))
qqline(resid(specMD_M2))
plot(hatvalues(specMD_M2),rstudent(specMD_M2),xlim=c(0,1),main=c("Studentized Residuals vs. Hat values"))
abline(h=-2)
abline(h=2)
abline(v=2*length(specMD_M2$coefficients)/length(specMD_M2$residuals)) 

#Third best model with only 3 covariates  by regsubsets
specMD_M3<-lm((Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond), data=specMD_ds)
sum_specMD_M3<-summary(specMD_M3)

plot(fitted(specMD_M3), resid(specMD_M3),xlab="Predicted Values", ylab="Residuals",main="Residual by Predicted plot")
qqnorm(resid(specMD_M3))
qqline(resid(specMD_M3))
plot(hatvalues(specMD_M3),rstudent(specMD_M3),xlim=c(0,1),main=c("Studentized Residuals vs. Hat values"))
abline(h=-2)
abline(h=2)
abline(v=2*length(specMD_M3$coefficients)/length(specMD_M3$residuals)) 

fitted.values(specMD_M3)
residuals(specMD_M3)

specMD1<-specMD_ds[2:15,]
specMD2<-specMD_ds[c(1,3:15),]
specMD3<-specMD_ds[c(1,2,4:15),]
specMD4<-specMD_ds[c(1:3,5:15),]
specMD5<-specMD_ds[c(1:4,6:15),]
specMD6<-specMD_ds[c(1:5,7:15),]
specMD7<-specMD_ds[c(1:6,8:15),]
specMD8<-specMD_ds[c(1:7,9:15),]
specMD9<-specMD_ds[c(1:8,10:15),]
specMD10<-specMD_ds[c(1:9,11:15),]
specMD11<-specMD_ds[c(1:10,12:15),]
specMD12<-specMD_ds[c(1:11,13:15),]
specMD13<-specMD_ds[c(1:12,14:15),]
specMD14<-specMD_ds[c(1:13,15),]
specMD15<-specMD_ds[1:14,]

specMD1_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD1)
specMD2_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD2)
specMD3_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD3)
specMD4_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD4)
specMD5_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD5)
specMD6_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD6)
specMD7_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD7)
specMD8_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD8)
specMD9_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD9)
specMD10_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD10)
specMD11_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD11)
specMD12_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD12)
specMD13_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD13)
specMD14_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD14)
specMD15_M2<-lm(Spectral_Peak ~ Torsion_15+ Angle_3+ DisulfideBond, data=specMD15)
