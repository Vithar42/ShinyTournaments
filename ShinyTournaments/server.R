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
        
        output$TeamList <- renderRHandsontable({
          
          team_table <- tibble(TeamName = seq(1, input$n_teams, 1)) %>%
            mutate(TeamName = "")
          
          rhandsontable(team_table, width = 300) %>%
            hot_cols(colWidths = 200)
          
        })
        
        # Loads page for pools
        source("01_Pools.R") 
        
        # Loads page for brackets
        source("02_Brackets.R") 

})
