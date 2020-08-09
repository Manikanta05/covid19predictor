#####################################################################################################
# Here comes the second part!
# Define server logic required to draw a bar plot ----
library("shiny")
library("dplyr")
library("caTools")
library("pracma")
server <- function(input, output,session) {      
colors = c("red","green","blue")
months = list("March","April","May","June","July","August","September","October","November","December")
regions <- c("Confirmed","Recovered","Deceased")
m<-c(3,4,5,6,7,8,9,10,11,12)
Months<-  filter(data1,Date=="2020-03-31"|Date=="2020-04-30"|Date=="2020-05-31"|Date=="2020-06-30"|Date=="2020-07-31"|Date=="2020-08-31"|Date=="2020-09-30"|Date=="2020-10-31"|Date=="2020-11-30"|Date=="2020-12-31")
val=c(c(Months$Confirmed),c(Months$Recovered),(Months$Deceased))
val1=c(data1$Confirmed)
val2=c(data1$Recovered)
val3=c(data1$Deceased)
Values <- matrix(val, nrow = 3, ncol = nrow(Months), byrow = TRUE)
Values1 <- matrix(val1, nrow = 1, ncol = nrow(data1), byrow = TRUE)
Values2 <- matrix(val2, nrow = 1, ncol = nrow(data1), byrow = TRUE)
Values3 <- matrix(val3, nrow = 1, ncol = nrow(data1), byrow = TRUE)

  output$distPlot <- renderPlot({
# Displaying Graphs based on FILTER
 if(input$filter=="NONE") {
     barplot(Values, bg="transparent",main = "Graph of all cases", names.arg = months[1:nrow(Months)],xlab = "Month", ylab = "Number of people", col = colors)#col.axis="#dddddd", fg="white",col.main="white",col.lab="grey",names.arg = months,
 legend("topleft", regions, cex = 1.5, fill = colors,col="white",box.col="black",bg="white")
   }
    else if(input$filter=="Confirmed") {      
 barplot(Values1, bg="transparent",main = "Graph of Confirmed", names.arg = data1$Date,xlab = "Month", ylab = "Number of people", col = "red",border = "white")#col.axis="#dddddd", fg="white",col.main="white",col.lab="grey",names.arg = months,
 legend("topleft","Confirmed" , cex = 1.5, fill ="red" ,col="white",box.col="black",bg="white")
  }
   else if(input$filter=="Recovered") {      
 barplot(Values2, bg="transparent",main = "Graph of Recovered", names.arg = data1$Date,xlab = "Month", ylab = "Number of people", col = "green",border = "white")#col.axis="#dddddd", fg="white",col.main="white",col.lab="grey",names.arg = months,
 legend("topleft","Recovered", cex = 1.5, fill ="green",col="white",box.col="black",bg="white")
  }    
     else  {      
 barplot(Values3, bg="transparent",main = "Graph of Deceased", names.arg = data1$Date,xlab = "Month", ylab = "Number of people", col = "blue",border = "white")#col.axis="#dddddd", fg="white",col.main="white",col.lab="grey",names.arg = months,
 legend("topleft", "Deceased", cex = 1.5, fill ="blue",col="white",box.col="black",bg="white")  
    }
  })
  # Displaying information regarding total number of cases ---
  output$text1<-renderText({"Confirmed number of cases :"}  )
  output$text2<-renderText({return(max(data1$Confirmed))})
   
  output$text3<-renderText({"Recovered number of cases :"}  )
  output$text4<-renderText({return(max(data1$Recovered))})

  output$text5<-renderText({"Deceased number of cases :"}  )
  output$text6<-renderText({return(max(data1$Deceased))})

 # Displaying information regarding prediction of number of cases ---
  output$text7<-renderText({"Confirmed cases of this month would be :"}  )
  output$text8<-renderText({newtonInterp(m[1:nrow(Months)],Months$Confirmed,xs=m[c(nrow(Months))]+1)})
   
  output$text9<-renderText({"Recovered cases of this month would be :"}  )
  output$text10<-renderText({newtonInterp(m[1:nrow(Months)],Months$Recovered,xs=m[c(nrow(Months))]+1)})

  output$text11<-renderText({"Deceased cases of this month would be :"}  )
  output$text12<-renderText({newtonInterp(m[1:nrow(Months)],Months$Deceased,xs=m[c(nrow(Months))]+1)})

# Formatting and displaying system time
  output$currentTime<-renderText({invalidateLater(as.integer(1000),session)
  format(Sys.time())})
 
}
