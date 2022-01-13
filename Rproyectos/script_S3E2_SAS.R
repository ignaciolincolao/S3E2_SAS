library(rayshader)
library(ggplot2)
library(tidyverse)
library(reshape2)
library(MBA)
library(dplyr)

require(reshape2)
require(ggplot2)


alldata = read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp1/info_save_test.txt")
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp2/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp3/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp4/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp5/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp6/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp7/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp8/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp9/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp10/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp11/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp12/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp13/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp14/info_save_test.txt"))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp14/info_save_test2.txt"))




# 8, 10, 11
confdata = data.frame("exp1","it1","cs2","tl7","ne1","ac1","sc3","tr1",stringsAsFactors = FALSE)
confdata = rbind(confdata,c("exp2","it1","cs2","tl7","ne1","ac3","sc3","tr1")) 
confdata = rbind(confdata,c("exp3","it1","cs2","tl7","ne1","ac6","sc3","tr1")) 
confdata = rbind(confdata,c("exp4","it1","cs2","tl8","ne1","ac1","sc3","tr1")) 
confdata = rbind(confdata,c("exp5","it1","cs2","tl8","ne1","ac3","sc3","tr1")) 
confdata = rbind(confdata,c("exp6","it1","cs2","tl8","ne1","ac6","sc3","tr1")) 
confdata = rbind(confdata,c("exp7","it1","cs2","tl9","ne1","ac1","sc3","tr1")) 
confdata = rbind(confdata,c("exp8","it1","cs2","tl9","ne1","ac3","sc3","tr1")) 
confdata = rbind(confdata,c("exp9","it1","cs2","tl9","ne1","ac6","sc3","tr1")) 
confdata = rbind(confdata,c("exp10","it1","cs2","tl11","ne1","ac1","sc3","tr1")) 
confdata = rbind(confdata,c("exp11","it1","cs2","tl11","ne1","ac3","sc3","tr1")) 
confdata = rbind(confdata,c("exp12","it1","cs2","tl11","ne1","ac6","sc3","tr1"))
confdata = rbind(confdata,c("exp13","it1","cs2","tl7","ne1","ac1","sc9","tr11")) 
confdata = rbind(confdata,c("exp14","it1","cs2","tl7","ne1","ac1","sc9","tr14")) 
confdata = rbind(confdata,c("exp14v2","it1","cs2","tl7","ne1","ac1","sc9","tr14")) 
colnames(confdata) = c("experiment",
                       "conf_temp_init",
                       "conf_cooling_rate",
                       "conf_length_temp",
                       "conf_exploration",
                       "conf_accept",
                       "conf_stop",
                       "conf_reheat")

alldata = merge(x = alldata, y = confdata, by = "experiment")

ggplot(data=alldata[alldata[,"costBestSolution"] < 0.08,], aes(x=experiment, y=costBestSolution)) +
  geom_boxplot() +
  geom_jitter()

ggplot(data=alldata[alldata[,"experiment"] == "exp14",], aes(group=n_reheating, x=n_reheating, y=costBestSolution)) +
  geom_boxplot() #+
  #geom_jitter()

ggplot(data=alldata[(alldata[,"time"] < 5000) & (alldata[,"costBestSolution"] < 0.1) & (alldata[,"n_reheating"] >= 2537505),], aes(x=experiment, y=costBestSolution)) +
  geom_boxplot() +
  geom_jitter()



ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=experiment, y=time)) +
  geom_boxplot() +
  geom_jitter()



ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_length_temp, y=costBestSolution)) +
  geom_boxplot() #+
#geom_jitter()

ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_accept, y=costBestSolution)) +
  geom_boxplot() +
geom_jitter()


ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_reheat, y=costBestSolution)) +
  geom_boxplot() #+
#geom_jitter()

ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_stop, y=costBestSolution)) +
  geom_boxplot() #+
#geom_jitter()

mydata = as.matrix(read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp7/save_exp/0.988/rate_0.98/100000.0/26-info-graficos.txt"), header=FALSE, sep=",")
colnames(mydata)[1] <- "count"
colnames(mydata)[2] <- "DistanciaN"
colnames(mydata)[3] <- "Distancia"
colnames(mydata)[4] <- "Segregation"
colnames(mydata)[5] <- "costoCupo"
colnames(mydata)[6] <- "costoCurrentSolution"
colnames(mydata)[7] <- "temp"
par(mfrow=c(2,2))
#par(mfrow=c(1,1))
plot(mydata[,"count"],mydata[,"Distancia"], ylab=bquote(bar(d)), xlab="iterations", type="l",col="blue")
plot(mydata[,"count"],mydata[,"Segregation"], ylab="D", xlab="iterations" , type="l",col="blue")
plot(mydata[,"count"],mydata[,"costoCupo"], ylab="C", xlab="iterations", type="l",col="blue")
plot(mydata[,"count"],mydata[,"costoCurrentSolution"], ylab="Z", xlab="iterations", type="l",col="blue")
