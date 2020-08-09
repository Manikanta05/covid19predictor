
##########################################################################
# Covid 19 Analysis and Prediction (Karnataka)
##########################################################################
##########################################################################
# Reactive apps using the shiny library 
##########################################################################

# Here we are using the readcsv library to import dataset
# Make sure to set working directory in the "Files" panel
# So that the data is picked up from the correct directory

# Load necessary libraries
library("shiny")
library("shinythemes")
library("dplyr")
library("caTools")
library("pracma")
# Read dataset directly from the url
data<-read.csv("https://api.covid19india.org/csv/latest/states.csv",sep=",",header=TRUE)
#Extract the required data by Filtering
data1<-filter(data,State=="Karnataka")


