#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic 
shinyServer(function(input, output) {
   
       output$odate = renderPrint({input$date})
       output$text1 <- renderText({input$text1})
       output$text2<- renderText({colorplot<-input$text1
              if(colorplot %in% c("red", "blue","green","black","cyan")){
                 text2<-"Good color choice!"}
                  else{colorplot="red"
                 text2 <- "Let me help... How about Red then? "
                 }
       })
       output$distPlot <- renderPlot({
           input$goButton
              isolate({
              colorplot<-input$text1
              if(colorplot %in% c("red", "blue","green","black","cyan")){
                     text2<-"good choice"}
                  else{colorplot="red"
                     text2 <- "How about Red then? "
                     }
       
                   coplot(conc~uptake|as.factor(Plant),data=CO2,
                   col=colorplot,panel = panel.smooth, rows = input$rows)
        
              })
           })
       })
