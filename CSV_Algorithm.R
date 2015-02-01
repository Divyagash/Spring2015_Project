# Time R project for 2015 
setwd("/Users/Divy/Documents/Time-R")
CSVData<-read.csv("BHK_BCancer.csv",header = TRUE,skip=27)

# Allocate apporpriate data set to the specified 8 clusters.

CAL<-CSVData[CSVData$dataset == "CAL",]
MNZ<-CSVData[CSVData$dataset == "MAINZ",]
MSK<-CSVData[CSVData$dataset == "MSK",]
ST1<-CSVData[CSVData$dataset == "MDA5"|CSVData$dataset == "TAM"|
               CSVData$dataset == "VDX3",]
ST2<-CSVData[CSVData$dataset == "EXPO"| CSVData$dataset == "TAM",]
TRB<-CSVData[CSVData$dataset == "TRANSBIG",]
UNT<-CSVData[CSVData$dataset == "UNT",]
VDX<-CSVData[CSVData$dataset == "VDX",]

# Number of patients with ER+(Estrogen Receptor-positive)
DatasetNames<-c("CAL","MNZ","MSK","ST1","ST2","TRB","UNT","VDX")
CAL_ER<-sum(CAL$er,na.rm = TRUE)
MNZ_ER<-sum(MNZ$er,na.rm = TRUE)
MSK_ER<-sum(MSK$er,na.rm = TRUE)
ST1_ER<-sum(ST1$er,na.rm = TRUE)
ST2_ER<-sum(ST2$er,na.rm = TRUE)
TRB_ER<-sum(TRB$er,na.rm = TRUE)
UNT_ER<-sum(UNT$er,na.rm = TRUE)
VDX_ER<-sum(VDX$er,na.rm = TRUE)
ER<-c(CAL_ER,MNZ_ER,MSK_ER,ST1_ER,ST2_ER,TRB_ER,UNT_ER,VDX_ER)
barplot(ER,names.arg=DatasetNames,main = "ER positive cases in each dataset")
boxplot(CAL$t.os,TRB$t.os)

#Tumor size
boxplot(CAL$size,MNZ$size,MSK$size,ST1$size,ST2$size,TRB$size,UNT$size,
        VDX$size)
