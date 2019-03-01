#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

if(!("shiny" %in% rownames(installed.packages()))) {
  install.packages("shiny")
}
library(shiny)

if(!("ggplot2" %in% rownames(installed.packages()))) {
  install.packages("ggplot2")
}
library(ggplot2)

if(!("stats" %in% rownames(installed.packages()))) {
  install.packages("stats")
}
library(stats)


shinyServer(function(input, output) {


  output$distPlot <- renderPlot({
    y<-Orange$age
    x<-Orange$circumference
    reg_model = lm(y~x)
    x1<- input$circumference
    y1<- reg_model$coefficients[1]+reg_model$coefficients[2]*x1
    ggplot(Orange,aes(circumference, age,))+ geom_point()+geom_smooth(method = "lm")+ ggtitle("Age Vs Circumference Plot")+xlab("Circumference (mm)")+ylab("age (in days)")+geom_point(aes(x=x1, y=y1), colour="red",shape = 15,size = 3)
  })
  output$p <- renderText({
    y<-Orange$age
    x<-Orange$circumference
    reg_model = lm(y~x)
    x1<- input$circumference
    y1<- reg_model$coefficients[1]+reg_model$coefficients[2]*x1
    paste("The estimated age of the Orange tree is", ceiling(y1), "days")
  })


})
