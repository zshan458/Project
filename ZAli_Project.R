library(dplyr)
library(lattice)
library(RColorBrewer)

myColours <- brewer.pal(7,"Blues")

my.settings <- list(
  superpose.polygon=list(col=myColours[2:6], border="transparent"),
  strip.background=list(col=myColours[7]),
  strip.border=list(col="black")
)


#setwd("C:/Users/Zeeshan/Documents/Data Science/CSCI84/Project/Data")
#KSAge <- read.csv (file="KSAge.csv", header=TRUE, sep=",")
#KSGender <-  read.csv (file="KSGender.csv", header=TRUE, sep=",")
#KSRace <- read.csv (file="KSRace.csv", header=TRUE, sep=",")
#KSElection <- read.csv(file="KSElection3.csv", header=TRUE, sep=",")
#save(KSElection, file="KSElection.RData")
#save(KSAge, file="KSAge.RData")
#save(KSGender, file="KSGender.RData")
#save(KSRace, file="KSRace.RData")

load("KSElection.RData")
load("KSAge.RData")
load("KSGender.RData")
load("KSRace.RData")
###############################
# Bar graph for Age 
###############################
barchart(Voted~Age,data=KSAge,groups=Year, 
         scales=list(x=list(cex=0.8)),
         auto.key=list(space="top", columns=6, rectangles=TRUE, points=FALSE),
         xlab = "Age", ylab = "Voted Percentage",
         main = "Kansas voted by Age and Year\n",
         
         par.settings = my.settings,
         par.strip.text=list(col="white", font=2),
         panel=function(x,y,...)
        {
           panel.grid(h=-1, v=0); 
           panel.barchart(x,y,...)
         }
)




###############################
# Bar graph for Gender
###############################
barchart(Voted~Gender,data=KSGender,groups=Year,
         scales=list(x=list(cex=0.75)), ylab="Voted Percentage", xlab = "Gender",
         main="Kansas Voter by Gender and Year\n",
         auto.key=list(space="top", columns=6, 
                       rectangles=TRUE, points=FALSE),
         par.settings = my.settings,
         par.strip.text=list(col="white", font=2),
         panel=function(x,y,...)
         {
           panel.grid(h=-1, v=0); 
           panel.barchart(x,y,...)
         }
         )



###############################
# Bar graph for Race
###############################
barchart(Voted~Race,data=KSRace,groups=Year,
         scales=list(x=list(cex=0.75)), ylab="Voted Percentage", xlab = "Race",
         main="Kansas Voter by Race and Year\n",
         auto.key=list(space="top", columns=6, 
                       rectangles=TRUE, points=FALSE),
         
         par.settings = my.settings,
         par.strip.text=list(col="white", font=2),
         panel=function(x,y,...)
         {
           panel.grid(h=-1, v=0); 
           panel.barchart(x,y,...)
         }
         
         )



###############################
# Bar graph for voter turnout
###############################
barchart(Party~Percentage,data=KSElection,groups=Year,
          ylab="Party", xlab = "Percentage",
         main="Kansas Voter by Party and Year\n",
         xlim = c(0,1),
         auto.key=list(space="top", columns=6, 
                       rectangles=TRUE, points=FALSE),
         
         par.settings = my.settings,
         par.strip.text=list(col="white", font=2),
         panel=function(x,y,...){
           panel.grid(h=-1, v=0); 
           panel.barchart(x,y,...)
         })



rm(list=ls())
