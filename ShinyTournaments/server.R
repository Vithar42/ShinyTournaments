#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

        #data.in <- reactiveValues(values = daten)
        

        # Loads page for pools
        source("01_Teams.R", local = TRUE) 
        
        # Loads page for pools
        source("02_Pools.R", local = TRUE) 
        
        # Loads page for brackets
        source("03_Brackets.R", local = TRUE) 

})
