#' This shiney app is uses the CO2 data set that is in the R data library
#' and seeks to demonstrate some basic reactive R shiney capabilities.
#'
#' @param x is CO2 uptake.
#' @param y is a vector for concentration of CO2
#' @plot is a result using Plant as a factor.
#' @author Neo
#' @details
#' This project is demonstrates reactive interfact capabilities R for
#' Developing Data Products.
#' This function runs a univariate regression on a predictor (CO2 uptake)
#' and plots to show the significance of the association with CO2 concentration 
#' by Plant type,.
#'
#'  @seealso \code{coplot}
#'  @export
#'  @importFrom stats lm

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
       headerPanel("CO2 Data"),
    # Application title
    titlePanel("Plot of CO2 Uptake"),
    # Sidebar with a slider input for number of plot rows
    sidebarLayout(
        sidebarPanel(
              h1('Customize Analytic Here!'),
              sliderInput("rows",
                        "Adjust the number of plot rows with slider!:",
                            min=1,
                        max=3,
                        value=2),
                        #                        min = 7,
#                        max = 45,
#                        value = 5),
              dateInput("date", "Pick a date for Beer study night:"),
              textInput(inputId="text1", label = "Input color for the points, e.g. red, blue, green"),
              h4('After slider is adjusted and color is picked - hit the GO button for new plot.'),
              actionButton("goButton", "Go!")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
               h1('Your Personal Analytic of CO2 Plant Uptake Data'),
               p('If you want to - change the color or plot row size - then hit go!'),
             
               h3('The agreed Beer study date is on:'),
               verbatimTextOutput("odate"),
               p('You chose the color:' ),
               textOutput("text1"),
               textOutput("text2"),
               p('Now hit go and see below!'),
            plotOutput("distPlot")
        )
    )
))
