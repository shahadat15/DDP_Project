#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

if(!("shiny" %in% rownames(installed.packages()))) {
  install.packages("shiny")
}
library(shiny)

if(!("markdown" %in% rownames(installed.packages()))) {
  install.packages("markdown")
}
library(markdown)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Predict age of an Orange Tree"),

  # Sidebar
  sidebarLayout(
    sidebarPanel(
       sliderInput("circumference",
                   "Circumference of Orange Tree (mm)",
                   min = 40,
                   max = 220,
                   value = 50)
    ),

    # Show a plot and output
    mainPanel(
       plotOutput("distPlot"),
       textOutput("p")
    )
  )
))
