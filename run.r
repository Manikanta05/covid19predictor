###########################################################################
# The last but not the least part 
# Combining both server and ui into a Shinyapp
# Create Shiny app ----
shinyApp(ui = ui, server = server)
library(shiny)

port <- Sys.getenv('PORT')

shiny::runApp(
  appDir = getwd(),
  host = '0.0.0.0',
  port = as.numeric(port)
)
# Hurray ! 
############################################################################
