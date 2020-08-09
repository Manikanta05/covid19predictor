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
library(shiny)
library("shinythemes")
library("dplyr")
library("caTools")
library("pracma")
ui <- fluidPage(
# Selecting Theme for UI
theme=shinytheme("slate"),
# Selecting Title for UI
titlePanel("Covid-19 Analysis and prediction"),
# Header and Time
tags$table( style="border: 0px solid white;padding: 1%; width:100%;",
            tags$td(tags$b(tags$h1("KARNATAKA"))),
            tags$td(tags$h3(textOutput("currentTime",container=span),align="right"))),
#Building Sidebar Layout and Pannel
sidebarLayout(
  sidebarPanel(  
    # Displaying necessary text for identification of figures  
       tags$h3("Information about TOTAL number of cases:"),
      tags$h4( textOutput("text1"),#confirmed cases
       textOutput("text2"),#confirmed count
       textOutput("text3"),#recovered cases
       textOutput("text4"),#recovered count
       textOutput("text5"),#deceased cases
       textOutput("text6")),#deceased count
       # Displaying image directly from a link
       tags$img(src="https://upload.wikimedia.org/wikipedia/commons/8/82/SARS-CoV-2_without_background.png",align="center",height="150px",width="150px"),
       # Displaying options for Graph filter
       selectInput("filter","Choose Filter:",list("NONE","Confirmed","Recovered","Deceased"),selected="NONE")
    ),
    # Building Mainpanel
    mainPanel(      
      # Output: Bar Plots with necessary information ---- 
      plotOutput(outputId = "distPlot"),
     tags$b( tags$h3("Prediction :")),
      # Displaying Prediction results with text and figures
      tags$table(
        tags$tr(
        tags$td(
          textOutput("text7"),#confirmed prediction
       textOutput("text8"),#confirmed count
       ),
       tags$td(
       textOutput("text9"),#recovered prediction
        textOutput("text10"),#recovered count
          ),
           tags$td(
       textOutput("text11"),#deceased prediction
       textOutput("text12")#deceased count
         )
      ),
      style="border: 0.5px solid white;padding: 1%; width:100%;"
      )
    )
  )
)
