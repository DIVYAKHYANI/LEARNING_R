##Exercise test for normality

#Dataset = diamonds, Library=ggplot2>

#get familiar with the diamonds dataset, what does the columns tell us?

#perform at least 2 graphical tests for normality

#get faster with the package nortest and perform atleast 3 different tests for normality

install.packages("ggplot2")
head(diamonds)
attach(diamonds)

qqnorm(depth)#looks too curvy for a normal distr
hist(depth)#hist looks also not normal

depthsmall=sample(depth,5000)#sampling to get a vector fitted for shapiro
 
#Base Packages
shapiro.test(depthsmall)#shapiro will test from base pack

#Nortest test for normality
install.packages("nortest")#pack contains several useful normality tests

library(nortest)

sf.test(depthsmall) #shapiro francia

cvm.test(depth)#cramer von mises test, since AD gives NAS for that high significance

lillie.test(depth)#kolmogrov smirnov
 
pearson.test(depth)#Pearson normality test
