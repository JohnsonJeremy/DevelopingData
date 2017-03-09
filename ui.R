#
# This is the ui file for the shiny web app created for the Week4
#Final Assignment.  The requirements of the assignment were:
#  1. Some form of input (widget: textbox, radio button, checkbox, ...)
#  2. Some operation on the ui input in sever.R
#  3. Some reactive output displayed as a result of server calculations
#  4. You must also include enough documentation so that a novice user could use your application.
#  5. The documentation should be at the Shiny website itself. Do not post to an external link.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(  
  # Application title
  titlePanel("Creating the Data Product"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h6("Use the radio buttons to choose the distribution of interest"),
      radioButtons("DistChoice",
                   label="Distribtion Desired",
                   choices=c("Normal", "Weibull", "Beta", "Gamma")), 
      sliderInput("StanDev",
                   "Standard Deviation from Mean:",
                   min = -3,
                   max = 3,
                   value = 0,
                   step= 0.1),
      p("Use the slider to choose how many standard deviations from the Mean")
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       p("The plot shows the distribution selected and how much of the included distribition
         is to the left of the selected cut-off.  The user can get a visual indication of the 
         differences between distribution shapes and where the cut-off line will appear.")
    )
  )
))
