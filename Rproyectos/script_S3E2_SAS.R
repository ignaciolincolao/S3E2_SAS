library(ggplot2)
library(tidyverse)
library(reshape2)
library(MBA)
library(dplyr)
library(vioplot)


require(reshape2)
require(ggplot2)


alldata = read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp1/info_save_test.txt", stringsAsFactors = FALSE)
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp2/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp3/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp4/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp5/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp6/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp7/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp8/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp9/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp10/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp11/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp12/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp13/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp14/info_save_test.txt", stringsAsFactors = FALSE))
alldata = rbind(alldata,read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp14/info_save_test2.txt", stringsAsFactors = FALSE))




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

alldata <- merge(x = alldata, y = confdata, by = "experiment")
alldata$ID <- 1:nrow(alldata)
alldata$exp_conf <- ""
for(i in 1:nrow(alldata)){
  alldata$exp_conf[i] <- paste(alldata$temp_init[i],
                           alldata$min_temp[i],
                           alldata$coolingRate[i],
                           alldata$k_reheating_init[i],
                           alldata$e_const[i],
                           alldata$n_reheating[i],
                           alldata$len1_init[i],
                           alldata$len2_init[i],
                           alldata$len3_init[i],
                           alldata$len4_init[i],
                           alldata$Th[i],
                           alldata$experiment[i],
                           collapse = "")
}

#alldata$exp_conf <- factor(alldata$exp_conf)


# 
# 
# ggplot(data=alldata[alldata[,"costBestSolution"] < 0.08,], aes(x=experiment, y=count)) +
#   geom_boxplot() 
# 
# 
# ggplot(data=alldata[(alldata[,"time"] < 1000) & (alldata[,"costBestSolution"] < 0.058) ,], aes(x=experiment, y=time)) +
#   geom_boxplot() +
#   geom_jitter()
# 
# 
# 
# ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=experiment, y=time)) +
#   geom_boxplot() +
#   geom_jitter()
# 
# 
# 
# ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_length_temp, y=costBestSolution)) +
#   geom_boxplot() #+
# #geom_jitter()
# 
# ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_accept, y=costBestSolution)) +
#   geom_boxplot() +
# geom_jitter()
# 
# 
# ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_reheat, y=costBestSolution)) +
#   geom_boxplot() #+
# #geom_jitter()
# 
# ggplot(data=alldata[alldata[,"costBestSolution"] < 1,], aes(x=conf_stop, y=costBestSolution)) +
#   geom_boxplot() #+
# #geom_jitter()

# mydata = as.matrix(read.csv("/home/ignacio/Proyectos/S3E2_SAS/experiments/exp7/save_exp/0.988/rate_0.98/100000.0/26-info-graficos.txt"), header=FALSE, sep=",")
# colnames(mydata)[1] <- "count"
# colnames(mydata)[2] <- "DistanciaN"
# colnames(mydata)[3] <- "Distancia"
# colnames(mydata)[4] <- "Segregation"
# colnames(mydata)[5] <- "costoCupo"
# colnames(mydata)[6] <- "costoCurrentSolution"
# colnames(mydata)[7] <- "temp"
# par(mfrow=c(2,2))
# #par(mfrow=c(1,1))
# plot(mydata[,"count"],mydata[,"Distancia"], ylab=bquote(bar(d)), xlab="iterations", type="l",col="blue")
# plot(mydata[,"count"],mydata[,"Segregation"], ylab="D", xlab="iterations" , type="l",col="blue")
# plot(mydata[,"count"],mydata[,"costoCupo"], ylab="C", xlab="iterations", type="l",col="blue")
# plot(mydata[,"count"],mydata[,"costoCurrentSolution"], ylab="Z", xlab="iterations", type="l",col="blue")




# datagroup = alldata %>%
#   group_by(temp_init,min_temp,coolingRate, k_reheating_init,e_const,n_reheating,len1_init,len2_init,len3_init,len4_init,Th,experiment) %>%
#   dplyr::summarize(median_costBestSolution = median(costBestSolution), best_costBestSolution = min(costBestSolution)) %>%
#   as.data.frame()

datagroup = alldata %>%
  group_by(temp_init,min_temp,coolingRate, k_reheating_init,e_const,n_reheating,len1_init,len2_init,len3_init,len4_init,Th,experiment) %>%
  dplyr::summarize(# Mediana de las soluciones
                   median_costBestSolution = median(costBestSolution), # Valor de la mediana
                   row_median_costBestSolution = costBestSolution[which.min(abs(costBestSolution - median(costBestSolution)))], # La fila mas cercana a la mediana
                   id_row_median_costBestSolution = ID[which.min(abs(costBestSolution - median(costBestSolution)))], # ID de la fila cercana a la mediana
                   route_row_median_costBestSolution = route[which.min(abs(costBestSolution - median(costBestSolution)))],
                   #time
                   median_time = median(time), # Mediana de tiempo
                   row_median_time = time[which.min(abs(time - median(time)))], # La fila mas cercana a la mediana en tiempo
                   id_row_median_time = ID[which.min(abs(time - median(time)))], # ID de la fila cercana a la mediana en tiempo
                   route_row_median_time = route[which.min(abs(time - median(time)))],
                   
                   # Mejores soluciones
                   best_costBestSolution = costBestSolution[which.min(costBestSolution)], # Valor de la mejor solucion
                   id_best_costBestSolution = ID[which.min(costBestSolution)], # Id de la mejor solución
                   route_best_costBestSolution = route[which.min(costBestSolution)],
                   # time
                   best_time = time[which.min(time)], # Mejor tiempo de solución
                   id_best_time = ID[which.min(time)], # Id de mejor tiempo
                   route_best_time = route[which.min(time)],
                  
                   )

datagroup$exp_conf <- ""
for(i in 1:nrow(datagroup)){
  datagroup$exp_conf[i] <- paste(datagroup$temp_init[i],
                               datagroup$min_temp[i],
                               datagroup$coolingRate[i],
                               datagroup$k_reheating_init[i],
                               datagroup$e_const[i],
                               datagroup$n_reheating[i],
                               datagroup$len1_init[i],
                               datagroup$len2_init[i],
                               datagroup$len3_init[i],
                               datagroup$len4_init[i],
                               datagroup$Th[i],
                               datagroup$experiment[i],
                               collapse = "")
}
#datagroup$exp_conf <- factor(datagroup$exp_conf)

# datagroup$conf <- factor(1:nrow(datagroup[,]))


## Graficos por convinacion de cada Hiper Parametro dentro del experimento


get_route_costBestSolution <- function(row){
  id = row$id_best_costBestSolution[1]
  route = ""
  route = paste(row$route_best_costBestSolution[1])
  route = substr(route,2,nchar(route))
  route = paste("~/Proyectos/S3E2_SAS/experiments/",row$experiment[1],route, sep="")
  route = gsub("test.txt", "graficos.txt",route)
  return(route)
}

get_route_median_costBestSolution <- function(row){
  id = row$id_row_median_costBestSolution[1]
  route = ""
  route = paste(row$route_row_median_costBestSolution[1])
  route = substr(route,2,nchar(route))
  route = paste("~/Proyectos/S3E2_SAS/experiments/",row$experiment[1],route, sep="")
  route = gsub("test.txt", "graficos.txt",route)
  return(route)
}

id=1 # 1 .. 207
route=""
route = paste(datagroup$route_best_costBestSolution[id])
route = substr(route,2,nchar(route))
route = paste("~/Proyectos/S3E2_SAS/experiments/",datagroup$experiment[id],route, sep="")
route = gsub("test.txt", "graficos.txt",route)
mydata = as.matrix(read.csv(route), header=FALSE, sep=",")
colnames(mydata)[1] <- "count"
colnames(mydata)[2] <- "DistanciaN"
colnames(mydata)[3] <- "Distancia"
colnames(mydata)[4] <- "Segregation"
colnames(mydata)[5] <- "costoCupo"
colnames(mydata)[6] <- "costoCurrentSolution"
colnames(mydata)[7] <- "temp"
par(mfrow=c(2,2))
plot(mydata[,"count"],mydata[,"Distancia"], ylab=bquote(bar(d)), xlab="iterations", type="l",col="blue")
plot(mydata[,"count"],mydata[,"Segregation"], ylab="D", xlab="iterations" , type="l",col="blue")
plot(mydata[,"count"],mydata[,"costoCupo"], ylab="C", xlab="iterations", type="l",col="blue")
plot(mydata[,"count"],mydata[,"costoCurrentSolution"], ylab="Z", xlab="iterations", type="l",col="blue")


## Graficos por experimento

## Dado un tiempo T la mejor solución medianas y la mejor de las mejores solución  para cada uno de los experimentos (dividir por cada convinación)

exp = "exp1"
datagroup.filter <- filter(datagroup,experiment == "exp1")
row_bestSolution <- datagroup.filter[which.min(datagroup.filter$best_costBestSolution),]
row_median_bestSolution <- datagroup.filter[which.min(datagroup.filter$row_median_costBestSolution),]

row_bestSolution$id_best_costBestSolution[1]
row_median_bestSolution$id_row_median_costBestSolution[1]

get_route_costBestSolution(row_bestSolution)

colnames(mydata)[1] <- "count"
colnames(mydata)[2] <- "DistanciaN"
colnames(mydata)[3] <- "Distancia"
colnames(mydata)[4] <- "Segregation"
colnames(mydata)[5] <- "costoCupo"
colnames(mydata)[6] <- "costoCurrentSolution"
colnames(mydata)[7] <- "temp"


###################################


get_route <- function(row){
  
  route <- ""
  print(row$route[1])
  route <- paste(row$route[1])
  route <- substr(route,2,nchar(route))
  exper <- row$experiment[1]
  if(exper == "exp14v2"){
    exper <- "exp14"
  }
  route <- paste("~/Proyectos/S3E2_SAS/experiments/",exper,route, sep="")
  route <- gsub("test.txt", "graficos.txt",route)
  return(route)
}


data_conf <- read.table(get_route(alldata[1,]), header=FALSE, sep=",",stringsAsFactors = FALSE)
data_conf$dist <- abs(data_conf[,1]-2000000)
dataI <- data_conf[which.min(data_conf$dist),]



data2M <- data.frame(count=dataI$V1, 
                     DistanciaN=dataI$V2, 
                     Distancia=dataI$V3, 
                     Segregation=dataI$V4, 
                     costoCupo=dataI$V5, 
                     costoCurrentSolution=dataI$V6, 
                     temp=dataI$V7,
                     conf=alldata$exp_conf[1],
                     count_replica=1,
                     experiment=conf$experiment
                     )


for(i in 1:nrow(datagroup)){
  conf <- datagroup[i,]
  reps <- which(alldata$exp_conf == conf$exp_conf)
  data_replicas <- alldata[reps,]
  data2M_replicas <- data2M[1,]
  
  for(j in 1:nrow(data_replicas)){
    data_conf <- read.table(get_route(data_replicas[j,]), header=FALSE, sep=",",stringsAsFactors = FALSE)
    data_conf$dist <- abs(data_conf[,1]-2000000)
    dataI <- data_conf[which.min(data_conf$dist),]
    
    data2M_replicas <- rbind(data2M_replicas,data.frame(count=dataI$V1, 
                         DistanciaN=dataI$V2, 
                         Distancia=dataI$V3, 
                         Segregation=dataI$V4, 
                         costoCupo=dataI$V5, 
                         costoCurrentSolution=dataI$V6, 
                         temp=dataI$V7,
                         conf=conf$exp_conf,
                         count_replica= j,
                         experiment=conf$experiment)
    )
    
  }
  data2M <- rbind(data2M,data2M_replicas[-1,])
  
}

data2M_all <- data2M[-1,]


#write.csv(data2M_all, file="data2M_all.csv", row.names=TRUE)
data2M_all = read.csv("data2M_all.csv", stringsAsFactors = FALSE, header=TRUE)

ggplot(data2M_all, aes(x=time,y=costoCurrentSolution))+
  geom_point()


# grafica de violin  # convinar experimento y configuracion

library("vioplot")
library('ggplot2')
library(tidyr)
par(mfrow=c(1,1))


ggplot(data2M_all[,data2M_all["costoCurrentSolution"] < 0.1], aes(x=experiment,y=costoCurrentSolution))+geom_violin()

ggplot(data=data2M_all[data2M_all[,"costoCurrentSolution"] < 0.1,], aes(x=experiment, y=costoCurrentSolution)) +
  geom_split_violin()

data2M_sample = data.frame(conf=data2M_all$conf,
                           experiment=as.character(data2M_all$experiment),
                           costoCurrentSolution=data2M_all$costoCurrentSolution,
                           stringsAsFactors = FALSE)



data2M_all %>% 
          ggplot(aes(x = conf, y = costoCurrentSolution,fill=conf, color = conf))+
          geom_violin(show.legend = FALSE)+
          facet_wrap(.~experiment)+
          theme(legend.title = element_blank())




data2M_all[(data2M_all[,"experiment"] == "exp2") & (data2M_all[,"costoCurrentSolution"] < 0.1) ,] %>% 
  ggplot(aes(x = experiment, y = costoCurrentSolution,fill=conf, color = conf))+
  geom_violin()



vioplot(data2M_all$costoCurrentSolution ~ data2M_all$experiment, col = 2:length(levels(data2M_all$experiment)))

















data_median_costBestSolution  <- as.matrix(read.csv(get_route_median_costBestSolution(row_median_bestSolution)), header=FALSE, sep=",")

colnames(mydata)[1] <- "count"
colnames(mydata)[2] <- "DistanciaN"
colnames(mydata)[3] <- "Distancia"
colnames(mydata)[4] <- "Segregation"
colnames(mydata)[5] <- "costoCupo"
colnames(mydata)[6] <- "costoCurrentSolution"
colnames(mydata)[7] <- "temp"
par(mfrow=c(2,2))
plot(mydata[,"count"],mydata[,"Distancia"], ylab=bquote(bar(d)), xlab="iterations", type="l",col="blue")
plot(mydata[,"count"],mydata[,"Segregation"], ylab="D", xlab="iterations" , type="l",col="blue")
plot(mydata[,"count"],mydata[,"costoCupo"], ylab="C", xlab="iterations", type="l",col="blue")
plot(mydata[,"count"],mydata[,"costoCurrentSolution"], ylab="Z", xlab="iterations", type="l",col="blue")



## Graficos de todos los experimentos juntos 


# Route










