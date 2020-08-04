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
barplot(data$Confirmed,data$Recovered,col=c("red"))
barplot(data$Confirmed,data$Deceased)
print(summary(data1))
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
       plotOutput(outputId = "distPlot1")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    
    x    <- data$KA
    x    <- na.omit(x)
    
    barplot(data$Confirmed,data$Recovered,col =input$color1, border = input$border1)
#barplot(data$Confirmed,data$Deceased)
    #hist(x,  col ="red", border = input$border1,
        # xlab = "Number of cases",
        # main = "Histogram ")
    
  })
  output$distPlot1 <- renderPlot({
    
    
    x    <- data$KA
    x    <- na.omit(x)
    
    #barplot(data$Confirmed,data$Recovered,col =input$color1, border = input$border1)
barplot(data$Confirmed,data$Deceased)
    #hist(x,  col ="red", border = input$border1,
        # xlab = "Number of cases",
        # main = "Histogram ")
    
  })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
