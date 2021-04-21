
#Histogram in Lattice, note the empty y value

require(lattice)

histogram(~Sepal.Length | Species, xlab="",data=iris,
          layout=c(3,1), type="density",
          main="Lattice Histogram", sub="Iris Dataset, Sepal Length")

#types: percent, count, density are possible
#text arguments are the same as in R Base

#Q Q plots= Quantile-Quantile plots
#plot Quantiles of the dataset against the quantiles of a 
#theoritical distribution 
#in case the chosen distribution is met you can find
#a nearly linear plot

qqmath(~Sepal.Length | Species, data=iris)
#uniform distribution
qqmath(~Sepal.Length | Species, data=iris, distribution = qunif)

#Boxplots in Lattice
bwplot(Species~Sepal.Length, data = iris)

#The same information can also be shown as a voilin plot
bwplot(Species~Sepal.Length, data=iris,
       panel=panel.violin)

#the violin plot gives more information on the distribution of the dataset

