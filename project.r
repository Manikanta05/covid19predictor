##########################################################################
# Reactive apps using the shiny library
#
# Interactive Histogram on Bizpur Salary Data #
##########################################################################

# Here we are using the readxl library to import data
# Make sure to set working directory in the "Files" panel
# So that the data is picked up from the correct directory

# Read Bizpur data from the excel sheet
#library(readxl)
library(openxlsx)
library(shiny)
library(shinythemes)
library(dplyr)
library(caTools)
data<-read.csv("https://api.covid19india.org/csv/latest/states.csv",sep=",",header=TRUE)
View(data)
data1<-filter(data,State=="Karnataka")
View(data1)
plot(data$KA,data$Date,log="y")
#print(summary(data))
##########################################################################
# A shiny app is created in 3 steps:
# 1. Create a UI page (What should be displayed to user)
# 2. Create Server / backend logic (What should be executed at backend)
# 3. Run the Shiny app binding the UI page and Server / backend logic
##########################################################################

#########################################################################
# Here is the first step of creating the UI page

# We start by calling the fluidPage function 
# This creates the overall UI for the app
ui <- fluidPage(theme = shinytheme("darkly"),




skeleton
problem statement
introduction
prediction
charts
methodology














Patient Level : Raw Data Partition 1 (Till Apr 19) 	https://api.covid19india.org/raw_data1.json
:green_heart: 	Patient Level : Raw Data Partition 2 (From Apr 20 to Apr 26) 	https://api.covid19india.org/raw_data2.json
:green_heart: 	Patient Level : Raw Data Partition 3 (From Apr 27 to May 09) 	https://api.covid19india.org/raw_data3.json
:green_heart: 	Patient Level : Raw Data Partition 4 (From May 10 to May 23) 	https://api.covid19india.org/raw_data4.json
:green_heart: 	Patient Level : Raw Data Partition 5 (From May 24 to Jun 04) 	https://api.covid19india.org/raw_data5.json
:green_heart: 	Patient Level : Raw Data Partition 6 (From Jun 05 to Jun 19) 	https://api.covid19india.org/raw_data6.json
:green_heart: 	Patient Level : Raw Data Partition 7 (From Jun 20 to Jun 30) 	https://api.covid19india.org/raw_data7.json
:green_heart: 	Patient Level : Raw Data Partition 8 (From Jul 01 to Jul 07) 	https://api.covid19india.org/raw_data8.json
:green_heart: 	Patient Level : Raw Data Partition 9 (From Jul 08 to Jul 13) 	https://api.covid19india.org/raw_data9.json
:green_heart: 	Patient Level : Raw Data Partition 10 (From Jul 14 to Jul 17) 	https://api.covid19india.org/raw_data10.json
:green_heart: 	Patient Level : Raw Data Partition 11 (From Jul 18 to Jul 22) 	https://api.covid19india.org/raw_data11.json
:green_heart: 	Patient Level : Raw Data Partition 12 (From Jul 23rd onwards) 	https://api.covid19india.org/raw_data12.json
:green_heart: 	National Level :Time series, State-wise stats and Test counts 	https://api.covid19india.org/data.json
:green_heart: 	State Level : has district-wise info 	https://api.covid19india.org/state_district_wise.json
:green_heart: 	State Level : Daily changes 	https://api.covid19india.org/states_daily.json
:green_heart: 	State Level : Testing data 	https://api.covid19india.org/state_test_data.json
:green_heart: 	National/State/District Level : Latest cumulative/daily counts 	https://api.covid19india.org/v4/data.json
:green_heart: 	National/State/District Level : Specific date cummulative/daily counts 	https://api.covid19india.org/v4/data-YYYY-MM-DD.json
:green_heart: 	National/State/District Level : Historical date-wise cumulative/daily counts 	https://api.covid19india.org/v4/data-all.json
:green_heart: 	National/State Level: Timeseries_(different structure)_ 	https://api.covid19india.org/v4/timeseries.json
:end: 	District Level : Daily changes 	https://api.covid19india.org/districts_daily.json
:end: 	Raw Data (Partition 1 + Partition 2. Frozen after Apr 26th) 	https://api.covid19india.org/raw_data.json
:end: 	Deaths and Recoveries (Frozen after Apr 26th) 	https://api.covid19india.org/deaths_recoveries.json
:end: 	Travel history (No more updated) 	https://api.covid19india.org/travel_history.json



# App title ----
titlePanel("Data visualization"),

# Sidebar layout with input and output definitions ----
sidebarLayout(
  
  # Sidebar panel for inputs ----
  sidebarPanel(
    # Here, a header is created and one slider input
     # Header of size h4
    
    # Input: Slider for the number of bins ----
    selectInput(inputId = "color1",label = "Choose Color",choices = c("Red"="Red","Blue"="Blue","Green"="Green"),
                selected = "Blue"),
    
    
    radioButtons(inputId = "border1",label = "Select Border",choices = c("Black"="#ffffff","White"="#000000","Red"="Red","Blue"="Blue","Green"="Green"))
                 
                 
                 
  
                 
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    
    x    <- data$KA
    x    <- na.omit(x)
    
    
    hist(x,  col ="red", border = input$border1,
         xlab = "Number of cases",
         main = "Histogram ")
    
  })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)