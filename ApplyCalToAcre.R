#####Script to Apply Olivia's Intensive Calibration fit to other data####

#Calibration data collected by Olivia Salmon (PhD) and Dr. LWelp
#Calibration code created by Olivia Salmon
#Code adjusted for use by Ali Meyer 2020 (meyer269@purdue.edu)

######Load in Olivia's Cal function##########
  #setwd()  #change this path
load(file="Oliviafitfn.RData") 
#This loads in a file that OliviaCalFitfn.R created
#Variables are fitfn_DOlivia, fitfn_O18Olivia, xD, yD, x18O, y18O
#Aka the fits to the cal data (xD, etc.)
  
######Load in Acre data and prepare calibration######
#install.packages("caTools")
library(caTools)
library(ggplot2)
library(caTools)

#Here you load in your experimental data and time correct
  #make sure to change the path!
wvia1.df <- read.csv("/export/project/xxxxxx.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)

wvia1.df$time <- strptime(wvia1.df$Time_1s, '%m/%d/%Y %H:%M:%S')

#The only variable you really need from your data right now is measured H2O
H2O<- wvia1.df$LH2O
  #change $LH2O for your water column name!

####Prepare Calibration Correction factors####
# This makes your "calibration correction factors" based on your H2O values
CalCor_dD <- fitfn_DOlivia(H2O)
CalCor_dO18 <- fitfn_O18Olivia(H2O)

#quick plot check to make sure the curves look right
  #should look like the original fit curve
plot(H2O,CalCor_dD)
plot(H2O,CalCor_dO18)
            

            
####Apply calibration to your data#####
#Subtract CalCor values we calculated from your H2O values
#from your measured TWVIA obs data to get calibrated isotope data
   #change $D or $O18 to your column name
Dcal<-wvia1.df$D-CalCor_dD1
O18cal<-wvia1.df$O18-CalCor_dO181
                
                
####Save original data along with the correction factors and final calibrated data####
wvia1.df<-cbind(wvia1.df, CalCor_dD1, CalCor_dO181, Dcal, O18cal)
#This will be the dataframe you use for further analysis
#It will save all of the original columns, but add on your calibration correction factors
#and the final calibrated isotope values 