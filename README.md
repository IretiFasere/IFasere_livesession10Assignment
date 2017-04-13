# IFasere_livesession10Assignment
1.#Create a new variable called AgeGroup from the nyt1 data


# Take a look at the Data set after changes.
head(nyt1)


2.# Create subset  “ImpSub” where Impressions > 0 ) in your data set.
ImpSub <- subset(nyt1, Impressions>0)

# Create variable cick-through-rate (CTR)and add to ImpSub
ImpSub$CTR <- ImpSub$Clicks/ImpSub$Impressions

3.# Plot the distribution of number of Impressions and CTR by AgeGroup.
library(ggplot2) # used for visualizations
ggplot(subset(ImpSub, Impressions>0), aes(x=Impressions, fill=AgeGroup))+
geom_histogram(binwidth=1)

4.# Define new variable to segment users based on CTR

5.# Get the total number of Male, Impressions, Clicks and Signed_In

6.#Get the mean of Age, Impressions, Clicks, CTR and percentage of males and signed_In 

7. #Get the means of Impressions, Clicks, CTR and percentage of males and signed_In by AgeGroup.

8.#CTRGroup vs. AgeGroup counts

9.#Plot distributions of number impressions and click-through-rate for the age groups


10.#One more plot you think which is important to look at.
