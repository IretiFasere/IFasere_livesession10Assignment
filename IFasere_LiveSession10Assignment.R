---
  title: "IFasere_LiveSession10a Assignment"
author: "Ireti Fasere"
date: "April 12, 2017"
output: 
  html_document:
  keep_md:True
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
###Setup and Importing the Raw Data.

Set my work directory to my dataset file  location.
```{r}
setwd("D:/DODATAHW/")
getwd()
```
```{r}
##Download the Url to my Directory.

site <- "(http://stat.columbia.edu/~rachel/datasets/nyt1.csv)"

download.file(site,destfile="./nyt1.csv")
```

```{r}
##Importing the nyt1 data file.

nyt1=df<-read.csv("nyt1.csv", header = TRUE, sep=",",na.strings=c("", "NA"))
head(nyt1) #Checking the data.
str(nyt1)#Checking the data.
summary(nyt1)#Checking the data.
```
```{r}
# Visualization of the Age column
hist(nyt1$Age, main="", xlab="Age")
range(nyt1$Age)

# Visualization of the Impressions column
hist(nyt1$Impressions, main="", xlab="# of Impressions")
range(nyt1$Impressions)

# Visualization of the Clicks column
hist(nyt1$Clicks, main="", xlab="# of Clicks")
range(nyt1$Clicks)
```

```{r}
1.#Create a new variable called AgeGroup
nyt1$AgeGroup <- cut(nyt1$Age, c(-Inf, 18, 24, 34, 44, 54, 64, Inf))
levels(nyt1$AgeGroup) <- c("<18", "18-24", "25-34", "35-44", "45-54", "55-64", "65+")

# Take a look at the Data set after changes.
head(nyt1)
```

```{r}
2.# Create subset  “ImpSub” where Impressions > 0 ) in your data set.
ImpSub <- subset(nyt1, Impressions>0)
# Create variable cick-through-rate (CTR)and add to ImpSub
ImpSub$CTR <- ImpSub$Clicks/ImpSub$Impressions

head(ImpSub)
```
```{r}
3.# Plot the distribution of number of Impressions and CTR by AgeGroup.
library(ggplot2) # used for visualizations
ggplot(subset(ImpSub, Impressions>0), aes(x=Impressions, fill=AgeGroup))+
  geom_histogram(binwidth=1)
```
```{r}
4.# Define new variable to segment users based on CTR
ImpSub$CTRGroup <-cut(ImpSub$CTR,c(-Inf,0.2,0.4,0.6,0.8,Inf))
head(ImpSub)
levels(ImpSub$CTRGroup) <- c("CTR<0.2","0.2<=CTR<0.4","0.4<=CTR<0.6","0.6<=CTR<0.8","CTR>0.8") 
levels(ImpSub$CTRGroup)
```
```{r}
5.# Get the total number of Male, Impressions, Clicks and Signed_In
ImpSub_male <- dim(ImpSub[ImpSub$Gender==1,])[1]
ImpSub_male

ImpSub_imp <- dim(ImpSub[ImpSub$Impressions>0,])[1]
ImpSub_imp 

ImpSub_clicks <- dim(ImpSub[ImpSub$Clicks>0,])[1]
ImpSub_clicks

ImpSub_signedIn <- dim(ImpSub[ImpSub$Signed_In>0,])[1]
ImpSub_signedIn

cat("the total number of Male = ",ImpSub_male,",Impressions =", ImpSub_imp,",Clicks=",ImpSub_clicks,",Signed_In = ",ImpSub_signedIn)
```
```{r}
6.#Get the mean of Age, Impressions, Clicks, CTR and percentage of males and signed_In 
sub_means <- sapply(list(nyt1$Age,nyt1$Impressions,nyt1$Clicks,nyt1$CTR,nyt1$Signed_In), FUN = mean)
names(sub_means) <- c("Avg.Age", "Avg.Imperssions", "Avg.Clicks","Avg.CTR","Avg.Signed_in")
print(sub_means)
## A subdata created as ImpSub_means
ImpSub_means <- sapply(list(ImpSub$Age,ImpSub$Impressions,ImpSub$Clicks,ImpSub[(ImpSub$CTR > 0),],ImpSub$Signed_In), FUN = mean)
names(ImpSub_means) <- c("Avg.Age", "Avg.Imperssions", "Avg.Clicks","Avg.CTR","Avg.Signed_in")
print(ImpSub_means)

```
```{r}
7.#Get the means of Impressions, Clicks, CTR and percentage of males and signed_In by AgeGroup.
aggregate(nyt1[c(1:5)],
          by = list(nyt1$AgeGroup),
          FUN = mean)
```
```{r}
8.#CTRGroup vs. AgeGroup counts
CTRAgeGroup <- table(ImpSub$CTRGroup,ImpSub$AgeGroup)
head(CTRAgeGroup)
```
```{r}
9.
#Plot distributions of number impressions and click-through-rate for the age groups

ggplot(subset(ImpSub,CTR>0), aes(x=CTR, colour = AgeGroup)) +
  geom_freqpoly(binwidth = 0.015) +
  ggtitle("CTR Click Through Rate by Age Group") + xlab("CTR (Clicks/Impressions)") + ylab("Count")

```
```{r}
10.
#One more plot you think which is important to look at.
hist(CTRAgeGroup, main="", xlab=" CTRGroup")
```




```{r}
##Download the Url to my Directory.
site <-	http://stat.columbia.edu/~rachel/datasets/nyt1.csv
download.file(site,destfile="./nyt1.csv")
##Importing the nyt1 data file.
nyt1=df<-read.csv("nyt1.csv",header = TRUE, sep=",",na.strings=c("", "NA"))
head(nyt1) #Checking the data.
str(nyt1)#Checking the data.
summary(nyt1)#Checking the data.
```
