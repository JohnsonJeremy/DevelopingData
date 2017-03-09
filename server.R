#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(shiny)
require(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    N<-10000
    
    switch(input$DistChoice,
           Normal = p<-rnorm(N),
           Weibull = p<-rweibull(N,1),
           Beta = p<-rbeta(N,1,1),
           Gamma = p<-rgamma(N,2))         
    target<-(sd(p) * input$StanDev)
    LSide<-round(100*pnorm(target),0)
    
    
    # draw the histogram with the specified number of bins
    ggplot(data.frame(p))+
      geom_histogram(aes(x=p, fill=..x..), binwidth=.1, alpha=0.5)+
      scale_fill_gradient(breaks=c(-6,target,6),low = "green", high = "blue")+
      geom_vline(xintercept = (mean(p)+target*mean(p)), color="red")+
      xlab(paste("Percent to the left of target: ",round(LSide,2),"%"))+
      ylab("")+
      theme(axis.title.y = element_blank(),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            legend.position = "none")+
      ggtitle("Probability Distribution Function")
    
  })
  
})
